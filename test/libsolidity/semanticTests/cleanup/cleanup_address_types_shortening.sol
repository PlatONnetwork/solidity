contract C {
    function f() public pure returns (address r) {
        bytes21 x = 0x1122334455667788990011223344556677889900ff;
        bytes20 y;
        assembly {
            y := x
        }
        address z = address(y);
        assembly {
            r := z
        }
        require(z == 'lat1zy3rx3z4vemc3xgqzy3rx3z4vemc3xgqmrdy0t');
    }

    function g() public pure returns (address payable r) {
        bytes21 x = 0x1122334455667788990011223344556677889900ff;
        bytes20 y;
        assembly {
            y := x
        }
        address payable z = address(y);
        assembly {
            r := z
        }
        require(z == 'lat1zy3rx3z4vemc3xgqzy3rx3z4vemc3xgqmrdy0t');
    }
}

// ====
// compileViaYul: also
// compileToEwasm: also
// ----
// f() -> 0x1122334455667788990011223344556677889900
// g() -> 0x1122334455667788990011223344556677889900
