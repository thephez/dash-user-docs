Governance
**********

Synchronization
===============

Dash Core synchronizes the governance system via the <> <> as the last
stage of the Masternode sync process (following the sync of sporks, the
Masternode list, and Masternode payments).

The ```govsync``
message <core-ref-p2p-network-governance-messages#govsync>`__ initiates
a sync of the governance system. Masternodes ignore this request if they
are not fully synced.

There are two distinct stages of governance sync:

1. Initial request (object sync) - requests the governance objects only
   via a ```govsync``
   message <core-ref-p2p-network-governance-messages#govsync>`__ sent
   with a hash of all zeros.

2. Follow up request(s) (vote sync) - request governance object votes
   for a specific object via a ```govsync``
   message <core-ref-p2p-network-governance-messages#govsync>`__
   containing the hash of the object. One message is required for each
   object. Dash Core periodically (~ every 6 seconds) sends messages to
   connected nodes until all the governance objects have been
   synchronized. [block:callout] { “type”: “info”, “body”: “Dash Core
   limits how frequently the first type of sync (object sync) can be
   requested. Frequent requests will result in the node being banned.”,
   “title”: “Governance Object Sync Limitation” } [/block] Masternodes
   respond to the ```govsync``
   message <core-ref-p2p-network-governance-messages#govsync>`__ with
   several items:

For Object Sync:

-  First, the Masternode sends a ```ssc``
   message <core-ref-p2p-network-masternode-messages#ssc>`__ (Sync
   Status Count) for ``govobj`` objects. This message indicates how many
   <> items will be sent.

-  Second, the Masternode sends an ```inv``
   message <core-ref-p2p-network-data-messages#inv>`__ for the
   ``govobj`` and ``govobjvote`` objects.

For Vote Sync:

-  First, the Masternode sends a ```ssc``
   message <core-ref-p2p-network-masternode-messages#ssc>`__ (Sync
   Status Count) for ``govobjvote`` objects. This message indicates how
   many inventory items will be sent.

-  Second, the Masternode sends an ```inv``
   message <core-ref-p2p-network-data-messages#inv>`__ for the
   ``govobjvote`` object(s).

Once the syncing <> receives the counts and inventories, it may request
any ``govobj`` and ``govobjvote`` objects from the masternode via a
```getdata`` message <core-ref-p2p-network-data-messages#getdata>`__.

Governance Sync Data Flow
-------------------------

