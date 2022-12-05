.. figure:: https://dash-docs.github.io/img/dev/en-blockchain-overview.svg
   :alt: Block Chain Overview

   Block Chain Overview

The illustration above shows a simplified version of a <>. A <> of one
or more new transactions is collected into the <> data part of a block.
Copies of each transaction are hashed, and the hashes are then paired,
hashed, paired again, and hashed again until a single hash remains, the
<> of a <>.

The merkle root is stored in the <>. Each block also stores the hash of
the previous block’s header, chaining the blocks together. This ensures
a transaction cannot be modified without modifying the block that
records it and all following blocks.

Transactions are also chained together. Dash <> software gives the
impression that <> are sent from and to wallets, but Dash value really
moves from transaction to transaction. Each transaction spends the duffs
previously received in one or more earlier transactions, so the input of
one transaction is the output of a previous transaction.

.. figure:: https://dash-docs.github.io/img/dev/en-transaction-propagation.svg
   :alt: Transaction Propagation

   Transaction Propagation

A single transaction can create multiple <>, as would be the case when
sending to multiple <>, but each output of a particular transaction can
only be used as an <> once in the block chain. Any subsequent reference
is a forbidden double spend—an attempt to spend the same duffs twice.

Outputs are tied to <> ( TXIDs), which are the hashes of signed
transactions.

Because each output of a particular transaction can only be spent once,
the outputs of a transaction included in the block chain can be
categorized as either an <> or a spent transaction output. For a payment
to be valid, it must only use UTXOs as inputs.

Ignoring coinbase transactions (described later), if the value of a
transaction’s outputs exceed its inputs, the transaction will be
rejected—but if the inputs exceed the value of the outputs, any
difference in value may be claimed as a <> by the Dash <> who creates
the block containing that transaction. For example, in the illustration
above, each transaction spends 10,000 duffs fewer than it receives from
its combined inputs, effectively paying a 10,000 duff transaction fee.
