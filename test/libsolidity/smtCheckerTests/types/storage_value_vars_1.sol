pragma experimental SMTChecker;
contract C
{
    address a;
    bool b;
    uint c;
    function f(uint x) public {
        if (x == 0)
        {
            a = 'lat1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqgqhtfnsy';
            b = true;
        }
        else
        {
            a = 'lat1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqsqjqvzwx';
            b = false;
        }
        assert(a > 'lat1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq542u6a' && b);
    }
}
// ----
// Warning: (366-427): Assertion violation happens here
