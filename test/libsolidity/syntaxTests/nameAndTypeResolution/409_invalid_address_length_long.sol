contract C {
    function f() pure public {
        address x = 0xFA0bFc97E48458494Ccd857e1A85DC91F7F0046E0;
        x;
    }
}
// ----
// TypeError: (54-109): Type int_const 2284...(42 digits omitted)...9360 is not implicitly convertible to expected type address.