+-----------------+-----------------+-----------------+-----------------+
| **Syncing Node  | **Direction**   | **Masternode    | **Description** |
| Message**       |                 | Response**      |                 |
+=================+=================+=================+=================+
| **Initial       |                 |                 | **Requests all  |
| request**       |                 |                 | governance      |
|                 |                 |                 | objects         |
|                 |                 |                 | (without        |
|                 |                 |                 | votes)**        |
+-----------------+-----------------+-----------------+-----------------+
| ```govsync``    | →               |                 | Syncing node    |
| m               |                 |                 | initiates       |
| essage <core-re |                 |                 | governance sync |
| f-p2p-network-g |                 |                 | (hash set to    |
| overnance-messa |                 |                 | all zeros)      |
| ges#govsync>`__ |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
|                 | ←               | ```ssc``        | Number of       |
|                 |                 | message <cor    | governance      |
|                 |                 | e-ref-p2p-netwo | objects (0 or   |
|                 |                 | rk-masternode-m | more)           |
|                 |                 | essages#ssc>`__ |                 |
|                 |                 | (govobj)        |                 |
+-----------------+-----------------+-----------------+-----------------+
|                 | ←               | ```inv``        | Governance      |
|                 |                 | messag          | object          |
|                 |                 | e <core-ref-p2p | inventories     |
|                 |                 | -network-data-m |                 |
|                 |                 | essages#inv>`__ |                 |
|                 |                 | (govobj)        |                 |
+-----------------+-----------------+-----------------+-----------------+
| ```getdata``    | →               |                 | (Optional)      |
| message <c      |                 |                 | Syncing node    |
| ore-ref-p2p-net |                 |                 | requests govobj |
| work-data-messa |                 |                 |                 |
| ges#getdata>`__ |                 |                 |                 |
| (govobj)        |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
|                 | ←               | ```govobj``     | (If requested)  |
|                 |                 | message <core-r | Governance      |
|                 |                 | ef-p2p-network- | object          |
|                 |                 | governance-mess |                 |
|                 |                 | ages#govobj>`__ |                 |
+-----------------+-----------------+-----------------+-----------------+
|                 |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **Follow up     |                 |                 | **Requests      |
| requests**      |                 |                 | governance      |
|                 |                 |                 | object (with    |
|                 |                 |                 | votes)**        |
+-----------------+-----------------+-----------------+-----------------+
| ```govsync``    | →               |                 | Syncing node    |
| m               |                 |                 | requests        |
| essage <core-re |                 |                 | governance sync |
| f-p2p-network-g |                 |                 | for a specific  |
| overnance-messa |                 |                 | governance      |
| ges#govsync>`__ |                 |                 | object          |
+-----------------+-----------------+-----------------+-----------------+
|                 | ←               | ```ssc``        | Number of       |
|                 |                 | message <cor    | governance      |
|                 |                 | e-ref-p2p-netwo | object votes (0 |
|                 |                 | rk-masternode-m | or more)        |
|                 |                 | essages#ssc>`__ |                 |
|                 |                 | (govobjvote)    |                 |
+-----------------+-----------------+-----------------+-----------------+
|                 | ←               | ```inv``        | Governance      |
|                 |                 | messag          | object vote     |
|                 |                 | e <core-ref-p2p | inventories     |
|                 |                 | -network-data-m |                 |
|                 |                 | essages#inv>`__ |                 |
|                 |                 | (govobjvote)    |                 |
+-----------------+-----------------+-----------------+-----------------+
| ```getdata``    | →               |                 | (Optional)      |
| message <c      |                 |                 | Syncing node    |
| ore-ref-p2p-net |                 |                 | requests        |
| work-data-messa |                 |                 | govobjvote      |
| ges#getdata>`__ |                 |                 |                 |
| (govobjvote)    |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
|                 | ←               | ```govobjvote`` | (If requested)  |
|                 |                 | mess            | Governance      |
|                 |                 | age <core-ref-p | object vote     |
|                 |                 | 2p-network-gove |                 |
|                 |                 | rnance-messages |                 |
|                 |                 | #govobjvote>`__ |                 |
+-----------------+-----------------+-----------------+-----------------+

Sentinel
========

`Sentinel <https://github.com/dashpay/sentinel/>`__ is a Python
application that connects to a masternode’s local dashd instance to run
as an autonomous agent for persisting, processing, and automating Dash
12.1+ governance objects and tasks. Sentinel abstracts some governance
details away from Dash Core for easier extensibility of the governance
system in the future. This will allow the integration between Evolution
and Dash Core to proceed more smoothly and enable new governance object
additions with minimal impact to Dash Core.

Sentinel runs periodically and performs three main tasks as described
below: governance sync, governance object pruning, and superblock
management. The governance object data is stored in a SQLite database.

Sentinel Sync
-------------

Sentinel issues a ```gobject list``
RPC <core-api-ref-remote-procedure-calls-dash#gobject-list>`__ command
and updates its database with the results returned from dashd. When
objects are removed from the network, they are purged from the Sentinel
database.

Sentinel Prune
--------------

Sentinel 1.1.0 introduced proposal pruning which automatically votes to
delete expired proposals following approximately half of a <> cycle.
This delay period ensures that proposals are not deleted prematurely.
Prior to this, proposals remained in memory unless a sufficient number
of masternodes manually voted to delete them.

Sentinel Superblock
-------------------

Sentinel manages superblock creation, voting, and submission to dashd
for network propagation.

Beginning ~3 days (1662 blocks) prior to a superblock, Sentinel selects
one masternode per block to rank proposals. This ranking is used to
determine what a candidate superblock (or “superblock trigger”) should
contain. Based on the results, it creates and broadcasts a new
superblock trigger if a matching one was not found.

All masternodes vote for existing superblock triggers. Each masternode
casts only 1 superblock trigger “Yes” vote per superblock cycle. It will
vote “No” for any other triggers it receives.

[block:callout] { “type”: “warning”, “body”: “Note: This means that
proposal votes submitted *after* superblock trigger creation begins will
**not** be counted by some masternodes (those that have already voted on
a superblock trigger).”, “title”: “Single masternode trigger vote” }
[/block] At the superblock height, the trigger with the most “Yes” votes
is paid out by that block’s miner.
