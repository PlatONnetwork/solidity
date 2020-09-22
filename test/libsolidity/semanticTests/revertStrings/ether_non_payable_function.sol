contract C {
	function f() public {}
}
// ====
// EVMVersion: >=byzantium
// revertStrings: debug
// ----
// f(), 1 lat -> FAILURE, hex"08c379a0", 0x20, 0x20, "Lat sent to non-payable function"
// () -> FAILURE, 3963877391197344453575983046348115674221700746820753546331534351508065746944, 862718293348820473429344482784628181556388621521298319395315527974912, 0x35436f6e747261637420646f6573206e6f7420686176652066616c6c62, 44050003533197497889603156934101771025014898666797368672603377860743442464768
// Warning: The call to "()" returned 
//  [8,c3,79,a0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
//  [0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
//  [0,0,0,35,43,6f,6e,74,72,61,63,74,20,64,6f,65,73,20,6e,6f,74,20,68,61,76,65,20,66,61,6c,6c,62]
//  [61,63,6b,20,6e,6f,72,20,72,65,63,65,69,76,65,20,66,75,6e,63,74,69,6f,6e,73,0,0,0,0,0,0,0]
