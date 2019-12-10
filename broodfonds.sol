pragma solidity ^0.4.0;

// TODO: There currently is no incentive to call in better. A
// participant that calls in sick could be punished for the time being
// sick, e.g. by burning credits each month. This would be an
// incentive to callInBetter before one month has passed.
// This is currently the biggest problem with the contract, because it
// is a fundamental issue.

contract BroodFonds {
  // A participant is a member that can deposit and withdraw.
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

  // TODO: this helper should better be a simple summing method, since
  // that is (probably) cheaper than storing it in the State.
  uint public totalBalance;

  // Contains the list of participants in the state.
  // Note that there currently is no way to remove participants, nor to
  // alter an existing participant.
  // TODO: implement full CRUD on participants, but in such a way that
  // it is simple, clear and secure.
  mapping(address => Participant) public participants;

  // TODO: this helper should better be a simple summing method, since
  // that is (probably) cheaper than storing it in the State.
  Participant private participant;
  uint private _numParticipantsMax = 50;
  uint private _numParticipants = 0;

  // Set the chairperson on init.
  // Note that the chairman is not added as participant. This is by
  // design, so that a chairman can be an external entity managing this
  // contract.
  function BroodFonds() public {
    chairperson = msg.sender;
  }

  // Event emitted when a member calls in sick.
  // TODO: Add events for deposits, participant additions, withdrawals,
  // acknowledgements, denials etc.
  event CalledInSick(address caller);

  // Checks if the called is whitelisted as participant.
  modifier ifParticipant() {
    require(participants[msg.sender].exists);
    _;
  }

  // Checks if the caller is the chairperson.
  // TODO: an improvement that makes the contract less centralised, is
  // to allow any participant to modify the contract, not just an
  // allocated member. This, however, opens up many security
  // considerations and should probably be handled by an external
  // management contract. For example one that allows voting on changes.
  modifier ifChairperson() {
    require(msg.sender == chairperson);
    _;
  }

  // Checks if the deposit is of the right amount.
  // TODO: should check if this month's deposit has already been made
  // and deny more deposits.
  // TODO: implement the full table of possible deposit-amounts.
  modifier ifDepositCorrect() {
    require(msg.value == 100);
    _;
  }

  // Checks if the amount requested matches the amount that I am allowed
  // to get.
  // TODO: should use the full table of deposit amounts instead of
  // hardcoding 100 wei.
  modifier ifWithdrawalCorrect() {
    require(msg.value == 100 * 22);
    _;
  }

  // Chairperson may add new participants once.
  // Up to a maximum amount of participants.
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

  // Any participant can deposit 100 wei, once a month.
  // If a participant deposits, her credit will be increased.
  function deposit() public ifDepositCorrect ifParticipant payable {
    participant = participants[msg.sender];
    // Only allow one deposit per month;
    require(block.timestamp - participant.lastAccessed >= 2629800);
    participant.lastAccessed = block.timestamp;

    // Reset the participant's credit to the max credit;
    participant.credit = msg.value * 22;
    totalBalance = totalBalance + msg.value;
  }

  // A participant can call in sick. This adds a timestamp to the state
  // which starts counting down, so that one month later, the
  // participant can start withdrawing funds.
  // TODO: cast a vote on yourself when calling in sick.
  function callInSick() ifParticipant public {
    participants[msg.sender].calledInSick = block.timestamp;
    CalledInSick(msg.sender);
  }

  // A particpant that called in sick, can be voted on.
  // In order to withdraw funds, at least half of the (other) participants
  // need to acknowledge your sick-call.
  function acknowledgeSick(address _participant) ifParticipant public {
    require(participants[_participant].exists);
    participants[_participant].votes[msg.sender] = 1;
  }

  // A particpant that called in sick, can be voted on.
  // In order to withdraw funds, at least half of the (other) participants
  // need to acknowledge your sick-call.
  // A participant can either acknowledge, abstain (no vote) or deny. A
  // denial will substract from the votes.
  function denySick(address _participant) ifParticipant public {
    require(participants[_participant].exists);
    participants[_participant].votes[msg.sender] = -1;
  }

  // Once a participant is better, she can call in as being better.
  // All counters and votes will be reset.
  function callInBetter() ifParticipant public {
    participant = participants[msg.sender];
    participant.calledInSick = 0;
    // TODO: reset the votes mapping.
    // This is a bug!
  }

  // Allow a member to withdraw.
  // TODO: the voting is not reset in callInBetter, so we don't use it
  // here, yet: the entire voting is ignored until it is properly
  // implemented!
  function withdraw(uint amount) ifWithdrawalCorrect ifParticipant public {
    participant = participants[msg.sender];
    require((participant.calledInSick > 0) &&
            (participant.calledInSick <= block.timestamp - 2629800) &&
            (participant.credit >= amount) &&
            (totalBalance >= amount));

    participant.credit = participant.credit - amount;

    msg.sender.transfer(amount);
  }

  // Kill-switch to remove all funds.
  // TODO: instead of selfdestruct which will wire all the funds to the
  // manager, an additional layer could be added which wires all
  // remaining funds to all participants based on their personal credit
  // ratio. This, however is complex and a potential for bugs, so a
  // catch-all, simple kill-switch should remain in place.
  function kill() public ifChairperson {
    selfdestruct(chairperson);
  }
}
