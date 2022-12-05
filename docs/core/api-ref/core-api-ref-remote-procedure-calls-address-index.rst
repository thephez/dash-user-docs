GetAddressBalance
=================

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**) and ``-addressindex`` Dash Core
command-line/configuration-file parameter to be enabled.” } [/block] The
```getaddressbalance``
RPC <core-api-ref-remote-procedure-calls-address-index#getaddressbalance>`__
returns the balance for address(es).

*Parameter #1—an array of <>*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``addresses``   | object          | R               | An array of     |
|                 |                 | equired(exactly | P2PKH or P2SH   |
|                 |                 | 1)              | Dash            |
|                 |                 |                 | address(es)     |
+-----------------+-----------------+-----------------+-----------------+
| →Address        | string (base58) | Required(1 or   | The base58check |
|                 |                 | more)           | encoded address |
+-----------------+-----------------+-----------------+-----------------+

*Result—the current balance in <> and the total number of duffs received
(including change)*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An object       |
|                 |                 | equired(exactly | listing the     |
|                 |                 | 1)              | current balance |
|                 |                 |                 | and total       |
|                 |                 |                 | amount received |
|                 |                 |                 | (including      |
|                 |                 |                 | change), or an  |
|                 |                 |                 | error if any    |
|                 |                 |                 | address is      |
|                 |                 |                 | invalid         |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``balance``  | string          | R               | The current     |
|                 |                 | equired(exactly | balance in      |
|                 |                 | 1)              | duffs           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``bal        | string          | R               | The current     |
| ance_immature`` |                 | equired(exactly | immature        |
|                 |                 | 1)              | balance in      |
|                 |                 |                 | duffs           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``bala       | string          | R               | The current     |
| nce_spendable`` |                 | equired(exactly | spendable       |
|                 |                 | 1)              | balance in      |
|                 |                 |                 | duffs           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``received`` | string          | R               | The total       |
|                 |                 | equired(exactly | number of duffs |
|                 |                 | 1)              | received        |
|                 |                 |                 | (including      |
|                 |                 |                 | change)         |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

Get the balance for an address:

.. code:: bash

   dash-cli getaddressbalance '{"addresses": ["yWjoZBvnUKWhpKMbBkVVnnMD8Bzno9j6tQ"]}'

Result:

.. code:: json

   {
     "balance": 876020488,
     "balance_immature": 776020488,
     "balance_spendable": 100000000,
     "received": 876020488
   }

*See also*

-  `GetBalance </docs/core-api-ref-remote-procedure-calls-wallet#getbalance>`__:
   gets the balance in decimal dash across all accounts or for a
   particular account.
-  `GetUnconfirmedBalance </docs/core-api-ref-remote-procedure-calls-wallet#getunconfirmedbalance>`__:
   returns the wallet’s total unconfirmed balance.

GetAddressDeltas
================

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**) and ``-addressindex`` Dash Core
command-line/configuration-file parameter to be enabled.” } [/block]

The ```getaddressdeltas``
RPC <core-api-ref-remote-procedure-calls-address-index#getaddressdeltas>`__
returns all changes for an address.

*Parameter #1—an array of addresses*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``addresses``   | object          | R               | An array of     |
|                 |                 | equired(exactly | P2PKH or P2SH   |
|                 |                 | 1)              | Dash            |
|                 |                 |                 | address(es)     |
+-----------------+-----------------+-----------------+-----------------+
| →Address        | string (base58) | Required(1 or   | The base58check |
|                 |                 | more)           | encoded address |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the start block height*

========= ============ =================== ======================
Name      Type         Presence            Description
========= ============ =================== ======================
``start`` number (int) Optional(exactly 1) The start block height
========= ============ =================== ======================

*Parameter #3—the end block height*

======= ============ =================== ====================
Name    Type         Presence            Description
======= ============ =================== ====================
``end`` number (int) Optional(exactly 1) The end block height
======= ============ =================== ====================

