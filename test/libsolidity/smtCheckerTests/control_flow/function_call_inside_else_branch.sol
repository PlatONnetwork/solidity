pragma experimental SMTChecker;

contract C
{
	function f() public pure {
		if (true) {
		} else {
			address a = g();
			assert(a == address("atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqdruy9j"));
		}
	}
	function g() public pure returns (address) {
		address x;
		x = address("atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqdruy9j");
		return x;
	}
}
// ----
