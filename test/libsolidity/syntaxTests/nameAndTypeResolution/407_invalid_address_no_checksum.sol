contract C {
    function f() pure public {
        address x = 'lat1lg9le9lys3vyjnxds4lp4pwuj8mlqprw2zm444';
        x;
    }
}
// ----
// SyntaxError: (64-108): This looks like an address but has an invalid checksum, If this is not used as an address, please prepend '00'.For more information please see https://solidity.readthedocs.io/en/develop/types.html#address-literals
// TypeError: (52-108): Type literal_string "lat1lg9le9lys3vyjnxds4lp4pwuj8mlqprw2zm444" is not implicitly convertible to expected type address.
