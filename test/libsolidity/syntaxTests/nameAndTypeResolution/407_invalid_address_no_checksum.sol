contract C {
    function f() pure public {
        address x = 'lat1lg9le9lys3vyjnxds4lp4pwuj8mlqprw2zm444';
        x;
    }
}
// ----
// TypeError: (52-108): Type literal_string "lat1lg9le9lys3vyjnxds4lp4pwuj8mlqprw2zm444" is not implicitly convertible to expected type address.
