pragma experimental SMTChecker;
contract C {
	function f(int x, int y) public pure returns (int) {
		require(y != 0);
		return x / y;
	}
}
// ----
// Warning 4984: (127-132): CHC: Overflow (resulting value larger than 0x80 * 2**248 - 1) happens here.