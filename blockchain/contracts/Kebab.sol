// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Kebab {
    mapping(string => uint256) public funds;
    event Donation(string _donorid, string _charityid, uint256 _amount);
    event Payment(
        string _charityid,
        uint256 _amount,
        string _item,
        string _location
    );

    function donate(
        string memory _donorid,
        string memory _charityid,
        uint256 _amount
    ) public payable {
        funds[_charityid] += _amount;
        emit Donation(_donorid, _charityid, _amount);
    }

    function pay(
        string memory _charityid,
        string memory _item,
        string memory _location,
        uint256 _amount
    ) public payable {
        require(funds[_charityid] >= _amount, "Insufficient funds");
        funds[_charityid] -= _amount;
        emit Payment(_charityid, _amount, _item, _location);
    }

    function tearDown() public {
        selfdestruct(payable(msg.sender));
    }
}
