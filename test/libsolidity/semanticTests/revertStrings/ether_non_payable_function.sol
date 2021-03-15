contract C {
        function f() public {}
}
// ====
// EVMVersion: >=byzantium
// revertStrings: debug
// compileViaYul: also
// ----
// f(), 1 lat -> FAILURE, hex"08c379a0", 0x20, 0x20, "Lat sent to non-payable function"
// () -> FAILURE, hex"08c379a0", 0x20, 53, "Contract does not have fallback ", "nor receive functions"
