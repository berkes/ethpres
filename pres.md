---
author:
  - Bèr `berkes` Kessels
title: dApp en Blockchain Development
subtitle: "Een workshop waarin we de wereld van Smart Contracts op de Ethereum blockchain induiken."
abstract: "In deze  workshop bouwen ons eigen crowdfundplatform voor Feesten en Partijen."
keywords:
  - Blockchain
  - Ethereum
  - Smart Contracts
  - Workshop
lang: nl
---

# Over
## Over Bèr Kessels

* Bèr Kessels
* @berkes, github.com/berkes
* Ruby, Blockchain en Open Source developer
* Founder van PlaceBazaar

## Over de presentatie

* Staat op: [git.webschuur.com/berkes/ethpres](https://git.webschuur.com/berkes/ethpres)
* URL komt aan het einde nog eens voorbij.

## Notes en prikbord

https://beta.etherpad.org/p/fundfissa

## Over mij en Blockchain

* April 2011 begonnen met Bitcoin
* In bouw aan een startup, placebazaar.org. Bouw dit op Ethereum

## Inhoud

* Welk probleem lost Blockchain op?
* Wat is een dApp (Web 3.0)?
* Wat is Ethereum?
* Smart Contract: simpele voorbeelden
* Smart Contract: complexer voorbeeld

## Gedistribueerd:

## Centraal, Decentraal, Gedistribueerd
![Centraal vs Decentraal vs Gedistribueerd](centraal-decentraal-distribueerd.jpeg)

## Bijvoorbeeld contant geld:

Gedistribueerd (cash) is:

* Trustless (vertrouwenloos).
* Permissionless (vergunningsvrij)
* Uncensorable (oncensureerbaar)
* Verifiable (controleerbaar)

## Dat komt voort uit "Distributed"

* Geen centraal "point of failure"
* Kan wereldwijd opschalen
* Heet ook wel "Peer to Peer, P2P"

## Waarom werkt muntgeld?

Ideeën?

## En hoe moet dat digitaal?

* Tot 2008 werd dit onmogelijk geacht
* Altijd via centrale autoriteiten

## Centraal:

## Een blockchain!

Een onveranderlijk, gedistribueerd grootboek!

## Onveranderlijk? (Immutable)

* Data kan niet aangepast worden nadat het in het grootboek is weggeschreven
* Data is controleerbaar
* Er is consensus nodig om het grootboek bij te werken

## Wat is consensus?

* "Iedereen" komt overeen wat de huidige status is
    + Bijvoorbeeld: wat zijn de saldi van iedereens rekeningen

## Distributed

* Complex
* Maar zonder centrale partijen!

# Ethereum

* Ethereum is een decentraal platform ontworpen om software op te draaien
    + geen single point of control/failure
    + censorship resistant
* Gedistribueerde state machine
    + (block met) transactions == state transition function
    + Of gewoon een decentrale computer
* Software: Smart Contracts

# Wat is een Smart Contract?

* **geen** contract in de zin van een papier met kleine
    lettertjes juridische taal en handtekeningen
* Een stuk software
* Een "class" met functies die code uitvoert

## Code
~~~javascript
pragma solidity ^0.4.0;

contract HelloMyNameIs {
  string name;
  address issuer;

  function HelloMyNameIs() public {
    issuer = msg.sender;
  }

  function getName() public constant returns(string) {
    return name;
  }

  function setName(string newName) public returns(string) {
    require(issuer == msg.sender) ;
    name = newName;
    return name;
  }
}
~~~

# Wat is een dApp (Web 3.0)?

* Een interface voor een of meerdere Smart Contracts.
* Een applicatie die Smart Contracts gebruikt.

## De voordelen?

* **Geen centraal controlerende instantie**. Je appartement verhuren is tussen
    jou en de huurder. AirBnB of andere "Siren Servers" hebben daarin
    geen plek.
* **Data eigendom**. Je blijft eigenaar van jou data. Jij kunt deze
    verkopen. Of niet.
* **Minder heftige hacks**. Decentraal betekent dat een hacker het hele
    netwerk moet overnemen om toegang te krijgen, ipv een centrale server.
* **Permissionless**. Of je nu een onderdrukte minderheid, of gezochte
    terrorist bent, niemand kan je toegang onthouden tot diensten.

## Security

* Het draait voor eeuwig: Kill-switch.
* Logical errors: de letter van de wet.
* Programming errors: de letter van de wet.

## Smart Contract proberen

* Ga naar [HelloMyNameIsOpen](https://rinkeby.etherscan.io/address/0xe002102bcdf8ea289f5e3cbed4ca1d6063b45fc5) (link op eterpad)
* Onder "Read" bekijk de huidige naam.
* Onder "Write" connect met metamask.
* Verander de naam. Kies  "write". Bevestig in MetaMask.
* Bekijk transactions. Bekijk de naam.

## Zelf een Smart Contract releasen

# Remix IDE

### Steps:

* https://remix.ethereum.org
* Verbind met MetaMask.
* knip/plak het contract "HelloMyNameIs" naar remix IDE: link in etherpad
* Compile, Create.
* Interact.

### Gebruik het contract:

* Alle functies hebben een invoer: knop of knop+textfield
* schrijf bijvoorbeeld `"World"` naast `setName`. Let op de `"`
* Gebruik nu `getName` om de naam uit te lezen
* Speel wat rond.
* Post je **contract**-adres op de etherpad

## Interact met ander contract

* Laad het contract van één van je collega's in.
* gebruik hiervoor `At Address` formulier.
* Probeer `setName`, merk de foutmelding op.

# What we just did

## Compile en deploy

* Met de "Web3.js" API compileren en deployen.
* Dit wordt een "account": een entiteit met een wallet, op een adres.
* Twee soorten accounts: contracts (zonder private key) en users (met
    private key)

## Interactie via formulieren

* Contract heeft een Interface (ABI).
* Een client kan dan functies aanroepen op het contract.
* Iedere interactie met state-change is een *transactie*.

## Clients

* **CLI:** geth, web3/node.js, solc
* **Officiëel:** mist wallet
* **Web:** remix IDE
* **dApp:** JS op jou site
* En vele andere wallets

## Transacties

* Transactie is een verandering, write, op blockchain uitvoeren.
* Succesvol aanroepen van `setName` is een transactie.
* Leesacties zijn `gratis` en instant.
* Transacties duren even.

## Gas

* Draaien van code kost wat:
![details](details.png)
* Note `gas`
* Alle `OPCODES` hebben vooraf bepaalde gas-cost

## Gas, Ethers, Gwei

* Ether is betaalmiddel
* Uitgedrukt in "wei", kleinst deelbare eenheid
* 1e18 wei = 1 ether
* gas is dynamisch, 1 gas kost X wei
  [ethgasstation.info](https://ethgasstation.info/)

## Operaties kosten Gas

* Iedere operatie kost gas
* Sommige operaties zijn duur, andere goedkoop
* Wanneer er te weinig gas is, wordt een OutOfGas exceptie geraised

## Waarom Gas?

* Gebruiker/aanvaller betaalt
* Endless loops niet mogelijk (Halting problem)
* Miners ontvangen gas voor het draaien van de code

## Solidity

* Defacto standaardtaal voor het schrijven van Ethereum smart contracts
* Alternatieven: Serpent (Python), LLL (Lisp), Viper (Python), Bamboo (OCaml)

# FundFissa

Smart Contract om crowdfunding voor een event te doen.

Als voor aanvang van het event de funding voltooid is, krijgt:
* de **organisator** alles uitbetaald,
* de **deelnemers** een toegangsbewijs
Als voor aanvang van het event de funding *niet* gehaald is:
* krijgen alle deelnemers hun inleg terug.

## Wat uitleg en details
![tests](./tests.png)

### Deploy

* Zet 1 crowdfunding.
* 1 contract == 1 crowdfunding. Simpel, maar duur en onhandig.

### purchase

* We houden een balansboek bij.
* Validatie of crowdfunding not actief is
* Gebruiker stuurt fondsen mee.
* Validatie of meegestuurde fondsen precies 1 ticketprijs zijn.

### withdraw

* eerlijker
* veiliger
* defacto standaard

## Presentatie

* [git.webschuur.com/berkes/ethpres](https://git.webschuur.com/berkes/ethpres)
