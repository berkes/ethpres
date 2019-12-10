## Broodfonds

### Research online:
from: https://en.wikipedia.org/wiki/Broodfonds:

* The recommended minimum is 25 people, the maximum size is 50 people to avoid a degree of anonymity
*  The participants open individual bankaccounts dedicated to their 'bread fund'. On these accounts the people who join a broodfonds save a fixed amount per month: between €33.75 and €112.50.
* They also pay a one-time service fee of €250 and a monthly contribution of €10. If members fall sick, they receive net donations depending on their own monthly contribution: between €750 and €2500.
* The monthly savings that accumulate on the bankaccount of each member are personal credit and when people cancel their participation they collect this sum.
* Members can receive support for a maximum of two years.

from: http://www.broodfonds.nl/hoe_het_werkt

* Er is ook een eigen risico: de eerste maand na ziekmelding is voor eigen rekening.

Je kunt meedoen als:
* als je langer dan een jaar zelfstandig ondernemer bent; 
* als je minimaal €750,- gemiddeld per maand haalt uit de netto winst van je onderneming; 
* als je bij toetreden arbeidsgeschikt bent

Schenkingsniveaus

Iedere deelnemer opent een eigen bankrekening, je broodfondsrekening. Hierop zet je elke maand je inleg. Hoe hoger de schenking die je hebt gekozen, hoe hoger je maandelijkse inleg is.

Maandelijkse inleg   Maandelijkse       Maximale buffer
                     schenking in
                     geval van ziekte

33.75                 750               1215
45.00                1000               1620
56.25                1250               2025
67.50                1500               2430
78.75                1750               2835
90.00                2000               3240
101.25               2250               3645
112.50               2500               4050

### Contract in words:

* Given you have deposited this month
* And you have called in sick at least 2629800 seconds ago (one month)
* And at least half of the participants have acknowledged your sick call.
* Then you may withdraw at most 22 * your deposit
* Until the total balance is depleted

### Smart Contract

Steps:

* Contract initialiseren.
* Deposit()
* CallInSick()
* ClaimGift()

Notes:
Amounts in wei.
Amount deposit: 3375
Amount withdrawal: 75000
Months is 2629800 seconds: 31557600/12.

#### Step 1:

* Hardwired Participants

#### Step 2:

* Deposit()

Is amount 100 Wei?
Has msg.address deposited this month?
Adds msg.amount to msg.address registry.
register that user paid this month.

... catch: what happens when someone deposits from a non-whitelisted
account?

#### Step 3:

* CallInSick()

Adds timestamp to sickList[msg.address]

* CallInHealthy()

Removes msg.address from sickList

.... catch: what happens when: P calls in sick. Waits 32 days. Calls in
healthy. Now wants to claim his gift?
1. is it always inaccessible after calling CallInHealthy?
2. should it be claimable?

#### Step 4:

* ClaimGift()

1. Is msg.address whitelisted?
2. Is msg.address in sickList AND has one month passed since callInSick
   was called?
3. Has msg.address deposited every month?
4. Send amount to msg.address
5. Set monthly amount to 0

.... catch: what happens when funds are empty?
.... catch: show Re-Entrancy bug, with contracts calling into other
contracts: the DAO hack. fix: swap 4 and 5.

#### Step 5:

* kill-switch:
- allow admin to extract funds to an address

## TODO, Future improvements

* Allow anyone to deposit.
* Allow any deposit to start at any time.
* Allow AddParticipant() && ApproveParticipant()
* Allow ApproveSick()
* How to handle missed deposits? Punish percentages? No withdrawal
    allowed?
* Allow max 2 years, or 24 months of gifts.
* Allow deposits of other amounts. Calculate gifts based on other
    accounts.
* Allow ClaimGift to be called with Amount, only extract that amount.
* Allow building up of own budget, group budget etc.
* Improve kill-switch to send to another contract that is hardcoded to
    split all funds equally and send to owners.