*Result—information about all changes for the address(es)*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | An array of     |
|                 |                 | equired(exactly | JSON objects,   |
|                 |                 | 1)              | with each       |
|                 |                 |                 | object          |
|                 |                 |                 | describing a    |
|                 |                 |                 | transaction     |
|                 |                 |                 | involving one   |
|                 |                 |                 | of the          |
|                 |                 |                 | requested       |
|                 |                 |                 | addresses       |
+-----------------+-----------------+-----------------+-----------------+
| →Delta          | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing a    |
|                 |                 |                 | particular      |
|                 |                 |                 | address delta   |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | The difference  |
| →\ ``satoshis`` |                 | equired(exactly | of duffs        |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``txid``    | string          | R               | The related     |
|                 |                 | equired(exactly | txid            |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →→\             | number          | R               | The related     |
|  ``blockindex`` |                 | equired(exactly | input or output |
|                 |                 | 1)              | index           |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``height``  | number          | R               | The block       |
|                 |                 | equired(exactly | height          |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``address`` | string          | R               | The base58check |
|                 |                 | equired(exactly | encoded address |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Get the deltas for an address:

.. code:: bash

   dash-cli getaddressdeltas '{"addresses": ["yWjoZBvnUKWhpKMbBkVVnnMD8Bzno9j6tQ"], "start":5000, "end":7500}'

Result:

.. code:: json

   [
     {
       "satoshis": 10000100,
       "txid": "1fe86e463a9394d4ccd9a5ff1c6b483c95b4350ffdb055b55dc3615111e977de",
       "index": 18,
       "blockindex": 1,
       "height": 6708,
       "address": "yWjoZBvnUKWhpKMbBkVVnnMD8Bzno9j6tQ"
     },
     {
       "satoshis": -10000100,
       "txid": "6cb4379eec45cd3bb08b8f4c3a101b8cd89795e24f2cb8288a9941a85fb114cf",
       "index": 0,
       "blockindex": 1,
       "height": 7217,
       "address": "yWjoZBvnUKWhpKMbBkVVnnMD8Bzno9j6tQ"
     }
   ]

GetAddressMempool
=================

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**) and ``-addressindex`` Dash Core
command-line/configuration-file parameter to be enabled.” } [/block]

The ```getaddressmempool``
RPC <core-api-ref-remote-procedure-calls-address-index#getaddressmempool>`__
returns all mempool deltas for an address.

*Parameter #1—an array of addresses*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``addresses``   | object          | R               | An array of     |
|                 |                 | equired(exactly | P2PKH or P2SH   |
|                 |                 | 1)              | Dash            |
|                 |                 |                 | address(es)     |
+-----------------+-----------------+-----------------+-----------------+
| →Address        | string (base58) | Required(1 or   | The base58check |
|                 |                 | more)           | encoded address |
+-----------------+-----------------+-----------------+-----------------+

*Result—information about mempool deltas for the address(es)*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | An array of     |
|                 |                 | equired(exactly | JSON objects,   |
|                 |                 | 1)              | with each       |
|                 |                 |                 | object          |
|                 |                 |                 | describing a    |
|                 |                 |                 | transaction     |
|                 |                 |                 | involving one   |
|                 |                 |                 | of the          |
|                 |                 |                 | requested       |
|                 |                 |                 | addresses       |
+-----------------+-----------------+-----------------+-----------------+
| →Mempool Deltas | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing a    |
|                 |                 |                 | particular      |
|                 |                 |                 | mempool address |
|                 |                 |                 | delta           |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``address`` | string          | R               | The base58check |
|                 |                 | equired(exactly | encoded address |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``txid``    | string          | R               | The related     |
|                 |                 | equired(exactly | txid            |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``index``   | number          | R               | The related     |
|                 |                 | equired(exactly | input or output |
|                 |                 | 1)              | index           |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | The difference  |
| →\ ``satoshis`` |                 | equired(exactly | of duffs        |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →→              | string          | R               | The time the    |
| \ ``timestamp`` |                 | equired(exactly | transaction     |
|                 |                 | 1)              | entered the     |
|                 |                 |                 | mempool         |
|                 |                 |                 | (seconds)       |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | The previous    |
| →\ ``prevtxid`` |                 | equired(exactly | txid (if        |
|                 |                 | 1)              | spending)       |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``prevout`` | string          | R               | The previous    |
|                 |                 | equired(exactly | transaction     |
|                 |                 | 1)              | output index    |
|                 |                 |                 | (if spending)   |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Get the deltas for an address:

.. code:: bash

   dash-cli getaddressmempool '{"addresses": ["yVcYtcKd3nSi85JFtE8ZSDPimj3VMTJB8k"]}'

Result:

.. code:: json

   [
     {
       "address": "yVcYtcKd3nSi85JFtE8ZSDPimj3VMTJB8k",
       "txid": "e53d871df8b26116fbc1b766172323f9c477375133eec8ea5c66f1867a61a533",
       "index": 1,
       "satoshis": 100000000000,
       "timestamp": 1573753889
     }
   ]

GetAddressTxids
===============

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**) and ``-addressindex`` Dash Core
command-line/configuration-file parameter to be enabled.” } [/block]

The ```getaddresstxids``
RPC <core-api-ref-remote-procedure-calls-address-index#getaddresstxids>`__
returns the txids for an address(es).

*Parameter #1—an array of addresses*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``addresses``   | object          | R               | An array of     |
|                 |                 | equired(exactly | P2PKH or P2SH   |
|                 |                 | 1)              | Dash            |
|                 |                 |                 | address(es)     |
+-----------------+-----------------+-----------------+-----------------+
| →Address        | string (base58) | Required(1 or   | The base58check |
|                 |                 | more)           | encoded address |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the start block height*

========= ============ =================== ======================
Name      Type         Presence            Description
========= ============ =================== ======================
``start`` number (int) Optional(exactly 1) The start block height
========= ============ =================== ======================

*Parameter #3—the end block height*

======= ============ =================== ====================
Name    Type         Presence            Description
======= ============ =================== ====================
``end`` number (int) Optional(exactly 1) The end block height
======= ============ =================== ====================

*Result—information about txids for the address(es)*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | An array of     |
|                 |                 | equired(exactly | txids related   |
|                 |                 | 1)              | to the          |
|                 |                 |                 | requested       |
|                 |                 |                 | address(es)     |
+-----------------+-----------------+-----------------+-----------------+
| →TXID           | string          | Required(1 or   | The transaction |
|                 |                 | more)           | id              |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Get the deltas for an address:

.. code:: bash

   dash-cli getaddresstxids '{"addresses": ["yWjoZBvnUKWhpKMbBkVVnnMD8Bzno9j6tQ"], "start":5000, "end":7500}'

Result:

.. code:: json

   [
     "1fe86e463a9394d4ccd9a5ff1c6b483c95b4350ffdb055b55dc3615111e977de",
     "6cb4379eec45cd3bb08b8f4c3a101b8cd89795e24f2cb8288a9941a85fb114cf"
   ]

GetAddressUtxos
===============

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**) and ``-addressindex`` Dash Core
command-line/configuration-file parameter to be enabled.” } [/block]

The ```getaddressutxos``
RPC <core-api-ref-remote-procedure-calls-address-index#getaddressutxos>`__
returns all unspent outputs for an address.

*Parameter #1—an array of addresses*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``addresses``   | object          | R               | An array of     |
|                 |                 | equired(exactly | P2PKH or P2SH   |
|                 |                 | 1)              | Dash            |
|                 |                 |                 | address(es)     |
+-----------------+-----------------+-----------------+-----------------+
| →Address        | string (base58) | Required(1 or   | The base58check |
|                 |                 | more)           | encoded address |
+-----------------+-----------------+-----------------+-----------------+

*Result—information about unspent outputs for the address(es)*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | An array of     |
|                 |                 | equired(exactly | JSON objects,   |
|                 |                 | 1)              | with each       |
|                 |                 |                 | object          |
|                 |                 |                 | describing a    |
|                 |                 |                 | transaction     |
|                 |                 |                 | involving one   |
|                 |                 |                 | of the          |
|                 |                 |                 | requested       |
|                 |                 |                 | addresses       |
+-----------------+-----------------+-----------------+-----------------+
| →Unspent        | object          | Required(1 or   | An object       |
| outputs         |                 | more)           | describing a    |
|                 |                 |                 | particular      |
|                 |                 |                 | unspent output  |
|                 |                 |                 | for the         |
|                 |                 |                 | requested       |
|                 |                 |                 | address(es)     |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``address`` | string          | R               | The base58check |
|                 |                 | equired(exactly | encoded address |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``txid``    | string          | R               | The output txid |
|                 |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →→\             | number          | R               | The output      |
| ``outputIndex`` |                 | equired(exactly | index           |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``script``  | string          | R               | The script hex  |
|                 |                 | equired(exactly | encoded         |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | The number of   |
| →\ ``satoshis`` |                 | equired(exactly | duffs of the    |
|                 |                 | 1)              | output          |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``height``  | number          | R               | The block       |
|                 |                 | equired(exactly | height          |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Get the unspent outputs for an address:

.. code:: bash

   dash-cli getaddressutxos '{"addresses": ["yLeC3F9UxJmFaRaf5yzH7FDc7RdvBasi84"]}'

Result:

.. code:: json

   [
     {
       "address": "yLeC3F9UxJmFaRaf5yzH7FDc7RdvBasi84",
       "txid": "ef7bcd083db8c9551ca295698c3b7a6811288fae9944018d2a660a0f939bdb35",
       "outputIndex": 0,
       "script": "76a914038b8a73338c8f9c22024338198d63ff7c4cb4c088ac",
       "satoshis": 1000010000,
       "height": 7683
     }
   ]
