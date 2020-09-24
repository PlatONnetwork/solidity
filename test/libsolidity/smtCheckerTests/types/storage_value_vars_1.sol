pragma experimental SMTChecker;
contract C
{
    address a;
    bool b;
    uint c;
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
        assert(a > 'atp1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqdruy9j' && b);
    }
}
// ----
// Warning: (383-444): Assertion violation happens here
