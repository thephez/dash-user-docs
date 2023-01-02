Masternode Quorums
******************

Dash’s <> quorums are used to facilitate the operation of masternode
provided features in a decentralized, deterministic way. The original
quorums (used largely for <> and masternode payments) were ephemeral and
used for a single purpose (e.g. voting on one specific InstantSend
transaction).

Dash Core 0.14 (protocol version 70214) introduced the <> (LLMQ) system
described in detail by
`DIP6 <https://github.com/dashpay/dips/blob/master/dip-0006.md>`__.
These LLMQs are deterministic subsets of the global deterministic
masternode list that are formed via a distributed key generation (DKG)
protocol and remain active for a long periods of time (e.g. hours to
days).

The main task of LLMQs is to perform threshold signing of
consensus-related messages (e.g. <>).

LLMQ Creation (DKG)
===================

The following table details the data flow of P2P messages exchanged
during the distributed key generation (DKG) protocol used to establish
an LLMQ. [block:callout] { “type”: “info”, “body”: “Note: With the
exception of the final step (``qfcommit`` message broadcast), the
message exchanges happen only between masternodes participating in the
DKG process via the `Intra-Quorum communication
process <https://github.com/dashpay/dips/blob/master/dip-0006.md#intra-quorum-communication>`__
described in the DIP.”, “title”: “Intra-Quorum Communication” } [/block]
*Quorum DKG Data Flow* [block:callout] { “type”: “warning”, “title”:
“Minimum Masternode Protocol Version”, “body”: “As of Dash Core 0.16.0,
masternodes perform a `version
check <https://github.com/dashpay/dash/pull/3390>`__ on their quorum
peers during DKG. Masternodes that do not meet the
``MIN_MASTERNODE_PROTO_VERSION`` (70222 in Dash Core 18.0) will begin
receiving increases in
`PoSe <core-guide-dash-features-proof-of-service>`__ score once 60% of
the masternodes on the network have upgraded to that version.” }
[/block] \| **Masternode** \| **Direction** \| **Peers** \|
**Description** \| \| — \| :—: \| — \| — \| \| `Initialization
Phase <https://github.com/dashpay/dips/blob/master/dip-0006.md#1-initialization-phase>`__\ \|
\| \| **Deterministically evaluate if quorum participation necessary**
\| \| \| \| \| Each quorum participant establishes connections to a set
of quorum participants `as described in
DIP6 <https://github.com/dashpay/dips/blob/master/dip-0006.md#building-the-set-of-deterministic-connections>`__
\| \| `Contribution
Phase <https://github.com/dashpay/dips/blob/master/dip-0006.md#2-contribution-phase>`__
\| \| \| **Send quorum contributions (intra-quorum communication)** \|
\|\ ``inv`` message (qcontrib) \| → \| \| Masternode sends inventory for
its quorum contribution *to other masternodes in the quorum* \| \| ← \|
```getdata`` message <core-ref-p2p-network-data-messages#getdata>`__
(qcontrib) \| Peer(s) respond with request for quorum contribution \|
```qcontrib`` message <core-ref-p2p-network-quorum-messages#qcontrib>`__
\| → \| \| Masternode sends the requested quorum contribution \|
`Complaining
Phase <https://github.com/dashpay/dips/blob/master/dip-0006.md#3-complaining-phase>`__
\| \| \| **Send complaints for any peers with invalid or missing
contributions (intra-quorum communication)** \| \|\ ``inv`` message
(qcomplaint) \| → \| \| Masternode sends inventory for any complaints
*to other masternodes in the quorum* \| \| ← \| ```getdata``
message <core-ref-p2p-network-data-messages#getdata>`__ (qcomplaint) \|
Peer(s) respond with request for quorum complaints \| ```qcomplaint``
message <core-ref-p2p-network-quorum-messages#qcomplaint>`__ \| → \| \|
Masternode sends the requested complaints \| `Justification
Phase <https://github.com/dashpay/dips/blob/master/dip-0006.md#4-justification-phase>`__
\| \| \| **Send justification responses for any complaints against own
contributions (intra-quorum communication)** \| \|\ ``inv`` message
(qjustify) \| → \| \| Masternode sends inventory for any justifications
*to other masternodes in the quorum* \| \| ← \| ```getdata``
message <core-ref-p2p-network-data-messages#getdata>`__ (qjustify) \|
Peer(s) respond with request for quorum justifications \| ```qjustify``
message <core-ref-p2p-network-quorum-messages#qjustify>`__ \| → \| \|
Masternode sends the requested justifications \| `Commitment
Phase <https://github.com/dashpay/dips/blob/master/dip-0006.md#5-commitment-phase>`__
\| \| \| **Send premature commitment containing the quorum public key
(intra-quorum communication)** \| \|\ ``inv`` message (qpcommit) \| → \|
\| Masternode sends inventory for its premature commitment *to other
masternodes in the quorum* \| \| ← \| ```getdata``
message <core-ref-p2p-network-data-messages#getdata>`__ (qpcommit) \|
Peer(s) respond with request for quorum premature commitment \|
```qpcommit`` message <core-ref-p2p-network-quorum-messages#qpcommit>`__
\| → \| \| Masternode sends the requested premature commitment \|
`Finalization
Phase <https://github.com/dashpay/dips/blob/master/dip-0006.md#6-finalization-phase>`__
\| \| \| **Send final commitment containing the quorum public key** \|
\|\ ``inv`` message (qfcommit) \| → \| \| Masternode sends inventory for
its premature commitment **to all peers** \| \| ← \| ```getdata``
message <core-ref-p2p-network-data-messages#getdata>`__ (qfcommit) \|
Peer(s) respond with request for quorum final commitment \|
```qfcommit`` message <core-ref-p2p-network-quorum-messages#qfcommit>`__
\| → \| \| Masternode sends the requested final commitment

