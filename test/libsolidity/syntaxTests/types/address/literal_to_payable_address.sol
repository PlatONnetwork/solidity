contract C {
    function f() public pure {
        address payable a = address('atx1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq89qwkc');
        a = address(1);
        address payable b = 'atp1qy352eufqy352eufqy352eufqy352eufwxxg2v';
        b = 'atp1npm9gvssnpm9gvssnpm9gvssnpm9gvss0667nj';
    }
}
// ----
// ParserError: (60-67): Expected ';' but got 'payable'
