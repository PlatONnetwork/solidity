contract C {
  function f() public pure returns (C c) {
    c = C(address("atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqz7xa8kl”));
  }
  function() external payable {
  }
}
// ----
// ParserError: (74-123): Expected string end-quote.