LLMQ Signing Session
====================

The following table details the data flow of P2P messages exchanged
during an LLMQ signing session. These sessions take advantage of BLS
threshold signatures to enable quorums to sign arbitrary messages. For
example, Dash Core 0.14 uses this capability to create the quorum
signature found in the ```clsig``
message <core-ref-p2p-network-instantsend-messages#clsig>`__ that
enables <>.

Please read `DIP7 LLMQ Signing Requests /
Sessions <https://github.com/dashpay/dips/blob/master/dip-0007.md>`__
for additional details.

*LLMQ Signing Session Data Flow*

+--------------+------------------------+--------------+--------------+
| **           | **Direction**          | **Peers**    | **D          |
| Masternode** |                        |              | escription** |
+==============+========================+==============+==============+
| `Siging      |                        |              | Request      |
| Request      |                        |              | quorum       |
| Phase <htt   |                        |              | signing of a |
| ps://github. |                        |              | message      |
| com/dashpay/ |                        |              | (e.g.        |
| dips/blob/ma |                        |              |  InstantSend |
| ster/dip-000 |                        |              | transaction  |
| 7.md#signing |                        |              | input)       |
| -request>`__ |                        |              | (            |
|              |                        |              | intra-quorum |
|              |                        |              | co           |
|              |                        |              | mmunication) |
+--------------+------------------------+--------------+--------------+
| ```          | →                      |              | Masternode   |
| qsigsesann`` |                        |              | sends a      |
| message <cor |                        |              | signing      |
| e-ref-p2p-ne |                        |              | session      |
| twork-quorum |                        |              | announcement |
| -messages#qs |                        |              | *to other    |
| igsesann>`__ |                        |              | masternodes  |
|              |                        |              | in the       |
|              |                        |              | quorum*      |
+--------------+------------------------+--------------+--------------+
| `Share       |                        |              | Members      |
| Propagation  |                        |              | exchange     |
| Phase <http  |                        |              | signature    |
| s://github.c |                        |              | shares       |
| om/dashpay/d |                        |              | within the   |
| ips/blob/mas |                        |              | quorum       |
| ter/dip-0007 |                        |              | (            |
| .md#propagat |                        |              | intra-quorum |
| ing-signatur |                        |              | co           |
| e-shares>`__ |                        |              | mmunication) |
+--------------+------------------------+--------------+--------------+
| `            | →                      |              | Masternode   |
| ``qsigsinv`` |                        |              | sends one or |
| message <c   |                        |              | more quorum  |
| ore-ref-p2p- |                        |              | signature    |
| network-quor |                        |              | share        |
| um-messages# |                        |              | inventories  |
| qsigsinv>`__ |                        |              | *to other    |
|              |                        |              | masternodes  |
|              |                        |              | in the       |
|              |                        |              | quo          |
|              |                        |              | rum*\ \ *May |
|              |                        |              | occur        |
|              |                        |              | multiple     |
|              |                        |              | times in     |
|              |                        |              | this phase*  |
+--------------+------------------------+--------------+--------------+
|              | ←                      | `            | Peer(s)      |
|              |                        | ``qgetsigs`` | respond with |
|              |                        | message <c   | request for  |
|              |                        | ore-ref-p2p- | signature    |
|              |                        | network-quor | shares\ *May |
|              |                        | um-messages# | occur        |
|              |                        | qgetsigs>`__ | multiple     |
|              |                        | (qcontrib)   | times in     |
|              |                        |              | this phase*  |
+--------------+------------------------+--------------+--------------+
| ```qbsigs``  | →                      |              | Masternode   |
| message      |                        |              | sends the    |
| <core-ref-p2 |                        |              | requested    |
| p-network-qu |                        |              | batched      |
| orum-message |                        |              | signature    |
| s#qbsigs>`__ |                        |              | sh           |
|              |                        |              | are(s)\ *May |
|              |                        |              | occur        |
|              |                        |              | multiple     |
|              |                        |              | times in     |
|              |                        |              | this phase*  |
+--------------+------------------------+--------------+--------------+
| `Threshold   |                        |              | A recovered  |
| Signature    |                        |              | signature is |
| Recovery     |                        |              | created by a |
| P            |                        |              | quorum       |
| hase <https: |                        |              | member once  |
| //github.com |                        |              | valid        |
| /dashpay/dip |                        |              | signature    |
| s/blob/maste |                        |              | shares from  |
| r/dip-0007.m |                        |              | at least the |
| d#recovered- |                        |              | threshold    |
| threshold-si |                        |              | number of    |
| gnatures>`__ |                        |              | members have |
|              |                        |              | been         |
|              |                        |              | received     |
+--------------+------------------------+--------------+--------------+
| ```qsigrec`` | →                      |              | Masternode   |
| message <    |                        |              | sends the    |
| core-ref-p2p |                        |              | quorum       |
| -network-quo |                        |              | recovered    |
| rum-messages |                        |              | signature    |
| #qsigrec>`__ |                        |              | **to all     |
|              |                        |              | peers**      |
|              |                        |              | (except      |
|              |                        |              | those that   |
|              |                        |              | have asked   |
|              |                        |              | to be        |
|              |                        |              | excluded via |
|              |                        |              | a            |
|              |                        |              | ```qs        |
|              |                        |              | endrecsigs`` |
|              |                        |              | mes          |
|              |                        |              | sage <core-r |
|              |                        |              | ef-p2p-netwo |
|              |                        |              | rk-quorum-me |
|              |                        |              | ssages#qsend |
|              |                        |              | recsigs>`__) |
+--------------+------------------------+--------------+--------------+

Note the following timeouts defined by Dash Core related to signing
sessions:

+-----------------------+-----------------------+-----------------------+
| Parameter             | Timeout, sec          | Description           |
+=======================+=======================+=======================+
| ``SESSION             | 60                    | Time to wait for new  |
| _NEW_SHARES_TIMEOUT`` |                       | shares                |
+-----------------------+-----------------------+-----------------------+
| ``SIG_SH              | 5                     | Time to wait for a    |
| ARE_REQUEST_TIMEOUT`` |                       | requested share       |
|                       |                       | before requesting     |
|                       |                       | from a different node |
+-----------------------+-----------------------+-----------------------+
| ``SE                  | 300                   | Time to wait for      |
| SSION_TOTAL_TIMEOUT`` |                       | session to complete   |
+-----------------------+-----------------------+-----------------------+

Quorum Configuration
====================

Mainnet and Testnet only use quorums of pre-defined sizes that are hard
coded into Dash Core. RegTest and Devnet environments each have a quorum
that supports custom size and threshold parameters that are controlled
via command line or configuration file parameters
(``llmqtestparams``/``llmqdevnetparams``).

A list of all the quorums and their default sizes can be found in the
`Current LLMQ Types
table <https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types>`__
found in DIP-6.
