contract C {
    modifier m(uint _amount, uint _avail) { require(_avail >= _amount); _; }
    function f() m(1 atp, msg.value) public view {}
}
// ----
// Warning: (116-125): "msg.value" used in non-payable function. Do you want to add the "payable" modifier to this function?
