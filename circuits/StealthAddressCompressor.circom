pragma circom 2.0.0;

include "./PointCompressor.circom";

template StealthAddressCompressor() {
  signal input H0Ax;
  signal input H0Ay;

  signal input H1Ax;
  signal input H1Ay;

  signal output signs;

  component calcH0Compressed = PointCompressor();
  calcH0Compressed.Ax <== H0Ax;
  calcH0Compressed.Ay <== H0Ay;


  component calcH1Compressed = PointCompressor();
  calcH1Compressed.Ax <== H1Ax;
  calcH1Compressed.Ay <== H1Ay;

  signs <== 2 * calcH0Compressed.sign + calcH1Compressed.sign;
}
