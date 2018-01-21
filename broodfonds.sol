pragma solidity ^0.4.0;

contract BroodFonds {
  struct Participant {
    uint256 calledInSick;
    uint256 credit;
    uint256 lastAccessed;
    bool exists;
    mapping(address => int8) votes;
  }

  // The chairperson is the creator. This makes the contract less
  // democratit and centralised. But it allows for some initial tweaking
  // and simple secutiry measures.
  address public chairperson;

  uint public totalBalance;
  mapping(address => Participant) public participants;

  Participant private participant;
  uint private _numParticipantsMax = 50;
  uint private _numParticipants = 0;

  function BroodFonds() public {
    chairperson = msg.sender;
  }

  event CalledInSick(address caller);

  modifier ifParticipant() {
    require(participants[msg.sender].exists);
    _;
  }

  modifier ifChairperson() {
    require(msg.sender == chairperson);
    _;
  }

  modifier ifDepositCorrect() {
    require(msg.value == 100);
    _;
  }

  modifier ifWithdrawalCorrect() {
    require(msg.value == 100 * 22);
    _;
  }

  function addParticipant(address _participant) public {
    require((msg.sender == chairperson) &&
            !participants[_participant].exists &&
            _numParticipants <= _numParticipantsMax
           );

    participants[_participant] = Participant({
      calledInSick: 0,
      credit: 0,
      lastAccessed: 0,
      exists: true
    });

    _numParticipants = _numParticipants + 1;
  }

  function deposit() public ifDepositCorrect ifParticipant payable {
    participant = participants[msg.sender];
    // Only allow one deposit per month;
    require(block.timestamp - participant.lastAccessed >= 2629800);
    participant.lastAccessed = block.timestamp;

    // Reset the participant's credit to the max credit;
    participant.credit = msg.value * 22;
    totalBalance = totalBalance + msg.value;
  }

  function callInSick() ifParticipant public {
    participants[msg.sender].calledInSick = block.timestamp;
    CalledInSick(msg.sender);
  }

  function acknowledgeSick(address _participant) ifParticipant public {
    require(participants[_participant].exists);
    participants[_participant].votes[msg.sender] = 1;
  }

  function denySick(address _participant) ifParticipant public {
    require(participants[_participant].exists);
    participants[_participant].votes[msg.sender] = -1;
  }

  function callInBetter() ifParticipant public {
    participant = participants[msg.sender];
    participant.calledInSick = 0;
  }

  function withdraw(uint amount) ifWithdrawalCorrect ifParticipant public {
    participant = participants[msg.sender];
    require((participant.calledInSick > 0) &&
            (participant.calledInSick <= block.timestamp - 2629800) &&
            (participant.credit >= amount) &&
            (totalBalance >= amount));

    participant.credit = participant.credit - amount;

    msg.sender.transfer(amount);
  }

  function kill() public ifChairperson {
    selfdestruct(chairperson);
  }
}
