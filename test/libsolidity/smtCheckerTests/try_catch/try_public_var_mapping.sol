pragma experimental SMTChecker;

contract C {
	mapping (uint => uint[]) public m;

	constructor() {
		m[0].push();
		m[0].push();
		m[0][1] = 42;
	}

	function f() public view {
		try this.m(0,1) returns (uint y) {
			assert(y == m[0][1]); // should hold
		}
		catch {
			assert(m[0][1] == 42); // should hold
			assert(m[0][1] == 1); // should fail
		}
	}
}
// ----
// Warning 6328: (313-333): CHC: Assertion violation might happen here.
// Warning 4661: (313-333): BMC: Assertion violation happens here.