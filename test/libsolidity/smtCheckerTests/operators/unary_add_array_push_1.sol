pragma experimental SMTChecker;
contract C {
	uint[] x;
	function f() public {
		require(x.length == 0);
		++x.push();
		assert(x.length == 1);
		assert(x[0] == 1); // should hold
		assert(x[0] == 42); // should fail
	}
}
// ----
// Warning 6328: (182-200): CHC: Assertion violation might happen here.
// Warning 4661: (182-200): BMC: Assertion violation happens here.
