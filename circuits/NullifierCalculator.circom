pragma circom 2.1.6;

include "../../node_modules/circomlib/circuits/poseidon.circom";
include "../../node_modules/circomlib/circuits/comparators.circom";

template NullifierCalculator() {
  signal input commitment;
  signal input signature;
  signal output out;

  component calcOriginalNullifier = Poseidon(2);
  calcOriginalNullifier.inputs[0] <== commitment;
  calcOriginalNullifier.inputs[1] <== signature;

  component calcCommitmentIsZero = IsZero();
  calcCommitmentIsZero.in <== commitment;

  out <== calcOriginalNullifier.out * (1 - calcCommitmentIsZero.out);
}
