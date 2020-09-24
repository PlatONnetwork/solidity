contract c {
    modifier mod1(uint a) { if (msg.sender == address("atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq2qjetgz")) _; }
    modifier mod2 { if (msg.sender == address("atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq2qjetgz")) _; }
    function f() public mod1(7) mod2 { }
}
// ----
