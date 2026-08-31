pragma circom 2.0.0;

include "ConditionalOverflowPreventer.circom";

template OverflowPreventer(nCount) {
  signal input in;

  component conditionalOverflowPreventer = ConditionalOverflowPreventer(nCount);
  conditionalOverflowPreventer.in <== in;
  conditionalOverflowPreventer.enabled <== 1;
}
