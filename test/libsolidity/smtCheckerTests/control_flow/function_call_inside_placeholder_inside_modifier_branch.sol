pragma experimental SMTChecker;

contract C
{
	modifier m {
		if (true)
			_;
	}

	function f(address a) m public pure {
		if (true) {
			a = g();
			assert(a == address("atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqdruy9j"));
		}
	}
	function g() public pure returns (address) {
		address a;
		a = address("atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqdruy9j");
		return a;
	}
}
// ----
