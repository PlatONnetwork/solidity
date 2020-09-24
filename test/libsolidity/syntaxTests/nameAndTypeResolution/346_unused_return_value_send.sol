contract test {
    function f() public {
        address("atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqjt84lrv").send(1);
    }
}
// ----
// Warning: (50-111): Failure condition of 'send' ignored. Consider using 'transfer' instead.
