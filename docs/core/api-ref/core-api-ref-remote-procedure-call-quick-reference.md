# Quick Reference

## [Addressindex RPCs](../api-ref/core-api-ref-remote-procedure-calls-address-index.md)


These RPCs are all Dash-specific and not found in Bitcoin Core

* [GetAddressBalance](../api-ref/core-api-ref-remote-procedure-calls-address-index.md#getaddressbalance): returns the balance for address(es).
* [GetAddressDeltas](../api-ref/core-api-ref-remote-procedure-calls-address-index.md#getaddressdeltas): returns all changes for an address.
* [GetAddressMempool](../api-ref/core-api-ref-remote-procedure-calls-address-index.md#getaddressmempool): returns all mempool deltas for an address.
* [GetAddressTxids](../api-ref/core-api-ref-remote-procedure-calls-address-index.md#getaddresstxids): returns the txids for an address(es).
* [GetAddressUtxos](../api-ref/core-api-ref-remote-procedure-calls-address-index.md#getaddressutxos): returns all unspent outputs for an address.

## [Block Chain RPCs](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md)

* [GetBestBlockHash](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getbestblockhash): returns the header hash of the most recent block on the best block chain.
* [DumpTxOutset](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#dumptxoutset): Write the serialized UTXO set to disk. **New in Dash Core 18.1.0**
* [GetBestChainLock](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getbestchainlock): returns the block hash of the best chainlock. _New in Dash Core 0.15.0_
* [GetBlock](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getblock): gets a block with a particular header hash from the local block database either as a JSON object or as a serialized block. _Updated in Dash Core 0.16.0_
* [GetBlockChainInfo](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getblockchaininfo): provides information about the current state of the block chain. _Updated in Dash Core 0.16.0_
* [GetBlockCount](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getblockcount): returns the number of blocks in the local best block chain.
* [GetBlockFilter](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getblockfilter): retrieves a [BIP157](https://github.com/bitcoin/bips/blob/master/bip-0157.mediawiki) content filter for a particular block. **New in Dash Core 18.0.0**
* [GetBlockHash](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getblockhash): returns the header hash of a block at the given height in the local best block chain.
* [GetBlockHashes](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getblockhashes): returns array of hashes of blocks within the timestamp range provided (requires `timestampindex` to be enabled). New in Dash Core 0.12.1
* [GetBlockHeader](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getblockheader): gets a block header with a particular header hash from the local block database either as a JSON object or as a serialized block header. _Updated in Dash Core 0.16.0_
* [GetBlockHeaders](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getblockheaders): returns an array of items with information about the requested number of blockheaders starting from the requested hash. New in Dash Core 0.12.1
* [GetBlockStats](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getblockstats): computes per block statistics for a given window. **Updated in Dash Core 18.0.0**
* [GetChainTips](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getchaintips): returns information about the highest-height block (tip) of each local block chain. *Updated in Dash Core 0.12.3*
* [GetChainTxStats](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getchaintxstats): compute statistics about the total number and rate of transactions in the chain. **Updated in Dash Core 18.0.0**
* [GetDifficulty](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getdifficulty): returns the proof-of-work difficulty as a multiple of the minimum difficulty.
* [GetMemPoolAncestors](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getmempoolancestors): returns all in-mempool ancestors for a transaction in the mempool. **_Updated in Dash Core 0.17.0_**
* [GetMemPoolDescendants](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getmempooldescendants): returns all in-mempool descendants for a transaction in the mempool. **_Updated in Dash Core 0.17.0_**
* [GetMemPoolEntry](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getmempoolentry): returns mempool data for given transaction (must be in mempool). **_Updated in Dash Core 0.17.0_**
* [GetMemPoolInfo](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getmempoolinfo): returns information about the node's current transaction memory pool. _Updated in Dash Core 0.16.0_
* [GetRawMemPool](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getrawmempool): returns all transaction identifiers (TXIDs) in the memory pool as a JSON array, or detailed information about each transaction in the memory pool as a JSON object. **_Updated in Dash Core 0.17.0_**
* [GetMerkleBlocks](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getmerkleblocks): returns an array of hex-encoded merkleblocks for <count> blocks starting from <hash> which match <filter>. _New in Dash Core 0.15.0_
* [GetSpecialTxes](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getspecialtxes): returns an array of special transactions found in the specified block _New in Dash Core 0.13.1_
* [GetSpentInfo](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getspentinfo): returns the txid and index where an output is spent (requires `spentindex` to be enabled). New in Dash Core 0.12.1
* [GetTxOut](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#gettxout): returns details about an unspent transaction output (UTXO). _Updated in Dash Core 0.15.0_
* [GetTxOutProof](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#gettxoutproof): returns a hex-encoded proof that one or more specified transactions were included in a block.
* [GetTxOutSetInfo](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#gettxoutsetinfo): returns statistics about the confirmed unspent transaction output (UTXO) set. Note that this call may take some time and that it only counts outputs from confirmed transactions---it does not count outputs from the memory pool. **Updated in Dash Core 18.1.0**
* [PreciousBlock](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#preciousblock): treats a block as if it were received before others with the same work. *New in Dash Core 0.12.3*
* [PruneBlockChain](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#pruneblockchain): prunes the blockchain up to a specified height or timestamp. *New in Dash Core 0.12.3*
* [SaveMemPool](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#savemempool): dumps the mempool to disk. _New in Dash Core 0.16.0_
* [VerifyChain](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#verifychain): verifies each entry in the local block chain database.
* [VerifyTxOutProof](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#verifytxoutproof): verifies that a proof points to one or more transactions in a block, returning the transactions the proof commits to and throwing an RPC error if the block is not in our best block chain.

## [Control RPCs](../api-ref/core-api-ref-remote-procedure-calls-control.md)

* [Debug](../api-ref/core-api-ref-remote-procedure-calls-control.md#debug): changes the debug category from the console. **Updated in Dash Core 18.0.0**
* [GetMemoryInfo](../api-ref/core-api-ref-remote-procedure-calls-control.md#getmemoryinfo): returns information about memory usage. _Updated in Dash Core 0.15.0_
* [GetRPCInfo](../api-ref/core-api-ref-remote-procedure-calls-control.md#getrpcinfo): returns details about the RPC server. **New in Dash Core 18.0.0**
* [Help](../api-ref/core-api-ref-remote-procedure-calls-control.md#help): lists all available public RPC commands, or gets help for the specified RPC.  Commands which are unavailable will not be listed, such as wallet RPCs if wallet support is disabled. **_Updated in Dash Core 0.17.0_**
* [Logging](../api-ref/core-api-ref-remote-procedure-calls-control.md#logging): gets and sets the logging configuration **Updated in Dash Core 18.0.0**
* [Stop](../api-ref/core-api-ref-remote-procedure-calls-control.md#stop): safely shuts down the Dash Core server.
* [Uptime](../api-ref/core-api-ref-remote-procedure-calls-control.md#uptime): returns the total uptime of the server. _New in Dash Core 0.15.0_

## [Dash RPCs](../api-ref/core-api-ref-remote-procedure-calls-dash.md)

* [GetGovernanceInfo](../api-ref/core-api-ref-remote-procedure-calls-dash.md#getgovernanceinfo): returns an object containing governance parameters. **Updated in Dash Core 18.1.0**
* [GetCoinJoinInfo](../api-ref/core-api-ref-remote-procedure-calls-dash.md#getcoinjoininfo): returns an object containing an information about CoinJoin settings and state. _New in Dash Core 0.15.0_
* [GetSuperblockBudget](../api-ref/core-api-ref-remote-procedure-calls-dash.md#getsuperblockbudget): returns the absolute maximum sum of superblock payments allowed.
* [GObject](../api-ref/core-api-ref-remote-procedure-calls-dash.md#gobject): provides a set of commands for managing governance objects and displaying information about them. **_Updated in Dash Core 0.17.0_**
* [Masternode](../api-ref/core-api-ref-remote-procedure-calls-dash.md#masternode): provides a set of commands for managing masternodes and displaying information about them. **Updated in Dash Core 18.1.0**
* [MasternodeList](../api-ref/core-api-ref-remote-procedure-calls-dash.md#masternodelist): returns a list of masternodes in different modes. _Updated in Dash Core 0.14.0_
* [MnSync](../api-ref/core-api-ref-remote-procedure-calls-dash.md#mnsync): returns the sync status, updates to the next step or resets it entirely. _Updated in Dash Core 0.14.0_
* [CoinJoin](../api-ref/core-api-ref-remote-procedure-calls-dash.md#coinjoin): controls the CoinJoin process. *Updated in Dash Core 0.12.3*
* [Spork](../api-ref/core-api-ref-remote-procedure-calls-dash.md#spork): shows information about the current state of sporks. **Updated in Dash Core 18.1.0**
* [SporkUpdate](../api-ref/core-api-ref-remote-procedure-calls-dash.md#sporkupdate): updates the value of the provided spork. **New in Dash Core 18.1.0**
* [VoteRaw](../api-ref/core-api-ref-remote-procedure-calls-dash.md#voteraw): compiles and relays a governance vote with provided external signature instead of signing vote internally

## [Evolution RPCs](../api-ref/core-api-ref-remote-procedure-calls-evo.md)

* [BLS](../api-ref/core-api-ref-remote-procedure-calls-evo.md#bls): provides a set of commands to execute BLS-related actions. _Updated in Dash Core 0.14.0_
* [ProTx](../api-ref/core-api-ref-remote-procedure-calls-evo.md#protx): provides a set of commands to execute ProTx related actions. **Updated in Dash Core 18.1.0**
* [Quorum](../api-ref/core-api-ref-remote-procedure-calls-evo.md#quorum): provides a set of commands for quorums (LLMQs). **Updated in Dash Core 18.1.0**
* [VerifyChainLock](../api-ref/core-api-ref-remote-procedure-calls-evo.md#verifychainlock): tests if a quorum signature is valid for a ChainLock. **_New in Dash Core 0.17.0_**
* [VerifyISLock](../api-ref/core-api-ref-remote-procedure-calls-evo.md#verifyislock): tests if a quorum signature is valid for an InstantSend lock. **_New in Dash Core 0.17.0_**

## [Generating RPCs](../api-ref/core-api-ref-remote-procedure-calls-generating.md)
* [GenerateBlock](../api-ref/core-api-ref-remote-procedure-calls-generating.md#generateblock) mines a block with a set of ordered transactions immediately to a specified address or descriptor (before the RPC call returns). **New in Dash Core 18.1.0**
* [GenerateToAddress](../api-ref/core-api-ref-remote-procedure-calls-generating.md#generatetoaddress): mines blocks immediately to a specified address. *New in Dash Core 0.12.3*
* [GenerateToDescriptor](../api-ref/core-api-ref-remote-procedure-calls-generating.md#generatetodescriptor): mines blocks immediately to a specified descriptor. **New in Dash Core 18.1.0**

## [Mining RPCs](../api-ref/core-api-ref-remote-procedure-calls-mining.md)

* [GetBlockTemplate](../api-ref/core-api-ref-remote-procedure-calls-mining.md#getblocktemplate): gets a block template or proposal for use with mining software. **Updated in Dash Core 18.0.0**
* [GetMiningInfo](../api-ref/core-api-ref-remote-procedure-calls-mining.md#getmininginfo): returns various mining-related information. **_Updated in Dash Core 18.0.0_**
* [GetNetworkHashPS](../api-ref/core-api-ref-remote-procedure-calls-mining.md#getnetworkhashps): returns the estimated network hashes per second based on the last n blocks.
* [PrioritiseTransaction](../api-ref/core-api-ref-remote-procedure-calls-mining.md#prioritisetransaction): adds virtual priority or fee to a transaction, allowing it to be accepted into blocks mined by this node (or miners which use this node) with a lower priority or fee. (It can also remove virtual priority or fee, requiring the transaction have a higher priority or fee to be accepted into a locally-mined block.) _Updated in Dash Core 0.14.0_
* [SubmitBlock](../api-ref/core-api-ref-remote-procedure-calls-mining.md#submitblock): accepts a block, verifies it is a valid addition to the block chain, and broadcasts it to the network. Extra parameters are ignored by Dash Core but may be used by mining pools or other programs.
* [SubmitHeader](../api-ref/core-api-ref-remote-procedure-calls-mining.md#submitheader): decodes the given hex data as a header and submits it as a candidate chain tip if valid. **New in Dash Core 18.0.0**

## [Network RPCs](../api-ref/core-api-ref-remote-procedure-calls-network.md)

* [AddNode](../api-ref/core-api-ref-remote-procedure-calls-network.md#addnode): attempts to add or remove a node from the addnode list, or to try a connection to a node once.
* [ClearBanned](../api-ref/core-api-ref-remote-procedure-calls-network.md#clearbanned): clears list of banned nodes.
* [DisconnectNode](../api-ref/core-api-ref-remote-procedure-calls-network.md#disconnectnode): immediately disconnects from a specified node. _Updated in Dash Core 0.15.0_
* [GetAddedNodeInfo](../api-ref/core-api-ref-remote-procedure-calls-network.md#getaddednodeinfo): returns information about the given added node, or all added nodes (except onetry nodes). Only nodes which have been manually added using the [`addnode` RPC](../api-ref/core-api-ref-remote-procedure-calls-network.md#addnode) will have their information displayed. *Updated in Dash Core 0.12.3*
* [GetConnectionCount](../api-ref/core-api-ref-remote-procedure-calls-network.md#getconnectioncount): returns the number of connections to other nodes.
* [GetNetTotals](../api-ref/core-api-ref-remote-procedure-calls-network.md#getnettotals): returns information about network traffic, including bytes in, bytes out, and the current time.
* [GetNetworkInfo](../api-ref/core-api-ref-remote-procedure-calls-network.md#getnetworkinfo): returns information about the node's connection to the network. **Updated in Dash Core 18.0.0**
* [GetNodeAddresses](../api-ref/core-api-ref-remote-procedure-calls-network.md#getnodeaddresses): returns the known addresses which can potentially be used to find new nodes in the network. **New in Dash Core 18.0.0**
* [GetPeerInfo](../api-ref/core-api-ref-remote-procedure-calls-network.md#getpeerinfo): returns data about each connected network node. **Updated in Dash Core 18.0.0**
* [ListBanned](../api-ref/core-api-ref-remote-procedure-calls-network.md#listbanned): lists all banned IPs/Subnets. **Updated in Dash Core 18.1.0**
* [Ping](../api-ref/core-api-ref-remote-procedure-calls-network.md#ping): sends a P2P ping message to all connected nodes to measure ping time. Results are provided by the [`getpeerinfo` RPC](../api-ref/core-api-ref-remote-procedure-calls-network.md#getpeerinfo) pingtime and pingwait fields as decimal seconds. The P2P [`ping` message](../ref/core-ref-p2p-network-control-messages.md#ping) is handled in a queue with all other commands, so it measures processing backlog, not just network ping.
* [SetBan](../api-ref/core-api-ref-remote-procedure-calls-network.md#setban): attempts add or remove a IP/Subnet from the banned list.
* [SetNetworkActive](../api-ref/core-api-ref-remote-procedure-calls-network.md#setnetworkactive): disables/enables all P2P network activity.

## [Raw Transaction RPCs](../api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md)

* [AnalyzePSBT](../api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md#analyzepsbt): analyzes and provides information about the current status of a PSBT and its inputs. **New in Dash Core 18.2.0**
* [CombinePSBT](../api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md#combinepsbt): combines multiple partially-signed Dash transactions into one transaction. **New in Dash Core 18.0.0**
* [CombineRawTransaction](../api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md#combinerawtransaction): combine multiple partially signed transactions into one transaction. _New in Dash Core 0.15.0_
* [ConvertToPSBT](../api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md#converttopsbt): converts a network serialized transaction to a PSBT. **New in Dash Core 18.0.0**
* [CreatePSBT](../api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md#createpsbt): creates a transaction in the Partially Signed Transaction (PST) format. **New in Dash Core 18.0.0**
* [CreateRawTransaction](../api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md#createrawtransaction): creates an unsigned serialized transaction that spends a previous output to a new output with a P2PKH or P2SH address. The transaction is not stored in the wallet or transmitted to the network. **_Updated in Dash Core 0.17.0_**
* [DecodePSBT](../api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md#decodepsbt): returns a JSON object representing the serialized, base64-encoded partially signed Dash transaction. **New in Dash Core 18.0.0**
* [DecodeRawTransaction](../api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md#decoderawtransaction): decodes a serialized transaction hex string into a JSON object describing the transaction. *Updated in Dash Core 0.13.0*
* [DecodeScript](../api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md#decodescript): decodes a hex-encoded P2SH redeem script.
* [FinalizePSBT](../api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md#finalizepsbt): finalizes the inputs of a PSBT. The PSBT produces a network serialized transaction if the transaction is fully signed. **New in Dash Core 18.0.0**
* [FundRawTransaction](../api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md#fundrawtransaction): adds inputs to a transaction until it has enough in value to meet its out value. **_Updated in Dash Core 0.17.0_**
* [GetRawTransaction](../api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md#getrawtransaction): gets a hex-encoded serialized transaction or a JSON object describing the transaction. By default, Dash Core only stores complete transaction data for UTXOs and your own transactions, so the RPC may fail on historic transactions unless you use the non-default `txindex=1` in your Dash Core startup settings. _Updated in Dash Core 0.16.0_
* [JoinPSBTs](../api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md#joinpsbts): joins multiple distinct PSBTs with different inputs and outputs into one PSBT with inputs and outputs from all of the PSBTs.
* [SendRawTransaction](../api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md#sendrawtransaction): validates a transaction and broadcasts it to the peer-to-peer network. _Updated in Dash Core 0.15.0_
* [SignRawTransactionWithKey](../api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md#signrawtransactionwithkey): signs a transaction in the serialized transaction format using private keys provided in the call. **_New in Dash Core 0.17.0_**
* [TestMempoolAccept](../api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md#testmempoolaccept): returns the results of mempool acceptance tests indicating if raw transaction (serialized, hex-encoded) would be accepted by mempool. **New in Dash Core 18.0.0**
* [UTXOUpdatePSBT](../api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md#testmempoolaccept): updates a PSBT with data from output descriptors, UTXOs retrieved from the UTXO set or the mempool. **Updated in Dash Core 18.1.0**

## [Utility RPCs](../api-ref/core-api-ref-remote-procedure-calls-util.md)

* [CreateMultiSig](../api-ref/core-api-ref-remote-procedure-calls-util.md#createmultisig): creates a P2SH multi-signature address. **_Updated in Dash Core 0.17.0_**
* [DeriveAddresses](../api-ref/core-api-ref-remote-procedure-calls-util.md#deriveaddresses): derives one or more addresses corresponding to an output descriptor. **Updated in Dash Core 18.1.0**
* [EstimateSmartFee](../api-ref/core-api-ref-remote-procedure-calls-util.md#estimatesmartfee): estimates the transaction fee per kilobyte that needs to be paid for a transaction to begin confirmation within a certain number of blocks and returns the number of blocks for which the estimate is valid. _Updated in Dash Core 0.15.0_
* [GetDescriptorInfo](../api-ref/core-api-ref-remote-procedure-calls-util.md#getdescriptorinfo): analyses a descriptor. **New in Dash Core 18.0.0**
* [SignMessageWithPrivKey](../api-ref/core-api-ref-remote-procedure-calls-util.md#signmessagewithprivkey): signs a message with a given private key.  *New in Dash Core 0.12.3*
* [ValidateAddress](../api-ref/core-api-ref-remote-procedure-calls-util.md#validateaddress): returns information about the given Dash address. **_Updated in Dash Core 0.17.0_**
* [VerifyMessage](../api-ref/core-api-ref-remote-procedure-calls-util.md#verifymessage): verifies a signed message.

## [Wallet RPCs](../api-ref/core-api-ref-remote-procedure-calls-wallet.md)

**Note:** the wallet RPCs are only available if Dash Core was built with <<glossary:wallet support>>, which is the default.

* [AbandonTransaction](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#abandontransaction): marks an in-wallet transaction and all its in-wallet descendants as abandoned. This allows their inputs to be respent.
* [AbortRescan](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#abortrescan): stops current wallet rescan. _New in Dash Core 0.15.0_
* [AddMultiSigAddress](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#addmultisigaddress): adds a P2SH multisig address to the wallet. **_Updated in Dash Core 0.17.0_**
* [BackupWallet](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#backupwallet): safely copies `wallet.dat` to the specified file, which can be a directory or a path with filename.
* [CreateWallet](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#createwallet): creates and loads a new wallet. **Updated in Dash Core 18.1.0**
* [DumpHDInfo](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#dumphdinfo): returns an object containing sensitive private info about this HD wallet New in Dash Core 0.12.2
* [DumpPrivKey](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#dumpprivkey): returns the wallet-import-format (WIP) private key corresponding to an address. (But does not remove it from the wallet.)
* [DumpWallet](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#dumpwallet): creates or overwrites a file with all wallet keys in a human-readable format. **_Updated in Dash Core 0.17.0_**
* [EncryptWallet](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#encryptwallet): encrypts the wallet with a passphrase.  This is only to enable encryption for the first time. After encryption is enabled, you will need to enter the passphrase to use private keys.
* [GetAddressInfo](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#getaddressinfo): returns information about the given Dash address. **Updated in Dash Core 18.0.0**
* [GetAddressesByLabel](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#getaddressesbylabel): returns a list of every address assigned to a particular label. **_New in Dash Core 0.17.0_**
* [GetBalance](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#getbalance): gets the balance in decimal dash across all accounts or for a particular account. *Updated in Dash Core 18.1.0*
* [GetBalances](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#getbalances): returns an object with all balances denominated in DASH. *Updated in Dash Core 18.2.0*
* [GetNewAddress](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#getnewaddress): returns a new Dash address for receiving payments. If an account is specified, payments received with the address will be credited to that account. **_Updated in Dash Core 0.17.0_**
* [GetRawChangeAddress](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#getrawchangeaddress): returns a new Dash address for receiving change. This is for use with raw transactions, not normal use.
* [GetReceivedByAddress](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#getreceivedbyaddress): returns the total amount received by the specified address in transactions with the specified number of confirmations. It does not count coinbase transactions. *Updated in Dash Core 0.13.0*
* [GetReceivedByLabel](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#getreceivedbylabel): returns the list of addresses assigned the specified label. **_New in Dash Core 0.17.0_**
* [GetTransaction](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#gettransaction): gets detailed information about an in-wallet transaction. **_Updated in Dash Core 0.17.0_**
* [GetUnconfirmedBalance](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#getunconfirmedbalance): returns the wallet's total unconfirmed balance.
* [GetWalletInfo](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#getwalletinfo): provides information about the wallet.  *Updated in Dash Core 0.12.3*
* [ImportAddress](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#importaddress): adds an address or pubkey script to the wallet without the associated private key, allowing you to watch for transactions affecting that address or pubkey script without being able to spend any of its outputs.
* [ImportElectrumWallet](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#importelectrumwallet): imports keys from an Electrum wallet export file (.csv or .json) New in Dash Core 0.12.1
* [ImportMulti](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#importmulti): imports addresses or scripts (with private keys, public keys, or P2SH redeem scripts) and optionally performs the minimum necessary rescan for all imports. *New in Dash Core 0.12.3*
* [ImportPrivKey](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#importprivkey): adds a private key to your wallet. The key should be formatted in the wallet import format created by the [`dumpprivkey` RPC](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#dumpprivkey).
* [ImportPrunedFunds](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#importprunedfunds): imports funds without the need of a rescan. Meant for use with pruned wallets. *New in Dash Core 0.12.3*
* [ImportPubKey](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#importpubkey): imports a public key (in hex) that can be watched as if it were in your wallet but cannot be used to spend
* [ImportWallet](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#importwallet): imports private keys from a file in wallet dump file format (see the [`dumpwallet` RPC](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#dumpwallet)). These keys will be added to the keys currently in the wallet.  This call may need to rescan all or parts of the block chain for transactions affecting the newly-added keys, which may take several minutes.
* [KeyPoolRefill](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#keypoolrefill): fills the cache of unused pre-generated keys (the keypool).
* [ListAddressBalances](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#listaddressbalances): lists addresses of this wallet and their balances *New in Dash Core 0.12.3*
* [ListAddressGroupings](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#listaddressgroupings): lists groups of addresses that may have had their common ownership made public by common use as inputs in the same transaction or from being used as change from a previous transaction. **_Updated in Dash Core 0.17.0_**
* [ListLabels](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#listlabels): returns the list of all labels, or labels that are assigned to addresses with a specific purpose. **_New in Dash Core 0.17.0_**
* [ListLockUnspent](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#listlockunspent): returns a list of temporarily unspendable (locked) outputs.
* [ListReceivedByAddress](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#listreceivedbyaddress): lists the total number of dash received by each address. **_Updated in Dash Core 0.17.0_**
* [ListReceivedByLabel](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#listreceivedbylabel): lists the total number of dash received by each label. **_New in Dash Core 0.17.0_**
* [ListSinceBlock](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#listsinceblock): gets all transactions affecting the wallet which have occurred since a particular block, plus the header hash of a block at a particular depth. **_Updated in Dash Core 0.17.0_**
* [ListTransactions](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#listtransactions): returns the most recent transactions that affect the wallet. **_Updated in Dash Core 0.17.0_**
* [ListUnspent](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#listunspent): returns an array of unspent transaction outputs belonging to this wallet. **Updated in Dash Core 18.1.0**
* [ListWalletDir](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#listwalletdir): returns a list of wallets in the wallet directory. **New in Dash Core 18.0.0**
* [ListWallets](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#listwallets): returns a list of currently loaded wallets. _New in Dash Core 0.15.0_
* [LoadWallet](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#loadwallet): loads a wallet from a wallet file or directory. **Updated in Dash Core 18.1.0**
* [LockUnspent](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#lockunspent): temporarily locks or unlocks specified transaction outputs. A locked transaction output will not be chosen by automatic coin selection when spending dash. Locks are stored in memory only, so nodes start with zero locked outputs and the locked output list is always cleared when a node stops or fails.
* [RemovePrunedFunds](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#removeprunedfunds): deletes the specified transaction from the wallet. Meant for use with pruned wallets and as a companion to importprunedfunds. *New in Dash Core 0.12.3*
* [RescanBlockChain](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#rescanblockchain): rescans the local blockchain for wallet related transactions. _New in Dash Core 0.16.0_
* [ScanTxOutset](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#scantxoutset): scans the unspent transaction output set for entries that match certain output descriptors. **New in Dash Core 18.0.0**
* [SendMany](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#sendmany): creates and broadcasts a transaction which sends outputs to multiple addresses. **_Updated in Dash Core 18.0.0_**
* [SendToAddress](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#sendtoaddress): spends an amount to a given address. **Updated in Dash Core 18.1.0**
* [SetCoinJoinAmount](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#setcoinjoinamount): sets the amount of DASH to be processed *New in Dash Core 0.13.0*
* [SetCoinJoinRounds](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#setcoinjoinrounds): sets the number of rounds to use *New in Dash Core 0.13.0*
* [SetTxFee](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#settxfee): sets the transaction fee per kilobyte paid by transactions created by this wallet.
* [SetWalletFlag](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#setwalletflag): changes the state of the given wallet flag for a wallet.
* [SignMessage](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#signmessage): signs a message with the private key of an address.
* [SignRawTransactionWithWallet](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#signrawtransactionwithwallet): signs a transaction in the serialized transaction format using private keys found in the wallet. **_New in Dash Core 0.17.0_**
* [UnloadWallet](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#unloadwallet): unloads the wallet referenced by the request endpoint otherwise unloads the wallet specified in the argument. **Updated in Dash Core 18.1.0**
* [UpgradeToHD](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#upgradetohd): upgrades non-HD wallets to HD. **_New in Dash Core 0.17.0_**
* [WalletCreateFundedPSBT](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#walletcreatefundedpsbt): creates and funds a transaction in the Partially Signed Transaction (PST) format. Inputs will be added if supplied inputs are not enough. **Updated in Dash Core 18.2.0**
* [WalletLock](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#walletlock): removes the wallet encryption key from memory, locking the wallet. After calling this method, you will need to call `walletpassphrase` again before being able to call any methods which require the wallet to be unlocked.
* [WalletPassphrase](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#walletpassphrase): stores the wallet decryption key in memory for the indicated number of seconds. Issuing the `walletpassphrase` command while the wallet is already unlocked will set a new unlock time that overrides the old one.
* [WalletPassphraseChange](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#walletpassphrasechange): changes the wallet passphrase from 'old passphrase' to 'new passphrase'.
* [WalletProcessPSBT](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#walletprocesspsbt): updates a PSBT with input information from a wallet and then allows the signing of inputs. **Updated in Dash Core 18.2.0**

## [Wallet RPCs (Deprecated)](../api-ref/core-api-ref-remote-procedure-calls-wallet-deprecated.md)

**Note:** the wallet RPCs are only available if Dash Core was built with <<glossary:wallet support>>, which is the default.

* [GetAccount](../api-ref/core-api-ref-remote-procedure-calls-wallet-deprecated.md#getaccount): returns the name of the account associated with the given address. **_Deprecated_**
* [GetAccountAddress](../api-ref/core-api-ref-remote-procedure-calls-wallet-deprecated.md#getaccountaddress): returns the current Dash address for receiving payments to this account. If the account doesn't exist, it creates both the account and a new address for receiving payment.  Once a payment has been received to an address, future calls to this RPC for the same account will return a different address. **_Deprecated_**
* [GetAddressesByAccount](../api-ref/core-api-ref-remote-procedure-calls-wallet-deprecated.md#getaddressesbyaccount): returns a list of every address assigned to a particular account. **_Deprecated_**
* [SetAccount](../api-ref/core-api-ref-remote-procedure-calls-wallet-deprecated.md#setaccount): puts the specified address in the given account. **_Deprecated_**

## [ZeroMQ (ZMQ) RPCs](../api-ref/core-api-ref-remote-procedure-calls-zmq.md)

* [GetZmqNotifications](../api-ref/core-api-ref-remote-procedure-calls-zmq.md#getzmqnotifications): returns information about the active ZeroMQ notifications. **Updated in Dash Core 18.0.0**

## [Removed RPCs](../api-ref/core-api-ref-remote-procedure-calls-removed.md)

* [EstimateFee](../api-ref/core-api-ref-remote-procedure-calls-removed.md#estimatefee): **_was removed in Dash Core 0.17.0._**
* [GetPoolInfo](../api-ref/core-api-ref-remote-procedure-calls-removed.md#getpoolinfo): returns an object containing pool related information. _Deprecated in 0.15.0_
* [GetReceivedByAccount](../api-ref/core-api-ref-remote-procedure-calls-removed.md#getreceivedbyaccount): **was removed in Dash Core 18.0.0.**
* [KeePass](../api-ref/core-api-ref-remote-procedure-calls-removed.md#keepass): **_was removed in Dash Core 18.0.0._**
* [ListAccounts](../api-ref/core-api-ref-remote-procedure-calls-removed.md#listaccounts): **was removed in Dash Core 18.0.0.**
* [ListReceivedByAccount](../api-ref/core-api-ref-remote-procedure-calls-removed.md#listreceivedbyaccount): **was removed in Dash Core 18.0.0.**
* [Move](../api-ref/core-api-ref-remote-procedure-calls-removed.md#move): **was removed in Dash Core 18.0.0.**
* [SendFrom](../api-ref/core-api-ref-remote-procedure-calls-removed.md#sendfrom): **was removed in Dash Core 18.0.0.**
* [SignRawTransaction](../api-ref/core-api-ref-remote-procedure-calls-removed.md#signrawtransaction): **was removed in Dash Core 18.0.0.**
* [SignRawTransaction](../api-ref/core-api-ref-remote-procedure-calls-removed.md#signrawtransaction): **was removed in Dash Core 18.0.0.**
* [Generate](../api-ref/core-api-ref-remote-procedure-calls-removed.md#generate): mines blocks immediately (before the RPC call returns).  **was removed in Dash Core 18.1.0.**