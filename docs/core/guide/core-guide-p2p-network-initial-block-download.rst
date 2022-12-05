Before a full <> can validate unconfirmed transactions and
recently-mined <>, it must download and validate all blocks from block 1
(the block after the hardcoded <>) to the current tip of the best <>.
This is the <> (IBD) or initial sync.

Although the word “initial” implies this method is only used once, it
can also be used any time a large number of blocks need to be
downloaded, such as when a previously-caught-up node has been offline
for a long time. In this case, a node can use the IBD method to download
all the blocks which were produced since the last time it was online.

Dash Core uses the IBD method any time the last block on its local best
block chain has a <> time more than 24 hours in the past. Dash Core will
also perform IBD if its local best block chain is more than 144 blocks
lower than its local best <> (that is, the local block chain is more
than about 6 hours in the past).

Blocks-First
============

Dash Core (up until version 0.12.0.x) uses a simple initial block
download (IBD) method we’ll call *blocks-first*. The goal is to download
the blocks from the best block chain in sequence.

.. figure:: https://dash-docs.github.io/img/dev/en-blocks-first-flowchart.svg
   :alt: Overview Of Blocks-First Method

   Overview Of Blocks-First Method

The first time a node is started, it only has a single block in its
local best block chain—the hardcoded genesis block (block 0). This node
chooses a remote <>, called the sync node, and sends it the
```getblocks`` message <core-ref-p2p-network-data-messages#getblocks>`__
illustrated below.

.. figure:: https://dash-docs.github.io/img/dev/en-ibd-getblocks.svg
   :alt: First GetBlocks Message Sent During IBD

   First GetBlocks Message Sent During IBD

In the header hashes field of the ```getblocks``
message <core-ref-p2p-network-data-messages#getblocks>`__, this new node
sends the header hash of the only block it has, the genesis block
(``b67a...0000`` in <>). It also sets the stop hash field to all zeroes
to request a maximum-size response.

Upon receipt of the ```getblocks``
message <core-ref-p2p-network-data-messages#getblocks>`__, the sync node
takes the first (and only) header hash and searches its local best block
chain for a block with that header hash. It finds that block 0 matches,
so it replies with 500 block <> (the maximum response to a
```getblocks``
message <core-ref-p2p-network-data-messages#getblocks>`__) starting from
block 1. It sends these inventories in the ```inv``
message <core-ref-p2p-network-data-messages#inv>`__ illustrated below.

.. figure:: https://dash-docs.github.io/img/dev/en-ibd-inv.svg
   :alt: First Inv Message Sent During IBD

   First Inv Message Sent During IBD

Inventories are unique identifiers for information on the <>. Each
inventory contains a type field and the unique identifier for an
instance of the object. For blocks, the unique identifier is a hash of
the block’s header.

The block inventories appear in the ```inv``
message <core-ref-p2p-network-data-messages#inv>`__ in the same order
they appear in the block chain, so this first ```inv``
message <core-ref-p2p-network-data-messages#inv>`__ contains inventories
for blocks 1 through 501. (For example, the hash of block 1 is
``4343...0000`` as seen in the illustration above.)

The IBD node uses the received inventories to request 128 blocks from
the sync node in the ```getdata``
message <core-ref-p2p-network-data-messages#getdata>`__ illustrated
below.

.. figure:: https://dash-docs.github.io/img/dev/en-ibd-getdata.svg
   :alt: First GetData Message Sent During IBD

   First GetData Message Sent During IBD

It’s important to <> nodes that the blocks be requested and sent in
order because each block header references the header hash of the
preceding block. That means the IBD node can’t fully validate a block
until its parent block has been received. Blocks that can’t be validated
because their parents haven’t been received are called <>; a subsection
below describes them in more detail.

Upon receipt of the ```getdata``
message <core-ref-p2p-network-data-messages#getdata>`__, the sync node
replies with each of the blocks requested. Each block is put into <>
format and sent in a separate ```block``
message <core-ref-p2p-network-data-messages#block>`__. The first
```block`` message <core-ref-p2p-network-data-messages#block>`__ sent
(for block 1) is illustrated below.

.. figure:: https://dash-docs.github.io/img/dev/en-ibd-block.svg
   :alt: First Block Message Sent During IBD

   First Block Message Sent During IBD

The IBD node downloads each block, validates it, and then requests the
next block it hasn’t requested yet, maintaining a queue of up to 128
blocks to download. When it has requested every block for which it has
an inventory, it sends another ```getblocks``
message <core-ref-p2p-network-data-messages#getblocks>`__ to the sync
node requesting the inventories of up to 500 more blocks. This second
```getblocks`` message <core-ref-p2p-network-data-messages#getblocks>`__
contains multiple header hashes as illustrated below:

.. figure:: https://dash-docs.github.io/img/dev/en-ibd-getblocks2.svg
   :alt: Second GetBlocks Message Sent During IBD

   Second GetBlocks Message Sent During IBD

