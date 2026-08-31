pragma circom 2.0.0;

include "../../node_modules/circomlib/circuits/escalarmulany.circom";
include "./StealthAddressCompressor.circom";
include "./BabyJubjubSubgroupCheck.circom";

template StealthAddressCalculator() {
    signal input H0Ax;
    signal input H0Ay;
    signal input spendingPublicKey[2];
    signal input nullifyingPrivateKey;
    signal input nullifyingPrivateKeyBits[250];

    signal output H1Ax;
    signal output H1Ay;
    signal output out;

    component h0SubgroupCheck = BabyJubjubSubgroupCheck();
    h0SubgroupCheck.Ax <== H0Ax;
    h0SubgroupCheck.Ay <== H0Ay;

    signal H1[2];
    H1 <== EscalarMulAny(250)(nullifyingPrivateKeyBits, [H0Ax, H0Ay]);

    component calcStealthAddressCompressed = StealthAddressCompressor();
    calcStealthAddressCompressed.H0Ax <== H0Ax;
    calcStealthAddressCompressed.H0Ay <== H0Ay;

    calcStealthAddressCompressed.H1Ax <== H1[0];
    calcStealthAddressCompressed.H1Ay <== H1[1];

    H1Ax <== H1[0];
    H1Ay <== H1[1];

    component calcRandomizedPublicKey = Poseidon(6);
    calcRandomizedPublicKey.inputs[0] <== calcStealthAddressCompressed.signs;
    calcRandomizedPublicKey.inputs[1] <== H0Ay;
    calcRandomizedPublicKey.inputs[2] <== H1[1];
    calcRandomizedPublicKey.inputs[3] <== spendingPublicKey[0];
    calcRandomizedPublicKey.inputs[4] <== spendingPublicKey[1];
    calcRandomizedPublicKey.inputs[5] <== nullifyingPrivateKey;
    out <== calcRandomizedPublicKey.out;
}
