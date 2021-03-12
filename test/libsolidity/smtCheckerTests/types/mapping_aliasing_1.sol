pragma experimental SMTChecker;

contract C
{
	mapping (uint => uint) a;
	mapping (uint => uint) b;

	function f(uint x) public {
		a[1] = x;
		b[1] = x;
		a[1] = 2;
		mapping (uint => uint) storage c = a;
		assert(c[1] == 2);
		// False negative! Needs aliasing.
		assert(a[1] == b[1]);
	}
}
// ====
// SMTIgnoreCex: yes
// ----
// Warning 6328: (266-286): CHC: Assertion violation happens here.
// Warning 4661: (266-286): BMC: Assertion violation happens here.
