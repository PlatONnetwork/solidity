contract C {
  function f() public view {
    address payable a = address(this);
    a;
  }
  fallback() external payable {
  }
}
// ----
// Warning 3628: (0-129): This contract has a payable fallback function, but no receive atp function. Consider adding a receive atp function.
