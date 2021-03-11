pragma experimental SMTChecker;
contract A {
	uint[] a;
	function f() public {
		A.a.push(2);
		assert(A.a[A.a.length - 1] == 2);
		A.a.pop();
		// Fails
		assert(A.a.length > 0);
		assert(A.a.length == 0);
	}
}
// ----
// Warning 6328: (156-178): CHC: Assertion violation might happen here.
// Warning 4661: (156-178): BMC: Assertion violation happens here.
