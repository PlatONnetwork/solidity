contract C {
    modifier tryCircumvent {
        if (false) _; // avoid the function, we should still not accept lat
    }
    function f() tryCircumvent public returns (uint) {
        return msgvalue();
    }
    function msgvalue() internal returns (uint) {
        return msg.value;
    }
    // TODO: remove this helper function once isoltest supports balance checking
    function balance() external returns (uint) {
        return address(this).balance;
    }
}
// ====
// compileViaYul: also
// ----
// f(), 27 von -> FAILURE
// balance() -> 0
