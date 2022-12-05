Any Dash <> who successfully hashes a <> to a value below the <> can add
the entire <> to the <> (assuming the block is otherwise valid). These
blocks are commonly addressed by their <>—the number of blocks between
them and the first Dash block (block 0, most commonly known as the <>).

.. figure:: https://dash-docs.github.io/img/dev/en-blockchain-fork.svg
   :alt: Common And Uncommon Block Chain Forks

   Common And Uncommon Block Chain Forks

Multiple blocks can all have the same block height, as is common when
two or more miners each produce a block at roughly the same time. This
creates an apparent <> in the block chain, as shown in the illustration
above.

When miners produce simultaneous blocks at the end of the block chain,
each <> individually chooses which block to accept. In the absence of
other considerations, discussed below, nodes usually use the first block
they see.

Eventually a miner produces another block which attaches to only one of
the competing simultaneously-mined blocks. This makes that side of the
fork stronger than the other side. Assuming a fork only contains valid
blocks, normal <> always follow the most difficult chain to recreate and
throw away any <> belonging to shorter forks. (Stale blocks are also
sometimes called orphans or orphan blocks, but those terms are also used
for true orphan blocks without a known parent block.)

Long-term forks are possible if different miners work at cross-purposes,
such as some miners diligently working to extend the block chain at the
same time other miners are attempting a <> to revise transaction
history.

Since multiple blocks can have the same height during a block chain
fork, block height should not be used as a globally unique identifier.
Instead, blocks are usually referenced by the hash of their header
(often with the byte order reversed, and in hexadecimal).
