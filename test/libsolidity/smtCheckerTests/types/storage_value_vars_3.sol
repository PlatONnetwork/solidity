pragma experimental SMTChecker;
contract C
{
    function f(uint x) public {
        if (x == 0)
        {
            a = 'atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqgqwalt0t';
            b = true;
        }
        else
        {
            a = 'atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqsqtk663f';
            b = false;
        }
        assert(b == (a < 'atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqsqtk663f'));
    }

    function g() public view {
        require(a < 'atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqgqwalt0t');
        assert(c >= 0);
    }
    address a;
    bool b;
    uint c;
}
