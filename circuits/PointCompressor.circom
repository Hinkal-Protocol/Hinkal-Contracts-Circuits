pragma circom 2.0.0;

include "../../node_modules/circomlib/circuits/bitify.circom";
include "../../node_modules/circomlib/circuits/pointbits.circom";

template PointCompressor() {
  signal input Ax;
  signal input Ay;

  signal output sign;

  component calcPoint2Bits = Point2Bits_Strict();
  calcPoint2Bits.in[0] <== Ax;
  calcPoint2Bits.in[1] <== Ay;
  // we don't actually need any other outputs, the compressed encoding is sign * (2 ** 255) + Ay;
  sign <== calcPoint2Bits.out[255];
}
