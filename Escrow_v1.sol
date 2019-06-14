pragma solidity ^0.4.0;

/// @author rajarajank

contract  EscrowImpl {

  address public buyer;
  address public seller;
  address public mediator;

  function EscrowImpl(address _seller, address _mediator) {
    buyer = msg.sender;
    seller = _seller;
    mediator = _mediator;
  }

function getBal() constant returns (uint) {
    return this.balance;
  }

  function paySeller() {
    if(msg.sender == buyer || msg.sender == mediator) {
    if(!seller.send(this.bal)) throw;
    }
  }

  function refundBuyer() {
    if(msg.sender == seller || msg.sender == mediator) {
    if(!buyer.send(this.balance)) throw;
    }
  }

// helper and kill contract.... 

}