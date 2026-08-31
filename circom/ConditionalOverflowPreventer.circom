pragma circom 2.0.0;

include "../../node_modules/circomlib/circuits/comparators.circom";

template ConditionalOverflowPreventer(nCount) {
  signal input in;
  // we need to make sure that when staking we only allow user to stake positive amount
  signal input enabled;

  // constrain enabled to be boolean (0 or 1)
  enabled * (enabled - 1) === 0;

  var comparator = ((2 ** 252) - 1) \ nCount;
  // according to comments in comparators.circom we need to check that the input fits into 252 bits
  component calcOutBits = Num2Bits(252);
  calcOutBits.in <== in * enabled;

  component lt = LessThan(252);
  lt.in[0] <== in * enabled;
  lt.in[1] <== comparator;

  component forceEqualIfEnabled = ForceEqualIfEnabled();
  forceEqualIfEnabled.in[0] <== lt.out;
  forceEqualIfEnabled.in[1] <== 1;
  forceEqualIfEnabled.enabled <== enabled;
}

