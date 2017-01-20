---
author:
  - Bèr `berkes` Kessels
title: TODO
subtitle: TODO
abstract: TODO
keywords:
  - Blockchain
  - Bitcoin
  - OP_RETURN
  - Colored Coins
  - Ethereum
  - Smart Contracts
lang: nl
---

## Inhoud

* Bitcoin en Blockchain +00:05 @00:00
* Smart Contracts +00:05 @00:05
* OP_RETURN +00:15 @00:10
* Ethereum +00:05 @00:25
* Colored Coins +00:10 @00:30
* Vragen +00:05 @00:40
* Bitcoin en Blockchain +00:05 @00:00

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

# Smart Contracts +00:05 @00:05

## Storting

* Storting bij onafhankelijke derde.

* Ann registreert op site van Bob en stort in fonds.
* Bob ziet storting maar kan geld niet spenderen.
* Spam-preventie: Ann kan betrouwbaarheid kopen.
* Terugstortgarantie: Na N dagen wordt teruggestort tenzij beide
    partijen verlengen.

## Multisig

* Blockchain als tussenpersoon.
* Multisig: betaling bij ondertekening door m van n keys

## Multisig: Escrow service, mediation

* Ann, Bob en Mediator maken 2 van 3 multisig
* Als Ann en Bob tekenen, voldoet betaling
* Als Ann en Mediator tekenen, voldoet betaling
* Als Bob en Mediator tekenen, voldoet betaling

## Multisig: Extra beveiliging, Extra redundantie

* Ann maakt 2 van 3 multisig. Bewaart 3 keys op verschillende plekken.
* Wanneer Ann wil spenderen, moet zij met 2 keys ondertekenen.
* Dief moet 2 plekken inbreken.
* Ann kan één key verliezen.

## Multisig: Meerderheidsstem.

* Groep maakt n + 1 van n * 2 (51 van 100) betalingen.
* Wanneer n + 1 mensen tekenen, voldoet betaling.

## De "pot" (assurance contract)

* Iedereen kan storten tot het eindbedrag is bereikt.
* Ann en Bob storten op fonds voor Carol.
* Bij bereiken eindbedrag voor datum D wordt uitgekeerd aan Carol.
* Bij niet bereiken totaalbedrag kunnen Ann en Bob terughalen.

# OP_RETURN +00:15 @00:10

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

# Ethereum +00:05 @00:25

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

# Colored Coins +00:10 @00:30

## Wat is Colored Coin

* Gebruikt de OP_RETURN om database aan te leggen van metadata.
* Metadata beschrijft eigendom en eigenschappen.
* Werkt nu al.

## Mogelijkheden

* Tegoedbonnen verkoop, handel en spenderen.
* Concertkaarten-verkoop en -handel.
* Aandelenhandel.
* Beloftes (futures).
* In-game assets (wapens, upgrades, codes)

## Nadelen

* Beperkte Mogelijkheden.
* Afhankelijk van Bitcoin. (voordeel?)
* Spamt het al volle Bitcoin netwerk

## Voorbeeld

* Coinprism: Pils, de nieuwe munteenheid.

<div class="notes">

- Open coinprism in Firefox.
- Browse to Pils. https://cpr.sm/Y8i8_bhPq6
- 

</div>

# Vragen +00:05 @00:40

# URLS: (TODO move to notes)
https://medium.com/@sbmeunier/when-do-you-need-blockchain-decision-models-a5c40e7c9ba1#.suev52ycl

