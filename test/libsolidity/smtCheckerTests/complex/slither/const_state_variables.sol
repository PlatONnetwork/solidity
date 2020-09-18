pragma experimental SMTChecker;


contract A {

    address constant public MY_ADDRESS = 0xE0f5206BBD039e7b0592d8918820024e2a7437b9;
    address public myFriendsAddress = 0xc0ffee254729296a45a3885639AC7E10F9d54979;

    uint public used;
    uint public test = 5;

    uint constant X = 32**22 + 8;
    string constant TEXT1 = "abc";
    string text2 = "xyz";

    function setUsed() public {
        if (msg.sender == MY_ADDRESS) {
            used = test;
        }
    }
}


contract B is A {

    address public mySistersAddress = 0x999999cf1046e68e36E1aA2E0E07105eDDD1f08E;

    function () external {
        used = 0;
    }

    function setUsed(uint a) public {
        if (msg.sender == MY_ADDRESS) {
            used = a;
        }
    }
}

contract MyConc{

    uint constant A = 1;
    bytes32 should_be_constant = sha256('abc');
    uint should_be_constant_2 = A + 1;
    address not_constant = msg.sender;
    uint not_constant_2 = getNumber();
    uint not_constant_3 = 10 + block.number;

    function getNumber() public returns(uint){
        return block.number;
    }

}
// ----
// Warning: (773-792): This declaration shadows an existing declaration.
// TypeError: (89-131): Type int_const 1284...(41 digits omitted)...1449 is not implicitly convertible to expected type address.
// TypeError: (171-213): Type int_const 1101...(41 digits omitted)...7097 is not implicitly convertible to expected type address.
// TypeError: (535-577): Type int_const 8769...(40 digits omitted)...7422 is not implicitly convertible to expected type address.
