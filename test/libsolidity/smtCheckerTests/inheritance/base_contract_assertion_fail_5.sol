pragma experimental SMTChecker;

contract A {
	uint x;
	function f() internal virtual {
		v();
		assert(x == 0); // should hold
		assert(x == 2); // should fail
	}
	function v() internal virtual {
		x = 0;
	}
}

contract B is A {
	function f() internal virtual override {
		super.f();
	}
}

contract C is B {
	function g() public {
		x = 1;
		f();
	}
	function v() internal override {
		x = 2;
		super.v();
	}
}
// ----
// Warning 6328: (130-144): CHC: Assertion violation happens here.