pragma experimental SMTChecker;

contract C
{
	function f() public view {
		require(msg.sender != address("atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqdruy9j"));
		address a = msg.sender;
		address b = msg.sender;
		assert(a == b);
	}
}
// ----
