contract c {
    constructor() public {
        a = 115792089237316195423570985008687907853269984665640564039458 atp;
    }
    uint256 a;
}
// ----
// TypeError 7407: (52-116): Type int_const 1157...(70 digits omitted)...0000 is not implicitly convertible to expected type uint256.
// Warning 2462: (17-123): Visibility for constructor is ignored. If you want the contract to be non-deployable, making it "abstract" is sufficient.
