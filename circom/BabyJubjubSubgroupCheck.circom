pragma circom 2.0.0;

include "../../node_modules/circomlib/circuits/babyjub.circom";
include "../../node_modules/circomlib/circuits/escalarmulany.circom";
include "../../node_modules/circomlib/circuits/comparators.circom";
include "./BabyJubjubConstants.circom";

// Checks (Ax, Ay) is on the curve AND in the prime-order subgroup (rejects cofactor points).
template BabyJubjubSubgroupCheck() {
    signal input Ax;
    signal input Ay;

    component onCurve = BabyCheck();
    onCurve.x <== Ax;
    onCurve.y <== Ay;

    // Blocks Ax == 0. EscalarMulAny always outputs (0,1) when p[0] == 0, so it would
    // wrongly accept the order-2 point (0,-1) in the check below without this.
    component axNonZero = IsZero();
    axNonZero.in <== Ax;
    axNonZero.out === 0;

    // In the subgroup iff l * point == identity (0, 1).
    var SUBORDER_BITS[251] = BABYJUB_SUBORDER_BITS_251();

    component multiplyByOrder = EscalarMulAny(251);
    for (var i = 0; i < 251; i++) {
        multiplyByOrder.e[i] <== SUBORDER_BITS[i];
    }
    multiplyByOrder.p[0] <== Ax;
    multiplyByOrder.p[1] <== Ay;

    multiplyByOrder.out[0] === 0;
    multiplyByOrder.out[1] === 1;
}
