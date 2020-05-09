contract C {
    function f() pure public {
        address x = 'lat1pg9le9lys3vyjnxds4lp4pwuj8mlqprwguzs9';
        x;
    }
}
// ----
// TypeError: (52-107): Type literal_string "lat1pg9le9lys3vyjnxds4lp4pwuj8mlqprwguzs9" is not implicitly convertible to expected type address.
