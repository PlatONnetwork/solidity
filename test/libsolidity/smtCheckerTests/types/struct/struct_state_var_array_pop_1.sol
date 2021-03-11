pragma experimental SMTChecker;

contract C {
	struct S {
		uint x;
		uint[] a;
	}
	S s;
	function f(uint _x) public {
		s.a.pop();
		s.a.length;
		s.a.push();
		s.x = _x;
		s.a.pop();
		s.a.push();
		s.a.push();
		s.a[0] = _x;
		assert(s.a[1] == s.a[0]);
		s.a.pop();
		s.a.pop();
	}
}
// ----
// Warning 2529: (121-130): CHC: Empty array "pop" might happen here.
// Warning 6328: (230-254): CHC: Assertion violation might happen here.
// Warning 4661: (230-254): BMC: Assertion violation happens here.
