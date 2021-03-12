pragma experimental SMTChecker;

contract C
{
	function f(address a, address b) public view {
		uint x = b.balance + 1000 lat;
		assert(a.balance > b.balance);
	}
}
// ----
// Warning 2072: (96-102): Unused local variable.
// Warning 4984: (105-125): CHC: Overflow (resulting value larger than 2**256 - 1) happens here.
// Warning 6328: (129-158): CHC: Assertion violation happens here.
