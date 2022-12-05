Dash Core performs full <> synchronization as required. There are
several conditions that initiate a start/restart the sync process:

-  Initial startup of Dash Core
-  More than 60 minutes have passed since the last activation
-  A failure occurred during the last sync attempt (after a 1 minute
   cooldown before sync restarts)
-  Issuing a ```mnsync reset``
   RPC <core-api-ref-remote-procedure-calls-dash#mnsync>`__ command

Initial Masternode Sync
=======================

The deterministic masternode lists introduced by
`DIP3 <https://github.com/dashpay/dips/blob/master/dip-0003.md>`__
eliminated several steps of the sync process related to the masternode
list and masternode payments. Since that information is now available
on-chain, P2P messages related to those steps were deprecated.

This diagram shows the order in which P2P messages are sent to perform
masternode synchronization initially after startup.

.. figure:: https://dash-docs.github.io/img/dev/en-masternode-sync-initial-dip3.svg
   :alt: Masternode Sync (Initial)

   Masternode Sync (Initial)

The following table details the data flow of P2P messages exchanged
during initial masternode synchronization after the activation of
`DIP3 <https://github.com/dashpay/dips/blob/master/dip-0003.md>`__ and
<> 15.

+----------------+---------------+----------------+----------------+
| **Syncing Node | **Direction** | **Masternode   | *              |
| Message**      |               | Response**     | *Description** |
+================+===============+================+================+
| **1. Sporks**  |               |                |                |
+----------------+---------------+----------------+----------------+
| ```getsporks`` | →             |                | Syncing node   |
| mess           |               |                | requests       |
| age <core-ref- |               |                | sporks         |
| p2p-network-co |               |                |                |
| ntrol-messages |               |                |                |
| #getsporks>`__ |               |                |                |
+----------------+---------------+----------------+----------------+
|                | ←             | ```spork``     |                |
|                |               | messa          |                |
|                |               | ge <core-ref-p |                |
|                |               | 2p-network-con |                |
|                |               | trol-messages# |                |
|                |               | spork>`__\ (s) |                |
+----------------+---------------+----------------+----------------+
| **2. Mempool** |               |                |                |
+----------------+---------------+----------------+----------------+
| ```mempool``   | →             |                | Syncing node   |
| message <core  |               |                | requests       |
| -ref-p2p-netwo |               |                | mempool        |
| rk-data-messag |               |                | entries        |
| es#mempool>`__ |               |                |                |
+----------------+---------------+----------------+----------------+
|                | ←             | ```inv``       | ``inv``        |
|                |               | message <core- | message(s)     |
|                |               | ref-p2p-networ | containing     |
|                |               | k-data-message | TXIDs of       |
|                |               | s#inv>`__\ (s) | mempool        |
|                |               |                | transactions   |
+----------------+---------------+----------------+----------------+
| **3.           |               |                | See            |
| Governance**   |               |                | `Governance    |
|                |               |                | sync <#        |
|                |               |                | governance>`__ |
+----------------+---------------+----------------+----------------+

*Masternode Sync Status*

There are several status values used to track masternode
synchronization. They are used in both ```ssc``
messages <core-ref-p2p-network-masternode-messages#ssc>`__ and the
```mnsync`` RPC <core-api-ref-remote-procedure-calls-dash#mnsync>`__.

+-----------------------+-----------------------+-----------------------+
| **Value**             | **Status**            | **Description**       |
+=======================+=======================+=======================+
| *-1*                  | *``MAST               | **Removed in Dash     |
|                       | ERNODE_SYNC_FAILED``* | Core                  |
|                       |                       | 0.16                  |
|                       |                       | .0**\ Synchronization |
|                       |                       | failed                |
+-----------------------+-----------------------+-----------------------+
| *0*                   | *``MASTE              | **Deprecated (merged  |
|                       | RNODE_SYNC_INITIAL``* | with                  |
|                       |                       | ``MAST                |
|                       |                       | ERNODE_SYNC_WAITING`` |
|                       |                       | in Dash Core          |
|                       |                       | 0.16.                 |
|                       |                       | 0)**\ Synchronization |
|                       |                       | just started, was     |
|                       |                       | reset recently, or is |
|                       |                       | still in IBD          |
+-----------------------+-----------------------+-----------------------+
| 1                     | ``MASTERN             | **Renamed in Dash     |
|                       | ODE_SYNC_BLOCKCHAIN`` | Core                  |
|                       | (previously           | 0.16                  |
|                       | ``MASTE               | .0**\ Synchronization |
|                       | RNODE_SYNC_WAITING``) | pending - waiting     |
|                       |                       | after initial to      |
|                       |                       | check for more        |
|                       |                       | headers/blocks.       |
+-----------------------+-----------------------+-----------------------+
| 4                     | ``MASTERN             | Synchronizing         |
|                       | ODE_SYNC_GOVERNANCE`` | governance objects    |
+-----------------------+-----------------------+-----------------------+
| 999                   | ``MASTE               | Synchronization       |
|                       | RNODE_SYNC_FINISHED`` | finished              |
+-----------------------+-----------------------+-----------------------+

Ongoing Masternode Sync
=======================

Once a masternode completes an initial full sync, continuing
synchronization is maintained by the exchange of P2P messages with other
<>. This diagram shows an overview of the messages exchanged to keep
governance objects synchronized between masternodes.

.. figure:: https://dash-docs.github.io/img/dev/en-masternode-sync-ongoing.svg
   :alt: Masternode Sync (Ongoing)

   Masternode Sync (Ongoing)

**Governance**

After the initial governance synchronization, governance information is
kept current by the ```govobj``
messages <core-ref-p2p-network-governance-messages#govobj>`__ and
```govobjvote``
messages <core-ref-p2p-network-governance-messages#govobjvote>`__
relayed on the <>. Unsynchronized <> may send ```govsync``
messages <core-ref-p2p-network-governance-messages#govsync>`__ to
request governance sync.

Masternode Sync Schedule
========================

The following tables detail the timing of various functions used to keep
the masternodes in sync with each other. This information is derived
from the scheduler section of ``AppInitMain`` in ``src/init.cpp``.

+----------------------+------------+---------------------------+
| **Period (seconds)** | **Action** | **Description**           |
+======================+============+===========================+
| 6                    | MN Sync    | Synchronizes sporks and   |
|                      |            | governance objects        |
|                      |            | (masternode-sync.cpp)     |
+----------------------+------------+---------------------------+

The following actions only run when the masternode sync is past
``MASTERNODE_SYNC_WAITING`` status.

+-----------------------+-----------------------+-----------------------+
| **Period (seconds)**  | **Action**            | **Description**       |
+=======================+=======================+=======================+
| 60                    | Process MN            | Disconnects some      |
|                       | Connections           | masternodes           |
|                       |                       | (`                    |
|                       |                       | `masternodeman.cpp``) |
+-----------------------+-----------------------+-----------------------+
| 60                    | InstantSend           | Remove                |
|                       | Check/Remove          | exp                   |
|                       |                       | ired/orphaned/invalid |
|                       |                       | InstantSend           |
|                       |                       | candidates and votes  |
|                       |                       | (``instantx.cpp``)    |
+-----------------------+-----------------------+-----------------------+
| 300                   | Maintenance           | C                     |
|                       |                       | heck/remove/reprocess |
|                       |                       | governance objects    |
|                       |                       | (``governance.cpp``)  |
+-----------------------+-----------------------+-----------------------+
