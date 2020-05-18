contract test {
	function f() pure public {
		bytes32 x = sha3();
		x;
	}
	function g() public {
		suicide("lax1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqpxxvxfq");
	}
}
// ----
// Warning: (58-64): "sha3" has been deprecated in favour of "keccak256"
// Warning: (99-152): "suicide" has been deprecated in favour of "selfdestruct"
