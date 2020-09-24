pragma experimental "v0.5.0";
contract test {
	function f() pure public {
		bytes32 x = sha3('atx1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqp6n5mt2');
		x;
	}
	function g() public {
		suicide('atx1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqp6n5mt2');
	}
}
// ----
// TypeError: (88-138): "sha3" has been deprecated in favour of "keccak256"
// TypeError: (88-138): This function only accepts a single "bytes" argument. Please use "abi.encodePacked(...)" or a similar function to encode the data.
// TypeError: (88-138): The provided argument of type address is not implicitly convertible to expected type bytes memory.
// TypeError: (173-226): "suicide" has been deprecated in favour of "selfdestruct"
