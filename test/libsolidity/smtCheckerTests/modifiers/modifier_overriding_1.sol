pragma experimental SMTChecker;

abstract contract A {
	uint s;

	function f() public mod(s) {}
	modifier mod(uint x) virtual;
}

contract B is A {
	modifier mod(uint x) override {
		require(x == 42);
		_;
		assert(x == 42); // should hold
		assert(x == 0); // should fail
	}

	function set(uint x) public {
		s = x;
	}
}
// ----
// Warning 6328: (242-256): CHC: Assertion violation happens here.