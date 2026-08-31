pragma circom 2.0.0;

include "../../node_modules/circomlib/circuits/eddsaposeidon.circom";
include "./BabyJubjubSubgroupCheck.circom";

template SignatureVerifier() {

  signal input spendingPublicKey[2];
  signal input eddsaSignature[3];
  signal input signedMessageHash;

  component spendingPublicKeySubgroupCheck = BabyJubjubSubgroupCheck();
  spendingPublicKeySubgroupCheck.Ax <== spendingPublicKey[0];
  spendingPublicKeySubgroupCheck.Ay <== spendingPublicKey[1];

  component r8SubgroupCheck = BabyJubjubSubgroupCheck();
  r8SubgroupCheck.Ax <== eddsaSignature[0];
  r8SubgroupCheck.Ay <== eddsaSignature[1];

  component eddsaVerifier = EdDSAPoseidonVerifier();
  eddsaVerifier.enabled <== 1;
  eddsaVerifier.Ax <== spendingPublicKey[0];
  eddsaVerifier.Ay <== spendingPublicKey[1];
  eddsaVerifier.R8x <== eddsaSignature[0];
  eddsaVerifier.R8y <== eddsaSignature[1];
  eddsaVerifier.S <== eddsaSignature[2];
  eddsaVerifier.M <== signedMessageHash;
  
}