pragma experimental SMTChecker;

contract C
{
	function f(address a) public pure {
		require(a != address("atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqdruy9j"));
		assert(a != address("atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqdruy9j"));
	}
}
// ----
