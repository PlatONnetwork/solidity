pragma experimental SMTChecker;

contract C
{
	function f() public pure {
		if (true) {
			address a = g();
			assert(a == address("atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqdruy9j"));
		}
		if (true) {
			address a = h();
			assert(a == address("atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqdruy9j"));
		}

	}
	function g() public pure returns (address) {
		address a;
		a = address("atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqdruy9j");
		return a;
	}
	function h() public pure returns (address) {
		address a;
		return a;
	}

}
// ----
