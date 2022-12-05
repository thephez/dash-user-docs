-  `GET Block </docs/core-api-ref-http-rest-requests#get-block>`__ gets
   a block with a particular header hash from the local block database
   either as a JSON object or as a serialized block. *Updated in Bitcoin
   Core 0.13.0*
-  `GET
   Block/NoTxDetails </docs/core-api-ref-http-rest-requests#get-blocknotxdetails>`__
   gets a block with a particular header hash from the local block
   database either as a JSON object or as a serialized block. The JSON
   object includes TXIDs for transactions within the block rather than
   the complete transactions `GET
   block </docs/core-api-ref-http-rest-requests#get-block>`__ returns.
   *Updated in Bitcoin Core 0.13.0*
-  `GET
   BlockHashByHeight </docs/core-api-ref-http-rest-requests#get-blockhashbyheight>`__
   returns the hash of a block in best-block-chain at the height
   provided. The hash can be returned as a JSON object or serialized as
   binary or hex. **Added in Dash Core 18.0.0**
-  `GET
   ChainInfo </docs/core-api-ref-http-rest-requests#get-chaininfo>`__
   returns information about the current state of the block chain.
   *Updated in Bitcoin Core 0.12.0*
-  `GET GetUtxos </docs/core-api-ref-http-rest-requests#get-getutxos>`__
   returns an UTXO set given a set of outpoints. *New in Bitcoin Core
   0.11.0*
-  `GET Headers </docs/core-api-ref-http-rest-requests#get-headers>`__
   returns a specified amount of block headers in upward direction.
   *Updated in Bitcoin Core 0.13.0*
-  `GET
   MemPool/Contents </docs/core-api-ref-http-rest-requests#get-mempoolcontents>`__
   returns all transaction in the memory pool with detailed information.
   *New in Bitcoin Core 0.12.0*
-  `GET
   MemPool/Info </docs/core-api-ref-http-rest-requests#get-mempoolinfo>`__
   returns information about the node’s current transaction memory pool.
   *New in Bitcoin Core 0.12.0*
-  `GET Tx </docs/core-api-ref-http-rest-requests#get-tx>`__ gets a
   hex-encoded serialized transaction or a JSON object describing the
   transaction. By default, Dash Core only stores complete transaction
   data for UTXOs and your own transactions, so this method may fail on
   historic transactions unless you use the non-default ``txindex=1`` in
   your Dash Core startup settings. *Updated in Bitcoin Core 0.13.0*
