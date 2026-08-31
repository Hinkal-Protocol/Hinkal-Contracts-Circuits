pragma circom 2.1.6;

include "../../node_modules/circomlib/circuits/poseidon.circom";

template Signature() {
    signal input nullifyingPrivateKey;
    signal input commitment;
    signal output out;

    component hasher = Poseidon(2);
    hasher.inputs[0] <== nullifyingPrivateKey;
    hasher.inputs[1] <== commitment;
    out <== hasher.out;
}
