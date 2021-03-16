pragma experimental SMTChecker;

contract A {
	uint public x = msg.value;
	constructor() {
		assert(x == 0); // can fail when A is constructed as part of C
	}
}

contract B {
	constructor() payable {
		assert(msg.value >= 0); // should hold
	}
}
contract C is A, B {
	constructor() A() B() payable {
		assert(msg.value >= 0); // should hold
	}
}

// ----
// Warning 6328: (93-107): CHC: Assertion violation happens here.