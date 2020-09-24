contract C {
    function f() public view returns (address payable a, address b) {
        (address c, address payable d) = (address(this), address("atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqdruy9j"));
        (a,b) = (d,c);
    }
}
