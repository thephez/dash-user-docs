When a <> discovers a new <>, it broadcasts the new block to its <>
using one of the following methods:

-  **<>:** The miner sends a ```block``
   message <core-ref-p2p-network-data-messages#block>`__ to each of its
   full node peers with the new block. The miner can reasonably bypass
   the standard relay method in this way because it knows none of its
   peers already have the just-discovered block.

-  **<>:** The miner, acting as a standard relay node, sends an ```inv``
   message <core-ref-p2p-network-data-messages#inv>`__ to each of its
   peers (both full node and SPV) with an inventory referring to the new
   block. The most common responses are:

   -  Each <> (BF) peer that wants the block replies with a ```getdata``
      message <core-ref-p2p-network-data-messages#getdata>`__ requesting
      the full block.

   -  Each <> (HF) peer that wants the block replies with a
      ```getheaders``
      message <core-ref-p2p-network-data-messages#getheaders>`__
      containing the header hash of the highest-height header on its
      best header chain, and likely also some headers further back on
      the best header chain to allow <> detection. That message is
      immediately followed by a ```getdata``
      message <core-ref-p2p-network-data-messages#getdata>`__ requesting
      the full block. By requesting headers first, a headers-first peer
      can refuse <> as described in the subsection below.

   -  Each <> (SPV) client that wants the block replies with a
      ```getdata``
      message <core-ref-p2p-network-data-messages#getdata>`__ typically
      requesting a <>.

   The miner replies to each request accordingly by sending the block in
   a ```block`` message <core-ref-p2p-network-data-messages#block>`__,
   one or more headers in a ```headers``
   message <core-ref-p2p-network-data-messages#headers>`__, or the
   merkle block and transactions relative to the SPV client’s <> in a
   ```merkleblock``
   message <core-ref-p2p-network-data-messages#merkleblock>`__ followed
   by zero or more ```tx``
   messages <core-ref-p2p-network-data-messages#tx>`__.

By default, Dash Core broadcasts blocks using <>, but it will accept
blocks sent using either of the methods described above.

Full nodes validate the received block and then advertise it to their
peers using the standard block relay method described above. The
condensed table below highlights the operation of the messages described
above (Relay, BF, HF, and SPV refer to the relay node, a <> node, a <>
node, and an <> client; *any* refers to a node using any block retrieval
method.)

+-------------+-------------+-------------+-------------+-------------+
| **Message** | `inv        | `getdata    | `getheaders | `headers    |
|             | message     | message <co | mes         | message <co |
|             |  <core-ref- | re-ref-p2p- | sage <core- | re-ref-p2p- |
|             | p2p-network | network-dat | ref-p2p-net | network-dat |
|             | -data-messa | a-messages# | work-data-m | a-messages# |
|             | ges#inv>`__ | getdata>`__ | essages#get | headers>`__ |
|             |             |             | headers>`__ |             |
+=============+=============+=============+=============+=============+
| **From→To** | Re          | BF→Relay    | HF→Relay    | Relay→HF    |
|             | lay→\ *Any* |             |             |             |
+-------------+-------------+-------------+-------------+-------------+
| **Payload** | The         | The         | One or more | Up to 2,000 |
|             | inventory   | inventory   | header      | headers     |
|             | of the new  | of the new  | hashes on   | connecting  |
|             | block       | block       | the HF      | HF node’s   |
|             |             |             | node’s best | BHC to      |
|             |             |             | header      | relay       |
|             |             |             | chain (BHC) | node’s BHC  |
+-------------+-------------+-------------+-------------+-------------+
| **Message** | ```block``  | ```me       | ```tx``     |             |
|             | message <   | rkleblock`` | messag      |             |
|             | core-ref-p2 | mess        | e <core-ref |             |
|             | p-network-d | age <core-r | -p2p-networ |             |
|             | ata-message | ef-p2p-netw | k-data-mess |             |
|             | s#block>`__ | ork-data-me | ages#tx>`__ |             |
|             |             | ssages#merk |             |             |
|             |             | leblock>`__ |             |             |
+-------------+-------------+-------------+-------------+-------------+
| **From→To** | Relay→BF/HF | Relay→SPV   | Relay→SPV   |             |
+-------------+-------------+-------------+-------------+-------------+
| **Payload** | The new     | The new     | Serialized  |             |
|             | block in    | block       | t           |             |
|             | `serialized | filtered    | ransactions |             |
|             | format      | into a      | from the    |             |
|             |  <core-ref- | merkle      | new block   |             |
|             | block-chain | block       | that match  |             |
|             | -serialized |             | the bloom   |             |
|             | -blocks>`__ |             | filter      |             |
+-------------+-------------+-------------+-------------+-------------+

Orphan Blocks
=============

Blocks-first nodes may download <>—blocks whose previous <> hash field
refers to a block header this node hasn’t seen yet. In other words,
orphan blocks have no known parent (unlike <>, which have known parents
but which aren’t part of the best <>).

.. figure:: https://dash-docs.github.io/img/dev/en-orphan-stale-definition.svg
   :alt: Difference Between Orphan And Stale Blocks

   Difference Between Orphan And Stale Blocks

When a <> node downloads an orphan block, it will not validate it.
Instead, it will send a ```getblocks``
message <core-ref-p2p-network-data-messages#getblocks>`__ to the node
which sent the orphan block; the broadcasting node will respond with an
```inv`` message <core-ref-p2p-network-data-messages#inv>`__ containing
<> of any blocks the downloading node is missing (up to 500); the
downloading node will request those blocks with a ```getdata``
message <core-ref-p2p-network-data-messages#getdata>`__; and the
broadcasting node will send those blocks with a ```block``
message <core-ref-p2p-network-data-messages#block>`__. The downloading
node will validate those blocks, and once the parent of the former
orphan block has been validated, it will validate the former orphan
block.

Headers-first nodes avoid some of this complexity by always requesting
block headers with the ```getheaders``
message <core-ref-p2p-network-data-messages#getheaders>`__ before
requesting a block with the ```getdata``
message <core-ref-p2p-network-data-messages#getdata>`__. The
broadcasting node will send a ```headers``
message <core-ref-p2p-network-data-messages#headers>`__ containing all
the block headers (up to 2,000) it thinks the downloading node needs to
reach the tip of the best header chain; each of those headers will point
to its parent, so when the downloading node receives the ```block``
message <core-ref-p2p-network-data-messages#block>`__, the block
shouldn’t be an orphan block—all of its parents should be known (even if
they haven’t been validated yet). If, despite this, the block received
in the ```block`` message <core-ref-p2p-network-data-messages#block>`__
is an orphan block, a headers-first node will discard it immediately.
[block:callout] { “type”: “info”, “body”: “Note: Orphan discarding does
mean that headers-first nodes will ignore orphan blocks sent by miners
in an unsolicited block push.” } [/block]
