contract C {
    function f() pure public {
        address x = 'atp1lg9le9lys3vyjnxds4lp4pwuj8mlqprw2zm4tnttn';
        x;
    }
}
// ----
// TypeError: (52-111): Type literal_string "atp1lg9le9lys3vyjnxds4lp4pwuj8mlqprw2zm4tnttn" is not implicitly convertible to expected type address.
