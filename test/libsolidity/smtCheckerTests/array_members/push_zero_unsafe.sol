pragma experimental SMTChecker;

contract C {
	uint[] a;
	function f() public {
		a.push();
		assert(a[a.length - 1] == 100);
	}
}
// ----
// Warning 6328: (94-124): CHC: Assertion violation might happen here.
// Warning 4661: (94-124): BMC: Assertion violation happens here.
