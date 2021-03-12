pragma experimental SMTChecker;

contract C {
	struct S {
		uint x;
		uint[] a;
	}
	S s;
	function f(uint _x) public {
		s.x = _x;
		s.a[0] = _x;
		assert(s.a[1] == s.a[0]);
	}
}
// ====
// SMTIgnoreCex: yes
// ----
// Warning 6328: (148-172): CHC: Assertion violation happens here.
// Warning 4661: (148-172): BMC: Assertion violation happens here.
