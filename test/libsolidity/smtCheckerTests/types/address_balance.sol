pragma experimental SMTChecker;

contract C
{
	function f(address a, address b) public view {
		uint x = b.balance + 1000 lat;
		assert(a.balance > b.balance);
	}
}
// ----
// Warning: (96-102): Unused local variable.
// Warning: (105-114): Assertion checker does not yet support this expression.
// Warning: (105-114): Internal error: Expression undefined for SMT solver.
// Warning: (105-125): Underflow (resulting value less than 0) happens here
// Warning: (105-125): Overflow (resulting value larger than 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) happens here
// Warning: (96-125): Underflow (resulting value less than 0) happens here
// Warning: (96-125): Overflow (resulting value larger than 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) happens here
// Warning: (136-145): Assertion checker does not yet support this expression.
// Warning: (148-157): Assertion checker does not yet support this expression.
// Warning: (136-145): Internal error: Expression undefined for SMT solver.
// Warning: (148-157): Internal error: Expression undefined for SMT solver.
// Warning: (129-158): Assertion violation happens here
