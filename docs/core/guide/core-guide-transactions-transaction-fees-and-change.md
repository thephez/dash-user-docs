# Transaction Fees and Change

Transactions pay fees based on the total byte size of the signed transaction. Fees per byte are calculated based on current demand for space in mined blocks with fees rising as demand increases.  The <<glossary:transaction fee>> is given to the Dash miner, as explained in the [block chain section](core-guide-block-chain), and so it is ultimately up to each <<glossary:miner>> to choose the minimum transaction fee they will accept.

All transactions are prioritized based on their fee per byte, with higher-paying transactions being added in sequence until all of the available space is filled.

As of Dash Core 0.12.2.x, a <<glossary:minimum relay fee>> (1,000 <<glossary:duffs>> following [DIP1](https://github.com/dashpay/dips/blob/master/dip-0001.md) activation) is required to broadcast a transaction across the <<glossary:network>>. Any transaction paying only the minimum fee should be prepared to wait a long time before there's enough spare space in a block to include it.

Since each transaction spends Unspent Transaction Outputs (UTXOs) and because a UTXO can only be spent once, the full value of the included UTXOs must be spent or given to a miner as a <<glossary:transaction fee>>.  Few people will have UTXOs that exactly match the amount they want to pay, so most transactions include a change output.

A <<glossary:change output>> is a regular output which spends the surplus duffs from the UTXOs back to the spender. Change outputs can reuse the same P2PKH pubkey hash or P2SH script hash as was used in the UTXO, but for the reasons described in the [next subsection](core-guide-transactions-avoiding-key-reuse), it is highly recommended that change outputs be sent to a new <<glossary:P2PKH>> or <<glossary:P2SH>> <<glossary:address>>.