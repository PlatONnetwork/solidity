contract C {
    function f() pure public {
        address x = 0xA0bFc97E48458494Ccd857e1A85DC91F7F0046E;
        x;
    }
}
// ----
// TypeError: (52-105): Type int_const 5735...(39 digits omitted)...4670 is not implicitly convertible to expected type address.
