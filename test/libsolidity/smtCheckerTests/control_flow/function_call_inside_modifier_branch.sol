pragma experimental SMTChecker;

contract C
{
	modifier m(address a) {
		if (true) {
			a = g();
			_;
			assert(a == address("atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqdruy9j"));
		}
	}

	function f(address a) m(a) public pure {
	}
	function g() public pure returns (address) {
		address a;
		a = address("atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqdruy9j");
		return a;
	}
}
// ----
