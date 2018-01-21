pragma solidity ^0.4.0;

contract HelloMyNameIs {
  string name;
  address issuer;

  function HelloMyNameIs() public {
    issuer = msg.sender;
  }

  modifier ifIssuer () {
    require(issuer == msg.sender) ;
    _;
  }

  function getName() public constant returns(string) {
    return name;
  }

  function setName(string newName) ifIssuer public returns(string) {
    name = newName;
    return name;
  }
}
