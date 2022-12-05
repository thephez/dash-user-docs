Dash Core’s <> feature provides a way to lock transaction <> and enable
secure, instantaneous <>. The <> automatically attempts to upgrade any
qualifying transaction to InstantSend without a need for the sending <>
to explicitly request it.

-  To qualify for InstantSend, each transaction input must meet at least
   one of the following criteria:

   -  Be locked by InstantSend
   -  Be in a block that has a <>
   -  Have at least the number <> (block depth) indicated by the table
      below

+-----------------------------------+-----------------------------------+
| **Network**                       | **Confirmations Required**        |
+===================================+===================================+
| Mainnet                           | 6 Blocks (normal                  |
|                                   | transactions)\ **100 Blocks       |
|                                   | (mining/masternode rewards)**     |
+-----------------------------------+-----------------------------------+
| Testnet / Regtest / Devnet        | 2 Blocks                          |
+-----------------------------------+-----------------------------------+

[block:callout] { “type”: “info”, “body”: “Protocol version 70220
implements
`DIP22 <https://github.com/dashpay/dips/blob/master/dip-0022.md>`__
which adds the ``isdlock`` message as a replacement for the ``islock``
message. Once the transition is complete, the ``islock`` message will be
deprecated.”, “title”: “Transition to Deterministic InstantSend lock” }
[/block] The introduction of the <> feature in Dash Core 0.14 provided a
foundation to scale InstantSend. The transaction input locking process
(and resulting network traffic) now occurs only within the quorum. This
minimizes network congestion since only the ```islock``
message <core-ref-p2p-network-instantsend-messages#islock>`__ or
```isdlock``
message <core-ref-p2p-network-instantsend-messages#isdlock>`__ produced
by the locking process is relayed to the entire Dash network. This
message contains all the information necessary to verify a successful
transaction lock.

Management via Spork
====================

Spork 2 (``SPORK_2_INSTANTSEND_ENABLED``) is used to manage InstantSend.
<> 2 enables or disables the entire InstantSend feature. As of Dash Core
0.17.0, it also can be used to limit locking to transactions found in
blocks.

In the event of a sustained overload of InstantSend, the spork can be
set to a value of ``1``. This mode enables a clean transition to fully
disabling InstantSend without interfering with ChainLocks. In this mode
masternodes will stop creating locks for new transactions when they
enter the mempool and will only lock them once mined into a block. Once
all existing locked transactions are mined into blocks, InstantSend can
then be disabled by setting the spork value to ``0`` without disrupting
ChainLocks.

Mining Considerations
=====================

Note: A transaction will **not** be included in the block template (from
the ```getblocktemplate``
RPC <core-api-ref-remote-procedure-calls-mining#getblocktemplate>`__)
unless it:

1. Has been locked, or
2. Has been in the mempool for >=10 minutes
   (``WAIT_FOR_ISLOCK_TIMEOUT``)

A <> may still include any transaction, but <> containing only locked
transactions (or ones older than the timeout) should achieve a ChainLock
faster. This is desirable to miners since it prevents any blockchain
reorganizations that might orphan their block.

InstantSend Data Flow
=====================

+--------------+------------------------+--------------+--------------+
| *            | **Direction**          | **Peers**    | **D          |
| *InstantSend |                        |              | escription** |
| Client**     |                        |              |              |
+==============+========================+==============+==============+
| ```tx``      | →                      |              | Client sends |
| me           |                        |              | InstantSend  |
| ssage <core- |                        |              | transaction  |
| ref-p2p-netw |                        |              |              |
| ork-data-mes |                        |              |              |
| sages#tx>`__ |                        |              |              |
+--------------+------------------------+--------------+--------------+
| **LLMQ       |                        |              | Quorums      |
| Signing      |                        |              | internally   |
| Sessions**   |                        |              | process      |
|              |                        |              | locking      |
+--------------+------------------------+--------------+--------------+
|              |                        |              | Quorum(s)    |
|              |                        |              | responsible  |
|              |                        |              | for the      |
|              |                        |              | t            |
|              |                        |              | ransaction’s |
|              |                        |              | inputs lock  |
|              |                        |              | the inputs   |
|              |                        |              | via LLMQ     |
|              |                        |              | signing      |
|              |                        |              | sessions     |
+--------------+------------------------+--------------+--------------+
|              |                        |              | Once all     |
|              |                        |              | inputs are   |
|              |                        |              | locked, the  |
|              |                        |              | quorum       |
|              |                        |              | responsible  |
|              |                        |              | for the      |
|              |                        |              | overall      |
|              |                        |              | transaction  |
|              |                        |              | creates the  |
|              |                        |              | transaction  |
|              |                        |              | lock         |
|              |                        |              | (``islock``  |
|              |                        |              | or           |
|              |                        |              | ``isdlock``) |
|              |                        |              | via an LLMQ  |
|              |                        |              | signing      |
|              |                        |              | session      |
+--------------+------------------------+--------------+--------------+
| **LLMQ       |                        |              | Quorum       |
| Results**    |                        |              | results      |
|              |                        |              | broadcast to |
|              |                        |              | the network  |
+--------------+------------------------+--------------+--------------+
|              | ←                      | ```inv``     | Quorum       |
|              |                        | mes          | responds     |
|              |                        | sage <core-r | with lock    |
|              |                        | ef-p2p-netwo | inventory    |
|              |                        | rk-data-mess |              |
|              |                        | ages#inv>`__ |              |
|              |                        | (islock or   |              |
|              |                        | isdlock)     |              |
+--------------+------------------------+--------------+--------------+
| ```getdata`` | →                      |              | Client       |
| message      |                        |              | requests     |
|  <core-ref-p |                        |              | lock message |
| 2p-network-d |                        |              |              |
| ata-messages |                        |              |              |
| #getdata>`__ |                        |              |              |
| (islock or   |                        |              |              |
| isdlock)     |                        |              |              |
+--------------+------------------------+--------------+--------------+
|              | ←                      | ```islock``  | Quorum       |
|              |                        | m            | responds     |
|              |                        | essage <core | with lock    |
|              |                        | -ref-p2p-net | message      |
|              |                        | work-instant |              |
|              |                        | send-message |              |
|              |                        | s#islock>`__ |              |
|              |                        | or           |              |
|              |                        | ```isdlock`` |              |
|              |                        | me           |              |
|              |                        | ssage <core- |              |
|              |                        | ref-p2p-netw |              |
|              |                        | ork-instants |              |
|              |                        | end-messages |              |
|              |                        | #isdlock>`__ |              |
+--------------+------------------------+--------------+--------------+

Once a transaction lock is approved, the ``instantlock`` field of
various RPCs is set to ``true`` (e.g. the ```getmempoolentry``
RPC <core-api-ref-remote-procedure-calls-blockchain#getmempoolentry>`__).
