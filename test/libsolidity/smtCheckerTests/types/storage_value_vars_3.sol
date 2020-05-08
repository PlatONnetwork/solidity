pragma experimental SMTChecker;
contract C
{
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
        assert(b == (a < 'lat1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqsqjqvzwx'));
    }

    function g() public view {
        require(a < 'lat1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqgqhtfnsy');
        assert(c >= 0);
    }
    address a;
    bool b;
    uint c;
}
