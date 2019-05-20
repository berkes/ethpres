pragma solidity ^0.5.1;

contract HelloMyNameIs {
  string name;
  address issuer;

  constructor() public {
    issuer = msg.sender;
  }

  function getName() public view returns(string memory) {
    return name;
  }

  function setName(string memory newName) public returns(string memory) {
    require(issuer == msg.sender) ;
    name = newName;
    return name;
  }
}
