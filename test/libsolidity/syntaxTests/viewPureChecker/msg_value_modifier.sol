contract C {
    modifier m(uint _amount, uint _avail) { require(_avail >= _amount); _; }
    function f() m(1 lat, msg.value) public pure {}
}
// ----
// TypeError: (116-125): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
