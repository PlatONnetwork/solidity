contract A {
    uint public x;
    receive () external payable { ++x; }
}
// ====
// compileViaYul: also
// ----
// x() -> 0
// ()
// x() -> 1
// (), 1 von
// x() -> 2
// x(), 1 von -> FAILURE
// (): hex"00" -> FAILURE
// (), 1 atp: hex"00" -> FAILURE
