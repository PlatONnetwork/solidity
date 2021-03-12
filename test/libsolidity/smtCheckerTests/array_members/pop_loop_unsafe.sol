pragma experimental SMTChecker;

contract C {
	uint[] a;
	function f(uint l) public {
		for (uint i = 0; i < l; ++i) {
			a.push();
			a.pop();
		}
		a.pop();
	}
}
// ----
// Warning 2529: (135-142): CHC: Empty array "pop" happen here.
// Warning 4984: (112-115): CHC: Overflow (resulting value larger than 2**256 - 1) might happen here.
// Warning 2529: (150-157): CHC: Empty array "pop" might happen here.
