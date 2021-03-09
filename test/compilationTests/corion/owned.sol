pragma solidity >=0.0;

contract ownedDB {
    address private owner;

    function replaceOwner(address newOwner) external returns(bool) {
        /*
            Owner replace.

            @newOwner   Address of new owner.
        */
        require( isOwner() );
        owner = newOwner;
        return true;
    }

    function isOwner() internal returns(bool) {
        /*
            Check of owner address.

            @bool   Owner has called the contract or not
        */
        if ( owner == address('lat1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq542u6a') ) {
            return true;
        }
        return owner == msg.sender;
    }
}
