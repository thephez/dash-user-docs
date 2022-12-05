As illustrated below, solo miners typically use ``dashd`` to get new <>
from the <>. Their mining software periodically polls ``dashd`` for new
transactions using the ```getblocktemplate``
RPC <core-api-ref-remote-procedure-calls-mining#getblocktemplate>`__,
which provides the list of new transactions plus the <> to which the <>
should be sent.

.. figure:: https://dash-docs.github.io/img/dev/en-solo-mining-overview.svg
   :alt: Solo Bitcoin Mining

   Solo Bitcoin Mining

The mining software constructs a block using the template (described
below) and creates a <>. It then sends the 80-byte block header to its
mining hardware (an ASIC) along with a <> (difficulty setting). The
mining hardware iterates through every possible value for the block
header nonce and generates the corresponding hash.

If none of the hashes are below the threshold, the mining hardware gets
an updated block header with a new <> from the mining software; this new
block header is created by adding extra nonce data to the coinbase field
of the coinbase transaction.

On the other hand, if a hash is found below the target threshold, the
mining hardware returns the block header with the successful nonce to
the mining software. The mining software combines the header with the
block and sends the completed block to ``dashd`` to be broadcast to the
network for addition to the block chain.
