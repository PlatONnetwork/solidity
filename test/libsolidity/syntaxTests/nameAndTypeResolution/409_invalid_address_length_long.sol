contract C {
    function f() pure public {
        address x = 'lat15zlujljggkzffnxc2ls6shwfralsq3hq00psx';
        x;
    }
}
// ----
// TypeError: (52-107): Type literal_string "lat15zlujljggkzffnxc2ls6shwfralsq3hq00psx" is not implicitly convertible to expected type address.
