// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Kebab {
    mapping(string => uint256) public funds;
    event Donation(string _donorid, string _recipientid, uint256 _amount);
    event Payment(
        string _payer,
        uint256 _amount,
        string _item,
        string _location
    );

    function donate(
        string memory _donorid,
        string memory _recipientid,
        uint256 _amount
    ) public payable {
        funds[_recipientid] += _amount;
        emit Donation(_donorid, _recipientid, _amount);
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
}
