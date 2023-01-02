ChainLocks
**********

Dash’s <> feature leverages <> Signing Requests/Sessions to reduce
uncertainty when receiving funds and remove the possibility of 51%
mining attacks.

For each block, an LLMQ of a few hundred <> (300-400) is selected and
each participating member signs the first <> that it sees extending the
active chain at the current <>. If enough members (at least 240) see the
same block as the first block, they will be able to create a ```clsig``
message <core-ref-p2p-network-instantsend-messages#clsig>`__ and
propagate it to all <> in the <>.

If a valid ```clsig``
message <core-ref-p2p-network-instantsend-messages#clsig>`__ is received
by a node, it must reject all blocks (and any descendants) at the same
height that do not match the block specified in the ```clsig``
message <core-ref-p2p-network-instantsend-messages#clsig>`__. This makes
the decision on the active chain quick, easy and unambiguous. It also
makes reorganizations below this block impossible.

With LLMQ-based <>, a ChainLock is only attempted once all <> in the
block are locked via InstantSend. If a block contains unlocked
transactions, retroactive InstantSend locks are established prior to a
ChainLock.

ChainLocks have been active on the Dash network since block 1088640 in
June of 2019. Please read `DIP8
ChainLocks <https://github.com/dashpay/dips/blob/master/dip-0008.md>`__
for additional details.
