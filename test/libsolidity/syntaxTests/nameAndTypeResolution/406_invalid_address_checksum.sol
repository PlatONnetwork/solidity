contract C {
    function f() pure public {
        address x = 'lat1lg9le9lys3vyjnxds4lp4pwuj8mlqprw2zm4tnttn';
        x;
    }
}
// ----
// TypeError: (52-111): Type literal_string "lat1lg9le9lys3vyjnxds4lp4pwuj8mlqprw2zm4tnttn" is not implicitly convertible to expected type address.
