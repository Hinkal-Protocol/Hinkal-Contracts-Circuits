pragma circom 2.1.6;

include "./MerkleRootCalculator.circom";
include "./OverflowPreventer.circom";
include "./StealthAddressCalculator.circom";
include "./OriginalCommitmentCalculator.circom";
include "./NullifierCalculator.circom";
include "./SignatureVerifier.circom";
include "./Signature.circom";
include "../../node_modules/circomlib/circuits/bitify.circom";

// tokenCount: number of token types
// inputCount: number of inputs per token type
// outputCount: number of outputs per token type
// treeDepth: depth of the merkle tree

// public params: 
// rootHashHinkal, signedMessageHash, 
// erc20TokenAddresses, amountChanges, outTimeStamp, inNullifiers, outCommitments, 
// calldataHash, message,
// outH1Ax, outH1Ay, H0Ax, H0Ay, outStealthAddress

// private params:
// spendingPublicKey, eddsaSignature, nullifyingPrivateKey, messageSeed
// inAmounts, inH0Ax, inH0Ay, inTimeStamps, inCommitmentSiblings, inCommitmentSiblingSides,
// outAmounts, outPublicKeys, 

template MainEVMCircuit(tokenCount,inputCount, outputCount, treeDepth) {
  signal input rootHashHinkal;

  signal input spendingPublicKey[2]; // In EdDsa public key is a point in BJJ curve
  signal input eddsaSignature[3]; // EdDsa signature consists of BJJ point and scalar
  signal input signedMessageHash; // signed message hash
  signal input nullifyingPrivateKey;

  signal input erc20TokenAddresses[tokenCount];
  signal input amountChanges[tokenCount];

  signal input inAmounts[tokenCount][inputCount];
  signal input inH0Ax[tokenCount][inputCount];
  signal input inH0Ay[tokenCount][inputCount];
  signal input inTimeStamps[tokenCount][inputCount];
  signal input inNullifiers[tokenCount][inputCount];
  signal input inCommitmentSiblings[tokenCount][inputCount][treeDepth];
  signal input inCommitmentSiblingSides[tokenCount][inputCount][treeDepth]; // left = 0, right = 1

  signal input outAmounts[tokenCount][outputCount];
  signal input outTimeStamp;
  signal input outPublicKeys[tokenCount][outputCount];
  signal input outCommitments[tokenCount][outputCount];

  signal input calldataHash;

  signal input messageSeed;

  signal input H0Ax; // for creating a stealth address
  signal input H0Ay; // for creating a stealth address
  signal output outH1Ax;
  signal output outH1Ay;
  signal output outStealthAddress;

  signal output message;

  component calcInPublicKeys[tokenCount][inputCount];
  component calcCommitment[tokenCount][inputCount];
  component calcSignature[tokenCount][inputCount];
  component calcNullifier[tokenCount][inputCount];

  component calcOutCommitment[tokenCount][outputCount];

  component calcTransactionRootHash[tokenCount][inputCount];
  component calcEqual[tokenCount][inputCount];

  component preventInOverflow[tokenCount][inputCount];
  component preventOutOverflow[tokenCount][outputCount];

  component nullifyingPrivateKeyBits = Num2Bits(250);
  nullifyingPrivateKeyBits.in <== nullifyingPrivateKey;

  component stealthAddressCalculator = StealthAddressCalculator();
  stealthAddressCalculator.H0Ax <== H0Ax;
  stealthAddressCalculator.H0Ay <== H0Ay;
  stealthAddressCalculator.spendingPublicKey <== spendingPublicKey;
  stealthAddressCalculator.nullifyingPrivateKey <== nullifyingPrivateKey;
  stealthAddressCalculator.nullifyingPrivateKeyBits <== nullifyingPrivateKeyBits.out;

  outH1Ax <== stealthAddressCalculator.H1Ax;
  outH1Ay <== stealthAddressCalculator.H1Ay;
  outStealthAddress <== stealthAddressCalculator.out;

  // verifying signature
  component sigVerifier = SignatureVerifier();
  sigVerifier.spendingPublicKey <== spendingPublicKey;
  sigVerifier.eddsaSignature <== eddsaSignature;
  sigVerifier.signedMessageHash <== signedMessageHash;

  // pinning message to seed
  message <== Poseidon(1)([messageSeed]);

	for (var i = 0; i < tokenCount; i++) {
      // 0) iterate over all token types
      var inTotal = 0;
      var outTotal = 0;

      for(var j=0; j< inputCount; j++) {

        calcInPublicKeys[i][j] = StealthAddressCalculator();
        calcInPublicKeys[i][j].spendingPublicKey <== spendingPublicKey;
        calcInPublicKeys[i][j].nullifyingPrivateKey <== nullifyingPrivateKey;
        calcInPublicKeys[i][j].nullifyingPrivateKeyBits <== nullifyingPrivateKeyBits.out;
        calcInPublicKeys[i][j].H0Ax <== inH0Ax[i][j];
        calcInPublicKeys[i][j].H0Ay <== inH0Ay[i][j];

        // 1) Calculating Commitments for Input UTXOs
        calcCommitment[i][j] = OriginalCommitmentCalculator();
        calcCommitment[i][j].amount <== inAmounts[i][j];
        calcCommitment[i][j].erc20TokenAddress <== erc20TokenAddresses[i];
        calcCommitment[i][j].publicKey <== calcInPublicKeys[i][j].out;
        calcCommitment[i][j].timeStamp <== inTimeStamps[i][j];

        preventInOverflow[i][j] = OverflowPreventer(inputCount);
        preventInOverflow[i][j].in <== inAmounts[i][j];

        // 2) Calculating Nullifier from commitment and signature
        calcSignature[i][j] = Signature();
        calcSignature[i][j].nullifyingPrivateKey <== nullifyingPrivateKey;
        calcSignature[i][j].commitment <== calcCommitment[i][j].out;

        calcNullifier[i][j] = NullifierCalculator();
        calcNullifier[i][j].commitment <== calcCommitment[i][j].out;
        calcNullifier[i][j].signature <== calcSignature[i][j].out;

        // 3) Checking that nullifier is legit
        inNullifiers[i][j] === calcNullifier[i][j].out;

        // 4) Calculating Transaction Root Hash
        calcTransactionRootHash[i][j] = MerkleRootCalculator(treeDepth);
        calcTransactionRootHash[i][j].inCommitment <== calcCommitment[i][j].out;
        for (var k = 0; k < treeDepth; k++) {
          calcTransactionRootHash[i][j].commitmentSiblings[k] <== inCommitmentSiblings[i][j][k];
          calcTransactionRootHash[i][j].commitmentSiblingSides[k] <== inCommitmentSiblingSides[i][j][k];
        }

        // 5) Checking that transaction root hash is legit
        calcEqual[i][j] = ForceEqualIfEnabled();
        calcEqual[i][j].in[0] <== calcTransactionRootHash[i][j].rootHash;
        calcEqual[i][j].in[1] <== rootHashHinkal;
        calcEqual[i][j].enabled <== inAmounts[i][j];
        inTotal += inAmounts[i][j];
      }

    for(var j=0; j< outputCount; j++) {
      calcOutCommitment[i][j] = OriginalCommitmentCalculator();
      calcOutCommitment[i][j].amount <== outAmounts[i][j]; // if outAmount is negative, than this line will throw error
      calcOutCommitment[i][j].erc20TokenAddress <== erc20TokenAddresses[i];
      calcOutCommitment[i][j].publicKey <== outPublicKeys[i][j];
      calcOutCommitment[i][j].timeStamp <== outTimeStamp;

      // Checking that output commitment is legit
      calcOutCommitment[i][j].out === outCommitments[i][j];

      preventOutOverflow[i][j] = OverflowPreventer(outputCount);
      preventOutOverflow[i][j].in <== outAmounts[i][j];
      outTotal += outAmounts[i][j];
    }

      // for each token type, the sum of refund and swapped amount should be equal to the sum of input amounts
      inTotal + amountChanges[i] === outTotal;
	}

  component distinctErc20AddressChecks[tokenCount * (tokenCount-1)/2];
  var index = 0;
  for (var i =0; i< tokenCount-1;i++){
    for (var j = i+1; j< tokenCount; j++)
    {
      distinctErc20AddressChecks[index] = IsEqual();
      distinctErc20AddressChecks[index].in[0] <== erc20TokenAddresses[i];
      distinctErc20AddressChecks[index].in[1] <== erc20TokenAddresses[j];
      distinctErc20AddressChecks[index].out === 0;
      index++;
    }
  }

}
