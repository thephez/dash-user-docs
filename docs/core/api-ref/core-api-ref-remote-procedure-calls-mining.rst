GetBlockTemplate
================

The ```getblocktemplate``
RPC <core-api-ref-remote-procedure-calls-mining#getblocktemplate>`__
gets a block template or proposal for use with mining software. For more
information, please see the following resources:

-  `Bitcoin Wiki
   GetBlockTemplate <https://en.bitcoin.it/wiki/Getblocktemplate>`__
-  `BIP22 <https://github.com/bitcoin/bips/blob/master/bip-0022.mediawiki>`__
-  `BIP23 <https://github.com/bitcoin/bips/blob/master/bip-0023.mediawiki>`__

*Parameter #1—a JSON request object*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Request         | object          | O               | A JSON request  |
|                 |                 | ptional(exactly | object          |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``mode``     | string          | O               | This must be    |
|                 |                 | ptional(exactly | set to          |
|                 |                 | 1)              | :raw-lat        |
|                 |                 |                 | ex:`\template`" |
|                 |                 |                 | or omitted"     |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | array (string)  | Optional(0 or   | A list of       |
| `capabilities`` |                 | more)           | strings         |
+-----------------+-----------------+-----------------+-----------------+
| → →Capability   | string          | O               | Client side     |
|                 |                 | ptional(exactly | supported       |
|                 |                 | 1)              | feature,        |
|                 |                 |                 | ``longpoll``,   |
|                 |                 |                 | `               |
|                 |                 |                 | `coinbasetxn``, |
|                 |                 |                 | ``c             |
|                 |                 |                 | oinbasevalue``, |
|                 |                 |                 | ``proposal``,   |
|                 |                 |                 | ``serverlist``, |
|                 |                 |                 | ``workid``      |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``rules``    | array (string)  | Optional(0 or   | A list of       |
|                 |                 | more)           | strings         |
+-----------------+-----------------+-----------------+-----------------+
| → →Rules        | string          | O               | Client side     |
|                 |                 | ptional(exactly | supported       |
|                 |                 | 1)              | softfork        |
|                 |                 |                 | deployment,     |
|                 |                 |                 | ``csv``,        |
|                 |                 |                 | ``dip0001``,    |
|                 |                 |                 | etc.            |
+-----------------+-----------------+-----------------+-----------------+

*Result—block template*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | A object        |
|                 |                 | equired(exactly | containing a    |
|                 |                 | 1)              | block template  |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | array (string)  | Required(1 or   | The client side |
| `capabilities`` |                 | more)           | supported       |
|                 |                 |                 | features        |
+-----------------+-----------------+-----------------+-----------------+
| → →Capability   | string          | Optional(0 or   | A client side   |
|                 |                 | more)           | supported       |
|                 |                 |                 | feature         |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``version``  | number (int)    | R               | The block       |
|                 |                 | equired(exactly | version         |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``rules``    | array (string)  | Required(1 or   | The specific    |
|                 |                 | more)           | block rules     |
|                 |                 |                 | that are to be  |
|                 |                 |                 | enforced        |
+-----------------+-----------------+-----------------+-----------------+
| → →Block Rule   | string          | Optional(0 or   | A specific      |
|                 |                 | more)           | block rule to   |
|                 |                 |                 | be enforced     |
+-----------------+-----------------+-----------------+-----------------+
| →\              | object          | R               | Contains the    |
| ``vbavailable`` |                 | equired(exactly | set of pending, |
|                 |                 | 1)              | supported       |
|                 |                 |                 | versionbit (BIP |
|                 |                 |                 | 9) softfork     |
|                 |                 |                 | deployments     |
+-----------------+-----------------+-----------------+-----------------+
| → →Bit Number   | number          | Required(0 or   | The bit number  |
|                 |                 | more)           | the named       |
|                 |                 |                 | softfork rule   |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number          | R               | The bit mask of |
|  ``vbrequired`` |                 | equired(exactly | versionbits the |
|                 |                 | 1)              | server requires |
|                 |                 |                 | set in          |
|                 |                 |                 | submissions     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``prev       | string (hex)    | R               | The hash of     |
| iousblockhash`` |                 | equired(exactly | current highest |
|                 |                 | 1)              | block           |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | array (objects) | Optional(0 or   | Non-coinbase    |
| `transactions`` |                 | more)           | transactions to |
|                 |                 |                 | be included in  |
|                 |                 |                 | the next block  |
+-----------------+-----------------+-----------------+-----------------+
| → →Transaction  | object          | Optional(0 or   | Non-coinbase    |
|                 |                 | more)           | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``data`` | string (hex)    | Optional(0 or   | Transaction     |
|                 |                 | more)           | data encoded in |
|                 |                 |                 | hex             |
|                 |                 |                 | (byte-for-byte) |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``hash`` | string (hex)    | Optional(0 or   | The hash/id     |
|                 |                 | more)           | encoded in      |
|                 |                 |                 | little-endian   |
|                 |                 |                 | hex             |
+-----------------+-----------------+-----------------+-----------------+
| → →             | array (numbers) | Required(0 or   | An array        |
| →\ ``depends``  |                 | more)           | holding TXIDs   |
|                 |                 |                 | of unconfirmed  |
|                 |                 |                 | transactions    |
|                 |                 |                 | this TX depends |
|                 |                 |                 | upon (parent    |
|                 |                 |                 | transactions).  |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | number          | Optional(1 or   | Transactions    |
| →Transaction    |                 | more)           | before this one |
| number          |                 |                 | (by 1-based     |
|                 |                 |                 | index in        |
|                 |                 |                 | `               |
|                 |                 |                 | `transactions`` |
|                 |                 |                 | list) that must |
|                 |                 |                 | be present in   |
|                 |                 |                 | the final block |
|                 |                 |                 | if this one is  |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``fee``  | number          | R               | The difference  |
|                 |                 | equired(exactly | in value        |
|                 |                 | 1)              | between         |
|                 |                 |                 | transaction     |
|                 |                 |                 | inputs and      |
|                 |                 |                 | outputs (in     |
|                 |                 |                 | duffs). For     |
|                 |                 |                 | coinbase        |
|                 |                 |                 | transactions,   |
|                 |                 |                 | this is a       |
|                 |                 |                 | negative number |
|                 |                 |                 | of the total    |
|                 |                 |                 | collected block |
|                 |                 |                 | fees (ie., not  |
|                 |                 |                 | including the   |
|                 |                 |                 | block subsidy); |
|                 |                 |                 | if key is not   |
|                 |                 |                 | present, fee is |
|                 |                 |                 | unknown and     |
|                 |                 |                 | clients MUST    |
|                 |                 |                 | NOT assume      |
|                 |                 |                 | there isn’t one |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number          | R               | Total SigOps.   |
| →\ ``sigops``   |                 | equired(exactly | If not present, |
|                 |                 | 1)              | the count is    |
|                 |                 |                 | unknown         |
|                 |                 |                 | (clients MUST   |
|                 |                 |                 | NOT assume      |
|                 |                 |                 | there aren’t    |
|                 |                 |                 | any)            |
+-----------------+-----------------+-----------------+-----------------+
| →\              | object          | R               | A object        |
| ``coinbaseaux`` |                 | equired(exactly | containing data |
|                 |                 | 1)              | that should be  |
|                 |                 |                 | included in the |
|                 |                 |                 | coinbase        |
|                 |                 |                 | scriptSig       |
|                 |                 |                 | content         |
+-----------------+-----------------+-----------------+-----------------+
| →               | [ST             | [STRIK          | **Removed in    |
| →\ [S           | RIKEOUT:string] | EOUT:Required(0 | Dash Core       |
| TRIKEOUT:Flags] |                 | or more)]       | 18.0.0**        |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | number          | R               | The maximum     |
| coinbasevalue`` |                 | equired(exactly | allowable input |
|                 |                 | 1)              | to coinbase     |
|                 |                 |                 | transaction,    |
|                 |                 |                 | including the   |
|                 |                 |                 | generation      |
|                 |                 |                 | award and       |
|                 |                 |                 | transaction     |
|                 |                 |                 | fees (in duffs) |
+-----------------+-----------------+-----------------+-----------------+
| →\              | object          | R               | Information for |
| ``coinbasetxn`` |                 | equired(exactly | the coinbase    |
|                 |                 | 1)              | transaction)    |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``target``   | string          | R               | The hash target |
|                 |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``mintime``  | number          | R               | The minimum     |
|                 |                 | equired(exactly | timestamp       |
|                 |                 | 1)              | appropriate for |
|                 |                 |                 | next block time |
|                 |                 |                 | in seconds      |
|                 |                 |                 | since epoch     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``mutable``  | array (string)  | R               | The list of     |
|                 |                 | equired(exactly | ways the block  |
|                 |                 | 1)              | template may be |
|                 |                 |                 | changed         |
+-----------------+-----------------+-----------------+-----------------+
| → →Value        | string          | Required(0 or   | A way the block |
|                 |                 | more)           | template may be |
|                 |                 |                 | changed,        |
|                 |                 |                 | e.g. ‘time’,    |
|                 |                 |                 | ‘transactions’, |
|                 |                 |                 | ‘prevblock’     |
+-----------------+-----------------+-----------------+-----------------+
| →\              | string          | R               | A range of      |
|  ``noncerange`` |                 | equired(exactly | valid nonces    |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number          | R               | The limit of    |
|  ``sigoplimit`` |                 | equired(exactly | sigops in       |
|                 |                 | 1)              | blocks          |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | The limit of    |
| \ ``sizelimit`` |                 | equired(exactly | block size      |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``curtime``  | number          | R               | The current     |
|                 |                 | equired(exactly | timestamp in    |
|                 |                 | 1)              | seconds since   |
|                 |                 |                 | epoch           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``bits``     | string          | R               | The compressed  |
|                 |                 | equired(exactly | target of next  |
|                 |                 | 1)              | block           |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | string          | R               | The compressed  |
| `previousbits`` |                 | equired(exactly | target of the   |
|                 |                 | 1)              | current highest |
|                 |                 |                 | block           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``height``   | number          | R               | The height of   |
|                 |                 | equired(exactly | the next block  |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\              | array (objects) | Required(0 or   | Required        |
|  ``masternode`` |                 | more)           | masternode      |
|                 |                 |                 | payments that   |
|                 |                 |                 | must be         |
|                 |                 |                 | included in the |
|                 |                 |                 | next block      |
+-----------------+-----------------+-----------------+-----------------+
| → →Masternode   | object          | Optional(0 or   | Object          |
| Payee           |                 | more)           | containing a    |
|                 |                 |                 | masternode      |
|                 |                 |                 | payee’s         |
|                 |                 |                 | information     |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | R               | Payee address   |
| →\ ``payee``    |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | R               | Payee           |
| →\ ``script``   |                 | equired(exactly | scriptPubKey    |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number          | R               | Required amount |
| →\ ``amount``   |                 | equired(exactly | to pay          |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | boolean         | R               | True if         |
| `masternode_pay |                 | equired(exactly | masternode      |
| ments_started`` |                 | 1)              | payments        |
|                 |                 |                 | started         |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | boolean         | R               | True if         |
| masternode_paym |                 | equired(exactly | masternode      |
| ents_enforced`` |                 | 1)              | payments        |
|                 |                 |                 | enforced        |
+-----------------+-----------------+-----------------+-----------------+
| →\              | array (objects) | Required(0 or   | The superblock  |
|  ``superblock`` |                 | more)           | payees that     |
|                 |                 |                 | must be         |
|                 |                 |                 | included in the |
|                 |                 |                 | next block      |
+-----------------+-----------------+-----------------+-----------------+
| → →Superblock   | object          | Optional(0 or   | Object          |
| Payee           |                 | more)           | containing a    |
|                 |                 |                 | superblock      |
|                 |                 |                 | payee’s         |
|                 |                 |                 | information     |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | R               | Payee address   |
| →\ ``payee``    |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | R               | Payee           |
| →\ ``script``   |                 | equired(exactly | scriptPubKey    |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number          | R               | Required amount |
| →\ ``amount``   |                 | equired(exactly | to pay          |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``superb     | boolean         | R               | True if         |
| locks_started`` |                 | equired(exactly | superblock      |
|                 |                 | 1)              | payments        |
|                 |                 |                 | started         |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``superb     | boolean         | R               | True if         |
| locks_enabled`` |                 | equired(exactly | superblock      |
|                 |                 | 1)              | payments        |
|                 |                 |                 | enabled         |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``coi        | string          | R               | *Added in Dash  |
| nbase_payload`` |                 | equired(exactly | Core            |
|                 |                 | 1)              | 0.              |
|                 |                 |                 | 13.0*\ Coinbase |
|                 |                 |                 | transaction     |
|                 |                 |                 | payload data    |
|                 |                 |                 | encoded in      |
|                 |                 |                 | hexadecimal     |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

.. code:: bash

   dash-cli -testnet getblocktemplate

Result:

.. code:: json

   {
     "capabilities": [
       "proposal"
     ],
     "version": 536870912,
     "rules": [
       "csv",
       "dip0001",
       "bip147",
       "dip0003",
       "dip0008",
       "realloc",
       "dip0020"
     ],
     "vbavailable": {
     },
     "vbrequired": 0,
     "previousblockhash": "000000612b3901d75819eafc070a3fe34a3be6a36304b4f63d0190cf32cc15ac",
     "transactions": [
     ],
     "coinbaseaux": {
     },
     "coinbasevalue": 1940051022,
     "longpollid": "000000612b3901d75819eafc070a3fe34a3be6a36304b4f63d0190cf32cc15ac162",
     "target": "0000013457000000000000000000000000000000000000000000000000000000",
     "mintime": 1635875970,
     "mutable": [
       "time",
       "transactions",
       "prevblock"
     ],
     "noncerange": "00000000ffffffff",
     "sigoplimit": 40000,
     "sizelimit": 2000000,
     "curtime": 1635876520,
     "bits": "1e013457",
     "previousbits": "1e015585",
     "height": 605717,
     "masternode": [
       {
         "payee": "yS25k3aNPBtfqcgyHeEvHtDCRT9iKodHM1",
         "script": "76a9143e881097549033c40e7373879a7d4331de81778188ac",
         "amount": 1164030613
       }
     ],
     "masternode_payments_started": true,
     "masternode_payments_enforced": true,
     "superblock": [
     ],
     "superblocks_started": true,
     "superblocks_enabled": true,
     "coinbase_payload": "0200153e0900cd6b7602392887e14063cb5ed5defe8cc877e329a55defd903b6d2261a8f07d15b462a37ff25db05accea8928a5f8a3e65ca99266dc13ba98884f799680e0725"
   }

*See also*

-  `SetGenerate </docs/core-api-ref-remote-procedure-calls-removed#setgenerate>`__:
   was removed in Dash Core 0.12.3.
-  `GetMiningInfo </docs/core-api-ref-remote-procedure-calls-mining#getmininginfo>`__:
   returns various mining-related information.
-  `SubmitBlock </docs/core-api-ref-remote-procedure-calls-mining#submitblock>`__:
   accepts a block, verifies it is a valid addition to the block chain,
   and broadcasts it to the network. Extra parameters are ignored by
   Dash Core but may be used by mining pools or other programs.
-  `PrioritiseTransaction </docs/core-api-ref-remote-procedure-calls-mining#prioritisetransaction>`__:
   adds virtual priority or fee to a transaction, allowing it to be
   accepted into blocks mined by this node (or miners which use this
   node) with a lower priority or fee. (It can also remove virtual
   priority or fee, requiring the transaction have a higher priority or
   fee to be accepted into a locally-mined block.)

GetMiningInfo
=============

The ```getmininginfo``
RPC <core-api-ref-remote-procedure-calls-mining#getmininginfo>`__
returns various mining-related information.

*Parameters: none*

*Result—various mining-related information*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | Various         |
|                 |                 | equired(exactly | mining-related  |
|                 |                 | 1)              | information     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``blocks``   | number (int)    | R               | The height of   |
|                 |                 | equired(exactly | the highest     |
|                 |                 | 1)              | block on the    |
|                 |                 |                 | local best      |
|                 |                 |                 | block chain     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``cur        | number (int)    | Optional(0 or   | If generation   |
| rentblocksize`` |                 | 1)              | was enabled     |
|                 |                 |                 | since the last  |
|                 |                 |                 | time this node  |
|                 |                 |                 | was restarted,  |
|                 |                 |                 | this is the     |
|                 |                 |                 | size in bytes   |
|                 |                 |                 | of the last     |
|                 |                 |                 | block built by  |
|                 |                 |                 | this node for   |
|                 |                 |                 | header hash     |
|                 |                 |                 | checking.       |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``c          | number (int)    | Optional(0 or   | If generation   |
| urrentblocktx`` |                 | 1)              | was enabled     |
|                 |                 |                 | since the last  |
|                 |                 |                 | time this node  |
|                 |                 |                 | was restarted,  |
|                 |                 |                 | this is the     |
|                 |                 |                 | number of       |
|                 |                 |                 | transactions in |
|                 |                 |                 | the last block  |
|                 |                 |                 | built by this   |
|                 |                 |                 | node for header |
|                 |                 |                 | hash checking.  |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (real)   | R               | If generation   |
|  ``difficulty`` |                 | equired(exactly | was enabled     |
|                 |                 | 1)              | since the last  |
|                 |                 |                 | time this node  |
|                 |                 |                 | was restarted,  |
|                 |                 |                 | this is the     |
|                 |                 |                 | difficulty of   |
|                 |                 |                 | the             |
|                 |                 |                 | highest-height  |
|                 |                 |                 | block in the    |
|                 |                 |                 | local best      |
|                 |                 |                 | block chain.    |
|                 |                 |                 | Otherwise, this |
|                 |                 |                 | is the value    |
|                 |                 |                 | ``0``           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | number (int)    | R               | An estimate of  |
| networkhashps`` |                 | equired(exactly | the number of   |
|                 |                 | 1)              | hashes per      |
|                 |                 |                 | second the      |
|                 |                 |                 | network is      |
|                 |                 |                 | generating to   |
|                 |                 |                 | maintain the    |
|                 |                 |                 | current         |
|                 |                 |                 | difficulty. See |
|                 |                 |                 | the             |
|                 |                 |                 | ```get          |
|                 |                 |                 | networkhashps`` |
|                 |                 |                 | RPC <cor        |
|                 |                 |                 | e-api-ref-remot |
|                 |                 |                 | e-procedure-cal |
|                 |                 |                 | ls-mining#getne |
|                 |                 |                 | tworkhashps>`__ |
|                 |                 |                 | for             |
|                 |                 |                 | configurable    |
|                 |                 |                 | access to this  |
|                 |                 |                 | data            |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``pooledtx`` | number (int)    | R               | The number of   |
|                 |                 | equired(exactly | transactions in |
|                 |                 | 1)              | the memory pool |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``chain``    | string          | R               | Set to ``main`` |
|                 |                 | equired(exactly | for mainnet,    |
|                 |                 | 1)              | ``test`` for    |
|                 |                 |                 | testnet, and    |
|                 |                 |                 | ``regtest`` for |
|                 |                 |                 | regtest         |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``warnings`` | string          | R               | *Added in Dash  |
|                 |                 | equired(exactly | Core            |
|                 |                 | 1)              | 0.16.0*\ Any    |
|                 |                 |                 | network or      |
|                 |                 |                 | blockchain      |
|                 |                 |                 | warnings        |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``errors``   | string          | Optional(0 or   | **Removed in    |
|                 |                 | 1)              | Dash Core       |
|                 |                 |                 | 0.17.0**\ Only  |
|                 |                 |                 | shown when      |
|                 |                 |                 | dashd is        |
|                 |                 |                 | started with    |
|                 |                 |                 | ``              |
|                 |                 |                 | -deprecatedrpc= |
|                 |                 |                 | getmininginfo`` |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

.. code:: bash

   dash-cli getmininginfo

Result:

.. code:: json

   {
     "blocks": 292979,
     "difficulty": 0.0002441371325370145,
     "networkhashps": 3805.856874962192,
     "pooledtx": 0,
     "chain": "test",
     "warnings": "Warning: unknown new rules activated (versionbit 3)"
   }

*See also*

-  `GetMemPoolInfo </docs/core-api-ref-remote-procedure-calls-blockchain#getmempoolinfo>`__:
   returns information about the node’s current transaction memory pool.
-  `GetRawMemPool </docs/core-api-ref-remote-procedure-calls-blockchain#getrawmempool>`__:
   returns all transaction identifiers (TXIDs) in the memory pool as a
   JSON array, or detailed information about each transaction in the
   memory pool as a JSON object.
-  `GetBlockTemplate </docs/core-api-ref-remote-procedure-calls-mining#getblocktemplate>`__:
   gets a block template or proposal for use with mining software.
-  `Generate </docs/core-api-ref-remote-procedure-calls-generating#generate>`__:
   mines blocks immediately (before the RPC call returns).

GetNetworkHashPS
================

The ```getnetworkhashps``
RPC <core-api-ref-remote-procedure-calls-mining#getnetworkhashps>`__
returns the estimated network hashes per second based on the last n
blocks.

*Parameter #1—number of blocks to average*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``blocks``      | number (int)    | Optional(0 or   | The number of   |
|                 |                 | 1)              | blocks to       |
|                 |                 |                 | average         |
|                 |                 |                 | together for    |
|                 |                 |                 | calculating the |
|                 |                 |                 | estimated       |
|                 |                 |                 | hashes per      |
|                 |                 |                 | second. Default |
|                 |                 |                 | is ``120``. Use |
|                 |                 |                 | ``-1`` to       |
|                 |                 |                 | average all     |
|                 |                 |                 | blocks produced |
|                 |                 |                 | since the last  |
|                 |                 |                 | difficulty      |
|                 |                 |                 | change          |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—block height*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``height``      | number (int)    | Optional(0 or   | The height of   |
|                 |                 | 1)              | the last block  |
|                 |                 |                 | to use for      |
|                 |                 |                 | calculating the |
|                 |                 |                 | average.        |
|                 |                 |                 | Defaults to     |
|                 |                 |                 | ``-1`` for the  |
|                 |                 |                 | highest-height  |
|                 |                 |                 | block on the    |
|                 |                 |                 | local best      |
|                 |                 |                 | block chain. If |
|                 |                 |                 | the specified   |
|                 |                 |                 | height is       |
|                 |                 |                 | higher than the |
|                 |                 |                 | highest block   |
|                 |                 |                 | on the local    |
|                 |                 |                 | best block      |
|                 |                 |                 | chain, it will  |
|                 |                 |                 | be interpreted  |
|                 |                 |                 | the same as     |
|                 |                 |                 | ``-1``          |
+-----------------+-----------------+-----------------+-----------------+

*Result—estimated hashes per second*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | number (int)    | R               | The estimated   |
|                 |                 | equired(exactly | number of       |
|                 |                 | 1)              | hashes per      |
|                 |                 |                 | second based on |
|                 |                 |                 | the parameters  |
|                 |                 |                 | provided. May   |
|                 |                 |                 | be 0 (for       |
|                 |                 |                 | Height=\ ``0``, |
|                 |                 |                 | the genesis     |
|                 |                 |                 | block) or a     |
|                 |                 |                 | negative value  |
|                 |                 |                 | if the          |
|                 |                 |                 | highest-height  |
|                 |                 |                 | block averaged  |
|                 |                 |                 | has a block     |
|                 |                 |                 | header time     |
|                 |                 |                 | earlier than    |
|                 |                 |                 | the             |
|                 |                 |                 | lowest-height   |
|                 |                 |                 | block averaged  |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Get the average hashes per second for all the blocks since the last
difficulty change before block 6000.

.. code:: bash

   dash-cli -testnet getnetworkhashps -1 6000

Result:

.. code:: text

   22214011.90821117

*See also*

-  `GetDifficulty </docs/core-api-ref-remote-procedure-calls-blockchain#getdifficulty>`__:
   returns the proof-of-work difficulty as a multiple of the minimum
   difficulty.
-  `GetBlock </docs/core-api-ref-remote-procedure-calls-blockchain#getblock>`__:
   gets a block with a particular header hash from the local block
   database either as a JSON object or as a serialized block.

PrioritiseTransaction
=====================

The ```prioritisetransaction``
RPC <core-api-ref-remote-procedure-calls-mining#prioritisetransaction>`__
adds virtual priority or fee to a transaction, allowing it to be
accepted into blocks mined by this node (or miners which use this node)
with a lower priority or fee. (It can also remove virtual priority or
fee, requiring the transaction have a higher priority or fee to be
accepted into a locally-mined block.)

*Parameter #1—the TXID of the transaction to modify*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| TXID            | string          | R               | The TXID of the |
|                 |                 | equired(exactly | transaction     |
|                 |                 | 1)              | whose virtual   |
|                 |                 |                 | priority or fee |
|                 |                 |                 | you want to     |
|                 |                 |                 | modify, encoded |
|                 |                 |                 | as hex in RPC   |
|                 |                 |                 | byte order      |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the change to make to the virtual fee*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Fee             | number (int)    | R               | **Warning:**    |
|                 |                 | equired(exactly | this value is   |
|                 |                 | 1)              | in duffs, not   |
|                 |                 |                 | DashIf          |
|                 |                 |                 | positive, the   |
|                 |                 |                 | virtual fee to  |
|                 |                 |                 | add to the      |
|                 |                 |                 | actual fee paid |
|                 |                 |                 | by the          |
|                 |                 |                 | transaction; if |
|                 |                 |                 | negative, the   |
|                 |                 |                 | virtual fee to  |
|                 |                 |                 | subtract from   |
|                 |                 |                 | the actual fee  |
|                 |                 |                 | paid by the     |
|                 |                 |                 | transaction. No |
|                 |                 |                 | change is made  |
|                 |                 |                 | to the actual   |
|                 |                 |                 | fee paid by the |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+

*Result—``true`` if the priority is changed*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | bool (true      | R               | Always set to   |
|                 | only)           | equired(exactly | ``true`` if all |
|                 |                 | 1)              | three           |
|                 |                 |                 | parameters are  |
|                 |                 |                 | provided. Will  |
|                 |                 |                 | not return an   |
|                 |                 |                 | error if the    |
|                 |                 |                 | TXID is not in  |
|                 |                 |                 | the memory      |
|                 |                 |                 | pool. If fewer  |
|                 |                 |                 | or more than    |
|                 |                 |                 | three arguments |
|                 |                 |                 | are provided,   |
|                 |                 |                 | or if something |
|                 |                 |                 | goes wrong,     |
|                 |                 |                 | will be set to  |
|                 |                 |                 | ``null``        |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.14.0*

.. code:: bash

   dash-cli -testnet prioritisetransaction \
       f86c74f27fdd9c7e618d69b3606eeae1710b3f02fabede6ae8c88dd7bb756942 \
       456789

Result:

.. code:: json

   true

*See also*

-  `GetRawMemPool </docs/core-api-ref-remote-procedure-calls-blockchain#getrawmempool>`__:
   returns all transaction identifiers (TXIDs) in the memory pool as a
   JSON array, or detailed information about each transaction in the
   memory pool as a JSON object.
-  `GetBlockTemplate </docs/core-api-ref-remote-procedure-calls-mining#getblocktemplate>`__:
   gets a block template or proposal for use with mining software.

SubmitBlock
===========

The ```submitblock``
RPC <core-api-ref-remote-procedure-calls-mining#submitblock>`__ accepts
a block, verifies it is a valid addition to the block chain, and
broadcasts it to the network. Extra parameters are ignored by Dash Core
but may be used by mining pools or other programs.

*Parameter #1—the new block in serialized block format as hex*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Block           | string (hex)    | R               | The full block  |
|                 |                 | equired(exactly | to submit in    |
|                 |                 | 1)              | serialized      |
|                 |                 |                 | block format as |
|                 |                 |                 | hex             |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—dummy value*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``dummy``       | object          | Optional(0 or   | A dummy value   |
|                 |                 | 1)              | for             |
|                 |                 |                 | compatibility   |
|                 |                 |                 | with BIP22.     |
|                 |                 |                 | This value is   |
|                 |                 |                 | ignored.        |
+-----------------+-----------------+-----------------+-----------------+

*Result—``null`` or error string*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | null/string     | R               | If the block    |
|                 |                 | equired(exactly | submission      |
|                 |                 | 1)              | succeeded, set  |
|                 |                 |                 | to JSON         |
|                 |                 |                 | ``null``. If    |
|                 |                 |                 | submission      |
|                 |                 |                 | failed, set to  |
|                 |                 |                 | one of the      |
|                 |                 |                 | following       |
|                 |                 |                 | strings:        |
|                 |                 |                 | ``duplicate``,  |
|                 |                 |                 | ``dupli         |
|                 |                 |                 | cate-invalid``, |
|                 |                 |                 | ``              |
|                 |                 |                 | inconclusive``, |
|                 |                 |                 | or              |
|                 |                 |                 | ``rejected``.   |
|                 |                 |                 | The JSON-RPC    |
|                 |                 |                 | ``error`` field |
|                 |                 |                 | will still be   |
|                 |                 |                 | set to ``null`` |
|                 |                 |                 | if submission   |
|                 |                 |                 | failed for one  |
|                 |                 |                 | of these        |
|                 |                 |                 | reasons         |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.15.0*

Submit the following block with the a dummy value, “test”.

.. code:: bash

   dash-cli -testnet submitblock 0100002032e3965d5fdd7a883209d516599337eb4cb82f\
     7aea22ecc114942c1f00000000244388a3bd2c38a85bf337755a1a165d0df2b335e3886058\
     40e08a3cdf1ce1a4297ede598f6a011d027c1c300201000000010000000000000000000000\
     000000000000000000000000000000000000000000ffffffff1202791f0e2f5032506f6f6c\
     2d74444153482fffffffff044d75bb8b010000001976a914d4a5ea2641e9dd37f7a5ad5c92\
     9df4743518769188acac2ea68f010000001976a9148d0934de58f969df3b53a72b4f47211d\
     890ebf5588ac68b9ea03000000004341047559d13c3f81b1fadbd8dd03e4b5a1c73b05e2b9\
     80e00d467aa9440b29c7de23664dde6428d75cafed22ae4f0d302e26c5c5a5dd4d3e1b796d\
     7281bdc9430f35ac00000000000000002a6a28f47e935509fc85533dc78197e93e87d1c793\
     43bda495429d8e3680069f6a22780000000002000000000000000100000001078e0c77e3b0\
     4323d0834841f965543aaae2b275f684f55fbaf22e1c83bff97e010000006a473044022077\
     6e96d202cc4f50f79d269d7cd36712c7486282dda0cb6eae583c916c98b34c022070941efb\
     3201cf500cc6b879d6570fc477d4c3e6a8d91286e84465235f542c42012102dddbfc3fe06b\
     96e3a36f3e815222cd1cb9586b3193c4a0de030477f621956d51feffffff02a00bd1000000\
     00001976a914d7b47d4b40a23c389f5a17754d7f60f511c7d0ec88ac316168821300000019\
     76a914c9190e507834b78a624d7578f1ad3819592ca1aa88ac771f0000 \
     "test"

Result (the block above was already on a local block chain):

.. code:: text

   duplicate

*See also*

-  `GetBlockTemplate </docs/core-api-ref-remote-procedure-calls-mining#getblocktemplate>`__:
   gets a block template or proposal for use with mining software.

SubmitHeader
============

The ```submitheader``
RPC <core-api-ref-remote-procedure-calls-mining#submitheader>`__
decodes the given hexdata as a header and submits it as a candidate chain tip if valid.
If invalid, it throws.

 \ *Parameter #1—hexdata*

======= ============ =================== =====================
Name    Type         Presence            Description
======= ============ =================== =====================
hexdata string (hex) Required(exactly 1) The block header data
======= ============ =================== =====================

*Result—``None``*

========== ==== ============ ===========
Name       Type Presence     Description
========== ==== ============ ===========
``result`` None Not Required N/A
========== ==== ============ ===========

*Example from Dash Core 18.0.0*

.. code:: bash

   dash-cli -testnet submitheader 0000002037f7981be497c71524bb9f7454d80b1448f46b6f99c3cadfee4367f0c201000007a95ed6e4d19efa99f33c93b45ee2eab5b5a0ef230ac9c03ecc8a3b5ef8938f5b1978614745021ed6cb0000

Result:

::

   null

*See also: none*
