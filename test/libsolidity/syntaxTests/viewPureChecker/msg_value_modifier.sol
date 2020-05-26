contract C {
    modifier m(uint _amount, uint _avail) { require(_avail >= _amount); _; }
    function f() m(1 lat, msg.value) public pure {}
}
// ----
// Warning: (116-125): "msg.value" used in non-payable function. Do you want to add the "payable" modifier to this function?
// TypeError: (116-125): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
