contract C {
    function f() public view returns (address payable a, address b) {
        (address c, address payable d) = (address(this), payable('lat1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq542u6a'));
        (a,b) = (c,d);
    }
}
// ----
// TypeError 7407: (212-217): Type tuple(address,address payable) is not implicitly convertible to expected type tuple(address payable,address).
