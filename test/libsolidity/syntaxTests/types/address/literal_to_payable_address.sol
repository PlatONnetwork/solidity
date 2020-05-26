contract C {
    function f() public pure {
        address payable a = address('lax1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqmscn5j');
        a = address(1);
        address payable b = 'lat1qy352eufqy352eufqy352eufqy352eufhsss4r';
        b = 'lat1npm9gvssnpm9gvssnpm9gvssnpm9gvsskvvxva';
    }
}
// ----
// ParserError: (60-67): Expected ';' but got 'payable'