Upon receipt of the second ```getblocks``
message <core-ref-p2p-network-data-messages#getblocks>`__, the sync node
searches its local best block chain for a block that matches one of the
header hashes in the message, trying each hash in the order they were
received. If it finds a matching hash, it replies with 500 block
inventories starting with the next block from that point. But if there
is no matching hash (besides the stopping hash), it assumes the only
block the two nodes have in common is block 0 and so it sends an ``inv``
starting with block 1 (the same ```inv``
message <core-ref-p2p-network-data-messages#inv>`__ seen several
illustrations above).

This repeated search allows the sync node to send useful inventories
even if the IBD node’s local block chain forked from the sync node’s
local block chain. This <> detection becomes increasingly useful the
closer the IBD node gets to the tip of the block chain.

When the IBD node receives the second ```inv``
message <core-ref-p2p-network-data-messages#inv>`__, it will request
those blocks using ```getdata``
messages <core-ref-p2p-network-data-messages#getdata>`__. The sync node
will respond with ```block``
messages <core-ref-p2p-network-data-messages#block>`__. Then the IBD
node will request more inventories with another ```getblocks``
message <core-ref-p2p-network-data-messages#getblocks>`__—and the cycle
will repeat until the IBD node is synced to the tip of the block chain.
At that point, the node will accept blocks sent through the regular
block broadcasting described in a later subsection.

Blocks-First Advantages & Disadvantages
---------------------------------------

The primary advantage of <> <> is its simplicity. The primary
disadvantage is that the IBD node relies on a single sync node for all
of its downloading. This has several implications:

-  **Speed Limits:** All requests are made to the sync node, so if the
   sync node has limited upload bandwidth, the IBD node will have slow
   download speeds. Note: if the sync node goes offline, Dash Core will
   continue downloading from another node—but it will still only
   download from a single sync node at a time.

-  **Download Restarts:** The sync node can send a non-best (but
   otherwise valid) block chain to the IBD node. The IBD node won’t be
   able to identify it as non-best until the initial block download
   nears completion, forcing the IBD node to restart its block chain
   download over again from a different node. Dash Core ships with
   several block chain checkpoints at various block heights selected by
   developers to help an IBD node detect that it is being fed an
   alternative block chain history—allowing the IBD node to restart its
   download earlier in the process.

-  **Disk Fill Attacks:** Closely related to the download restarts, if
   the sync node sends a non-best (but otherwise valid) block chain, the
   chain will be stored on disk, wasting space and possibly filling up
   the disk drive with useless data.

-  **High Memory Use:** Whether maliciously or by accident, the sync
   node can send blocks out of order, creating orphan blocks which can’t
   be validated until their parents have been received and validated.
   Orphan blocks are stored in memory while they await validation, which
   may lead to high memory use.

All of these problems are addressed in part or in full by the
headers-first IBD method used since Dash Core 0.12.0.x.

**Resources:** The table below summarizes the messages mentioned
throughout this subsection. The links in the message field will take you
to the reference page for that message.

+-------------+-------------+-------------+-------------+-------------+
| **Message** | `getblocks  | `inv        | `getdata    | `block      |
|             | me          | message     | message <co | message <   |
|             | ssage <core |  <core-ref- | re-ref-p2p- | core-ref-p2 |
|             | -ref-p2p-ne | p2p-network | network-dat | p-network-d |
|             | twork-data- | -data-messa | a-messages# | ata-message |
|             | messages#ge | ges#inv>`__ | getdata>`__ | s#block>`__ |
|             | tblocks>`__ |             |             |             |
+=============+=============+=============+=============+=============+
| **From→To** | IBD→Sync    | Sync→IBD    | IBD→Sync    | Sync→IBD    |
+-------------+-------------+-------------+-------------+-------------+
| **Payload** | One or more | Up to 500   | One or more | One         |
|             | header      | block       | block       | serialized  |
|             | hashes      | inventories | inventories | block       |
|             |             | (unique     |             |             |
|             |             | i           |             |             |
|             |             | dentifiers) |             |             |
+-------------+-------------+-------------+-------------+-------------+

Headers-First
=============

Dash Core 0.12.0+ uses an <> (IBD) method called *<>*. The goal is to
download the <> for the best <>, partially validate them as best as
possible, and then download the corresponding <> in parallel. This
solves several problems with the older <> IBD method.

.. figure:: https://dash-docs.github.io/img/dev/en-headers-first-flowchart.svg
   :alt: Overview Of Headers-First Method

   Overview Of Headers-First Method

The first time a node is started, it only has a single block in its
local best <>—the hardcoded <> (block 0). The node chooses a remote <>,
which we’ll call the sync node, and sends it the ```getheaders``
message <core-ref-p2p-network-data-messages#getheaders>`__ illustrated
below.

.. figure:: https://dash-docs.github.io/img/dev/en-ibd-getheaders.svg
   :alt: First getheaders message

   First getheaders message

In the header hashes field of the ```getheaders``
message <core-ref-p2p-network-data-messages#getheaders>`__, the new node
sends the header hash of the only block it has, the genesis block
(``b67a...0000`` in internal byte order). It also sets the stop hash
field to all zeroes to request a maximum-size response.

