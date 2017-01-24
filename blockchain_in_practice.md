---
author:
  - Bèr `berkes` Kessels
title: Blockchain
subtitle: "Eigendom vastleggen in het Bitcoin netwerk"
abstract: "Aan de hand van enkele voorbeelden bespreken we hoe eigendom in het Bitcoin netwerk vastgelegd kunnen worden. Van het eigendomsbewijs van een huis, via concertkaartjes, tot een datering van auteursrecht: Bitcoin biedt zoveel meer dan enkel geldstromen beheren."
keywords:
  - Blockchain
  - Bitcoin
  - OP_RETURN
  - Colored Coins
  - Ethereum
  - Smart Contracts
lang: nl
---

## Over Bèr Kessels

* Bèr Kessels
* @berkes, github.com/berkes
* Senior Developer at Wiebetaaltwat

## Over de presentatie

* Staat op [berk.es/blockcainpres](http://berk.es/blockchainpres)
* Github: [github.com/berkes/blockcainpres](http://github.com/berkes/blockcainpres)

## Over mij en Blockchain

* April 2011 begonnen met Bitcoin
* Werkt voor Fintech startup Searcle: aan Wiebetaaltwat
* Momenteel betaalfunctie aan het inbouwen in Wiebetaaltwat
* iDeal is niet ideaal. C2C is duur, complex en traag
* Onderzoek naar smart contracts

## Wiebetaaltwat

* IOUs: huislijsten
* 1 miljoen gebruikers
* €20 miljoen aan "uitgaven" per maand
* €2.6 miljoen aan onderlinge verrekeningen per maand
* Kan dat met blockchain? Ja: ethereum. Makkelijk: nee. verdienmodel: nope

## Inhoud

* Bitcoin en Blockchain
* Smart Contracts
* OP_RETURN
* Ethereum
* Colored Coins
* Vragen

## Vraag:

* Wie doet wel eens wat met Bitcoin?
* Wie developed voor Bitcoin?
* Wie werkt met alternatieve blockchains?
* Wie heeft geen idee wat Blockchain of Bitcoin is?

## Wat is Blockchain?

> Een onderdeel van **Bitcoin**.  Het is een **Publiek kasboek** waarin
> *eingendomsbewijzen* vastgelegd zijn. En *éénmalig overdracht*
> gerandadeerd kan worden.

## do_you_need_a_blockchain.png

![No](do_you_need_a_blockchain.png)

## Je hebt bijna zeker geen blockchain nodig.

> Maar je wilt hem wel gebruiken, waarschijnlijk.

# Smart Contracts

## Storting

* Storting bij onafhankelijke derde.

* Alice registreert op site van Bob en stort in fonds.
* Bob ziet storting maar kan geld niet spenderen.
* Spam-preventie: Alice kan betrouwbaarheid kopen.
* Terugstortgarantie: Na N dagen wordt teruggestort tenzij beide
    partijen verlengen.

## Multisig

* Blockchain als tussenpersoon.
* Multisig: betaling bij ondertekening door m van n keys

## Multisig: Escrow service, mediation

* Alice, Bob en Mediator maken 2 van 3 multisig
* Als Alice en Bob tekenen, voldoet betaling
* Als Alice en Mediator tekenen, voldoet betaling
* Als Bob en Mediator tekenen, voldoet betaling

## Multisig: Extra beveiliging, Extra redundantie

* Alice maakt 2 van 3 multisig. Bewaart 3 keys op verschillende plekken.
* Wanneer Alice wil spenderen, moet zij met 2 keys ondertekenen.
* Dief moet 2 plekken inbreken.
* Alice kan één key verliezen.

## Multisig: Meerderheidsstem.

* Groep maakt n + 1 van n * 2 (51 van 100) betalingen.
* Wanneer n + 1 mensen tekenen, voldoet betaling.

## De "pot" (assurance contract)

* Iedereen kan storten tot het eindbedrag is bereikt.
* Alice en Bob storten op fonds voor Carol.
* Bij bereiken eindbedrag voor datum D wordt uitgekeerd aan Carol.
* Bij niet bereiken totaalbedrag kunnen Alice en Bob terughalen.

# OP_RETURN

## OP_RETURN Geschiedenis

* 2013: mensen plaatsen extra data in blockchain.
* Bijvoorbeeld: Ik verklaar hierbij dat ik bezit A overdraag aan adres S
    op datum D.
* Data in scriptSig plaatsen zonder uitvoer te veranderen.
* Mening in bedragen: 0.00**079075**: 079,075: "O", "K".
* Vervuiling, daarom OP_RETURN

## OP_RETURN eigenschappen
* 80 bytes aan info.
* Geen standaard.
* Geen betekenis

## Nadelen
* 80 bytes is weinig.
* "Deze paragraaf alleen al, bevat 41 bytes!"
* Daarmee verwijzingen *naar*, of representaties *van* data opnemen.
* Evenveel "standaarden" als diensten en projecten: niets is vastgelegd

# Ethereum

## Wat is EThereum (ETH/ETC)
* Bitcoin-achtige Software: Distributed VM.
* Programmeertaal: Smart contracts zijn kleine programmaatjes.
* Veel interesse van grote partijen. Microsoft, J.P. Morgan Chase, RBS,
    Santander zijn allemaal bezig met ETH.
* Dit is de *toekomst* van smart contracts.

## Mogelijkheden

* Escrow.
* Notarieel.
* Onafhankelijke eigendomsbewijzen, bijv domeinen, land.
* Apparaten met zakgeld en onderhandelingspositie.
* Wiebetaaltwat, IOU.
* Jouw fintech.

## Nadelen

* Complex.
* Daardoor security moeilijk te doorgronden.
* Bewijs zijn verschillende hacks en aanvallen.
* Diverse hardforks nodig geweest.

# Colored Coins

## Wat is Colored Coin

* Gebruikt de OP_RETURN om database aan te leggen van metadata.
* Metadata beschrijft eigendom en eigenschappen.
* Werkt nu al.

## Mogelijkheden

* Tegoedbonnen verkoop, handel en spenderen.
* Concertkaarten-verkoop en -handel.
* Aandelenhandel.
* Beloftes (futures).
* In-game assets. (wapens, upgrades, codes)
* Mp3, Films, eBooks. (proof of ownership)
* Verkiezingen. (stemmen uitdelen; stemmen doorgeven, stemmen)

## Nadelen

* Beperkte Mogelijkheden.
* Afhankelijk van Bitcoin. (voordeel?)
* Spamt het al volle Bitcoin netwerk

## Voorbeeld

* Coinprism: Pils, de nieuwe munteenheid.

# Vragen

## Presentatie

* [berk.es/blockcainpres](http://berk.es/blockchainpres)

# URLs And References

* Do you need a blockchain?: https://medium.com/@sbmeunier/when-do-you-need-blockchain-decision-models-a5c40e7c9ba1#.suev52ycl
* Coinprism Pils: https://www.coinprism.info/asset/ATnv4wZ39szaAQGTB1Z9RgsAfkDbPnLvXo
* Coinprism Beer: https://www.coinprism.info/asset/AMWgTxUcpswSRAcpsB1Szk9o1pHvtXNDX6
* Strange transactions: OP_RETURN: https://blockchain.info/strange-transactions

