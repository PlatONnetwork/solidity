contract test {
    function f() public {
        address("atx1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqjppf4sx").call.value(2)("abc");
    }
}
// ----
// Warning: (50-124): Return value of low-level calls not used.