Upon receipt of the ```getheaders``
message <core-ref-p2p-network-data-messages#getheaders>`__, the sync
node takes the first (and only) header hash and searches its local best
block chain for a block with that header hash. It finds that block 0
matches, so it replies with 2,000 header (the maximum response) starting
from block 1. It sends these header hashes in the ```headers``
message <core-ref-p2p-network-data-messages#headers>`__ illustrated
below.

.. figure:: https://dash-docs.github.io/img/dev/en-ibd-headers.svg
   :alt: First headers message

   First headers message

The <> <> can partially validate these block headers by ensuring that
all fields follow <> and that the hash of the header is below the <>
according to the nBits field. (Full validation still requires all
transactions from the corresponding block.)

After the IBD node has partially validated the block headers, it can do
two things in parallel:

1. **Download More Headers:** the IBD node can send another
   ```getheaders``
   message <core-ref-p2p-network-data-messages#getheaders>`__ to the
   sync node to request the next 2,000 headers on the best header chain.
   Those headers can be immediately validated and another batch
   requested repeatedly until a ```headers``
   message <core-ref-p2p-network-data-messages#headers>`__ is received
   from the sync node with fewer than 2,000 headers, indicating that it
   has no more headers to offer. A <> sync for 1 million blocks can be
   completed in 500 round trips, or about 80 MB of downloaded data.

   Once the IBD node receives a ```headers``
   message <core-ref-p2p-network-data-messages#headers>`__ with fewer
   than 2,000 headers from the sync node, it sends a ```getheaders``
   message <core-ref-p2p-network-data-messages#getheaders>`__ to each of
   its outbound peers to get their view of best header chain. By
   comparing the responses, it can easily determine if the headers it
   has downloaded belong to the best header chain reported by any of its
   outbound peers. This means a dishonest sync node will quickly be
   discovered even if checkpoints aren’t used (as long as the IBD node
   connects to at least one honest peer; Dash Core will continue to
   provide checkpoints in case honest peers can’t be found).

2. **Download Blocks:** While the IBD node continues downloading
   headers, and after the headers finish downloading, the IBD node will
   request and download each <>. The IBD node can use the block header
   hashes it computed from the header chain to create ```getdata``
   messages <core-ref-p2p-network-data-messages#getdata>`__ that request
   the blocks it needs by their <>. It doesn’t need to request these
   from the sync node—it can request them from any of its full node <>.
   (Although not all full nodes may store all blocks.) This allows it to
   fetch blocks in parallel and avoid having its download speed
   constrained to the upload speed of a single sync node.

   To spread the load between multiple peers, Dash Core will only
   request up to 16 blocks at a time from a single peer. Combined with
   its maximum of 8 outbound connections, this means Dash Core using
   headers-first will request a maximum of 128 blocks simultaneously
   during IBD (the same maximum number that blocks-first Dash Core
   requested from its sync node).

.. figure:: https://dash-docs.github.io/img/dev/en-headers-first-moving-window.svg
   :alt: Simulated Headers-First Download Window

   Simulated Headers-First Download Window

Dash Core’s headers-first mode uses a 1,024-block moving download window
to maximize download speed. The lowest-height block in the window is the
next block to be validated; if the block hasn’t arrived by the time Dash
Core is ready to validate it, Dash Core will wait a minimum of two more
seconds for the stalling node to send the block. If the block still
hasn’t arrived, Dash Core will disconnect from the stalling node and
attempt to connect to another node. For example, in the illustration
above, Node A will be disconnected if it doesn’t send block 3 within at
least two seconds.

Once the IBD node is synced to the tip of the block chain, it will
accept blocks sent through the regular block broadcasting described in a
later subsection.

**Resources:** The table below summarizes the messages mentioned
throughout this subsection. The links in the message field will take you
to the reference page for that message.

+-------------+-------------+-------------+-------------+-------------+
| **Message** | `getheaders | `headers    | `getdata    | `block      |
|             | mes         | message <co | message <co | message <   |
|             | sage <core- | re-ref-p2p- | re-ref-p2p- | core-ref-p2 |
|             | ref-p2p-net | network-dat | network-dat | p-network-d |
|             | work-data-m | a-messages# | a-messages# | ata-message |
|             | essages#get | headers>`__ | getdata>`__ | s#block>`__ |
|             | headers>`__ |             |             |             |
+=============+=============+=============+=============+=============+
| **From→To** | IBD→Sync    | Sync→IBD    | I           | *           |
|             |             |             | BD→\ *Many* | Many*\ →IBD |
+-------------+-------------+-------------+-------------+-------------+
| **Payload** | One or more | Up to 2,000 | One or more | One         |
|             | header      | block       | block       | serialized  |
|             | hashes      | headers     | inventories | block       |
|             |             |             | derived     |             |
|             |             |             | from header |             |
|             |             |             | hashes      |             |
+-------------+-------------+-------------+-------------+-------------+
