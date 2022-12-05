CombinePSBT
===========

The ```combinepsbt``
RPC <core-api-ref-remote-procedure-calls-raw-transactions#combinepsbt>`__
combines multiple partially-signed Dash transactions into one
transaction. Implements the Combiner role. This should be used only with
``createrawtransaction`` and ``fundrawtransaction``. ``createpsbt`` and
``walletcreatefundedpsbt`` should be used for new applications.

*Parameter #1—txs*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Transactions    | string          | R               | An array of     |
|                 |                 | equired(exactly | base64 strings  |
|                 |                 | 1)              | of partially    |
|                 |                 |                 | signed          |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+
| → psbt          | string          | R               | A base64 string |
|                 |                 | equired(exactly | of a PSBT       |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+

*Result—psbt*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | string          | R               | The             |
|                 |                 | equired(Exactly | base64-encoded  |
|                 |                 | 1)              | partially       |
|                 |                 |                 | signed          |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

.. code:: bash

   dash-cli -testnet combinepsbt '["cHNidP8BAFUCAAAAAQcxBA7Cdee2EvS1IyiRPzCVxbt9wFnrqry3AMUBOYvqAAAAAAD/////AQDh9QUAAAAAGXapFLBKVDBt/eE2UU3EUaAiMeuIUMC1iKwAAAAAAAEA3wIAAAAB9LcsqdmAuKwHgkt0HMpJuSx8RnBxL73+ORGz4ogdt+gBAAAAakcwRAIgJR7zIP4o/GRTAyvswKmdFDx+PBO/tB24s0ydQcRpOZECIAvm3Q2xMIpdAAhl17yQAkQjElRbZEIbcr7pGCpNbzqsASEDIcX0+C0b8ib3pvxlx809S7xOmAj0NH3i9vFe8pUTvHX+////AgBlzR0AAAAAF6kUJOSskBQ3xyDtInRjI2eW1QraJ9eHIcmaOwAAAAAZdqkUPU2zmkAo79MmS8yW1oYUjb7jz0qIrOosCQAiAgN+48COTyy1UqO7c63g5A9YEMnBIiYF+FcREEaGgxAHukcwRAIgfwcMEFPrmy81y5NWFj8M0CHUBlzzQxr4RoxSmzvmVIQCIH22f9/A/K0keQ7rKcya0E5zTlnYDnly8VJIrj2yUgflAQEER1IhA37jwI5PLLVSo7tzreDkD1gQycEiJgX4VxEQRoaDEAe6IQK1B5TV+2qTmU+/c3Pzl61bklYbfj9yg+jbdGyMoKE/vFKuAAA=", "cHNidP8BAFUCAAAAAQcxBA7Cdee2EvS1IyiRPzCVxbt9wFnrqry3AMUBOYvqAAAAAAD/////AQDh9QUAAAAAGXapFLBKVDBt/eE2UU3EUaAiMeuIUMC1iKwAAAAAAAEA3wIAAAAB9LcsqdmAuKwHgkt0HMpJuSx8RnBxL73+ORGz4ogdt+gBAAAAakcwRAIgJR7zIP4o/GRTAyvswKmdFDx+PBO/tB24s0ydQcRpOZECIAvm3Q2xMIpdAAhl17yQAkQjElRbZEIbcr7pGCpNbzqsASEDIcX0+C0b8ib3pvxlx809S7xOmAj0NH3i9vFe8pUTvHX+////AgBlzR0AAAAAF6kUJOSskBQ3xyDtInRjI2eW1QraJ9eHIcmaOwAAAAAZdqkUPU2zmkAo79MmS8yW1oYUjb7jz0qIrOosCQAiAgK1B5TV+2qTmU+/c3Pzl61bklYbfj9yg+jbdGyMoKE/vEcwRAIgP3PuTCqVSU0Cx5UDknTwmAFJ6N80sV+YiUmy392/4BUCIEB6QOZe3SJeJ3OVmBCmoEPWcHqbstIvxhCxJ2h+fkSZAQEER1IhA37jwI5PLLVSo7tzreDkD1gQycEiJgX4VxEQRoaDEAe6IQK1B5TV+2qTmU+/c3Pzl61bklYbfj9yg+jbdGyMoKE/vFKuAAA="]'

Result:

::

   cHNidP8BAFUCAAAAAQcxBA7Cdee2EvS1IyiRPzCVxbt9wFnrqry3AMUBOYvqAAAAAAD/////AQDh9QUAAAAAGXapFLBKVDBt/eE2UU3EUaAiMeuIUMC1iKwAAAAAAAEA3wIAAAAB9LcsqdmAuKwHgkt0HMpJuSx8RnBxL73+ORGz4ogdt+gBAAAAakcwRAIgJR7zIP4o/GRTAyvswKmdFDx+PBO/tB24s0ydQcRpOZECIAvm3Q2xMIpdAAhl17yQAkQjElRbZEIbcr7pGCpNbzqsASEDIcX0+C0b8ib3pvxlx809S7xOmAj0NH3i9vFe8pUTvHX+////AgBlzR0AAAAAF6kUJOSskBQ3xyDtInRjI2eW1QraJ9eHIcmaOwAAAAAZdqkUPU2zmkAo79MmS8yW1oYUjb7jz0qIrOosCQAiAgN+48COTyy1UqO7c63g5A9YEMnBIiYF+FcREEaGgxAHukcwRAIgfwcMEFPrmy81y5NWFj8M0CHUBlzzQxr4RoxSmzvmVIQCIH22f9/A/K0keQ7rKcya0E5zTlnYDnly8VJIrj2yUgflASICArUHlNX7apOZT79zc/OXrVuSVht+P3KD6Nt0bIygoT+8RzBEAiA/c+5MKpVJTQLHlQOSdPCYAUno3zSxX5iJSbLf3b/gFQIgQHpA5l7dIl4nc5WYEKagQ9Zwepuy0i/GELEnaH5+RJkBAQRHUiEDfuPAjk8stVKju3Ot4OQPWBDJwSImBfhXERBGhoMQB7ohArUHlNX7apOZT79zc/OXrVuSVht+P3KD6Nt0bIygoT+8Uq4AAA==

*See also:*

-  `CreatePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#createpsbt>`__:
   creates a transaction in the Partially Signed Transaction (PST)
   format.
-  `DecodePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#decodepsbt>`__:
   returns a JSON object representing the serialized, base64-encoded
   partially signed Dash transaction.
-  `FinalizePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#finalizepsbt>`__:
   finalizes the inputs of a PSBT.
-  `WalletProcessPSBT </docs/core-api-ref-remote-procedure-calls-wallet#walletprocesspsbt>`__:
   updates a PSBT with input information from a wallet and then allows
   the signing of inputs.

CombineRawTransaction
=====================

The ```combinerawtransaction``
RPC <core-api-ref-remote-procedure-calls-raw-transactions#combinerawtransaction>`__
combine multiple partially signed transactions into one transaction.

The combined transaction may be another partially signed transaction or
a fully signed transaction.

*Parameter #1—txs*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| txs             | string          | Required        | A json array of |
|                 |                 |                 | hex strings of  |
|                 |                 |                 | partially       |
|                 |                 |                 | signed          |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+

*Result—hex-encoded raw transaction with signature(s)*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | string          | R               | The resulting   |
|                 |                 | equired(Exactly | raw transaction |
|                 |                 | 1)              | in serialized   |
|                 |                 |                 | transaction     |
|                 |                 |                 | format encoded  |
|                 |                 |                 | as hex.         |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.15.0*

The following example shows a fully signed two input transaction being
assembled by combining two partially signed transactions. The first
hex-encoded string is the transaction with only the first input signed.
The second hex-encoded string is the transaction with only the second
input signed.

.. code:: bash

   dash-cli -testnet combinerawtransaction '[
    "0200000002fdb27b4f2b80a5fd3b96602618a6ccf7bdde504bf90989610b19ed6ecd769520010000006b483045022100f8770316327966fb1972338d14db8d38048455da8b62f6350b117c797cea459e02206c63c103cf53ce1d24a313b3e6853913fa14febafd733e683b6eb46a7beec0fa012103c67d86944315838aea7ec80d390b5d09b91b62483370d4979da5ccf7a7df77a9ffffffff0d052e9b13c53bb342d772767732ffe4fa9f1c150629d3fa79655267baa7c86a0100000000ffffffff0200ca9a3b000000001976a9144139b147b5cef5fef5bcdb02fcdf55e426f74dbb88ac00daf89a000000001976a91465f53f2095c99ce152ff3bc8a8f027d8a77cbdcb88ac00000000",
    "0200000002fdb27b4f2b80a5fd3b96602618a6ccf7bdde504bf90989610b19ed6ecd7695200100000000ffffffff0d052e9b13c53bb342d772767732ffe4fa9f1c150629d3fa79655267baa7c86a010000006b4830450221008c3abc11ea84cc98cf674afc5b6d3d078d672768d289f2ab976ea4b2a49129fc022008470458b1b179800e7f5348196d510d2f147e69fe836c94135fc5c620312acd012102912ba98d6641f79864d04d41523167f5db267e45d1633e9243a0be7efb675719ffffffff0200ca9a3b000000001976a9144139b147b5cef5fef5bcdb02fcdf55e426f74dbb88ac00daf89a000000001976a91465f53f2095c99ce152ff3bc8a8f027d8a77cbdcb88ac00000000"
   ]'

Result:

.. code:: bash

   0200000002fdb27b4f2b80a5fd3b96602618a6ccf7bdde504bf90989610b19ed6ecd7695\
   20010000006b483045022100f8770316327966fb1972338d14db8d38048455da8b62f635\
   0b117c797cea459e02206c63c103cf53ce1d24a313b3e6853913fa14febafd733e683b6e\
   b46a7beec0fa012103c67d86944315838aea7ec80d390b5d09b91b62483370d4979da5cc\
   f7a7df77a9ffffffff0d052e9b13c53bb342d772767732ffe4fa9f1c150629d3fa796552\
   67baa7c86a010000006b4830450221008c3abc11ea84cc98cf674afc5b6d3d078d672768\
   d289f2ab976ea4b2a49129fc022008470458b1b179800e7f5348196d510d2f147e69fe83\
   6c94135fc5c620312acd012102912ba98d6641f79864d04d41523167f5db267e45d1633e\
   9243a0be7efb675719ffffffff0200ca9a3b000000001976a9144139b147b5cef5fef5bc\
   db02fcdf55e426f74dbb88ac00daf89a000000001976a91465f53f2095c99ce152ff3bc8\
   a8f027d8a77cbdcb88ac00000000

*See also:*

-  `CreateRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#createrawtransaction>`__:
   creates an unsigned serialized transaction that spends a previous
   output to a new output with a P2PKH or P2SH address. The transaction
   is not stored in the wallet or transmitted to the network.
-  `DecodeRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#decoderawtransaction>`__:
   decodes a serialized transaction hex string into a JSON object
   describing the transaction.
-  `SignRawTransactionWithKey <#signrawtransactionwithkey>`__: signs
   inputs for a transaction in the serialized transaction format using
   private keys provided in the call.
-  `SendRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#sendrawtransaction>`__:
   validates a transaction and broadcasts it to the peer-to-peer
   network.
-  `Serialized Transaction
   Format <core-ref-transactions-raw-transaction-format>`__

ConvertToPSBT
=============

The ```converttopsbt``
RPC <core-api-ref-remote-procedure-calls-raw-transactions#converttopsbt>`__
converts a network serialized transaction to a PSBT. This should be used
only with ``createrawtransaction`` and ``fundrawtransaction``.
``createpsbt`` and ``walletcreatefundedpsbt`` should be used for new
applications.

*Parameter #1—hexstring*

==== ====== ======== ===================================
Name Type   Presence Description
==== ====== ======== ===================================
hex  string Required The hex string of a raw transaction
==== ====== ======== ===================================

*Parameter #2—permitsigdata*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| data            | bool            | Optional        | If true, any    |
|                 |                 |                 | signatures in   |
|                 |                 |                 | the input will  |
|                 |                 |                 | be discarded    |
|                 |                 |                 | and conversion  |
|                 |                 |                 | will continue.  |
|                 |                 |                 | If false, RPC   |
|                 |                 |                 | will fail if    |
|                 |                 |                 | any signatures  |
|                 |                 |                 | are present.    |
+-----------------+-----------------+-----------------+-----------------+

*Result—psbt*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | string          | R               | The resulting   |
|                 |                 | equired(Exactly | raw transaction |
|                 |                 | 1)              | is a            |
|                 |                 |                 | base64-encoded  |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

.. code:: bash

   dash-cli -testnet converttopsbt 02000000016b490886c0198b028c6c5cb145c4eb3b1055a224a7a105aadeff41b69ec91e060100000000ffffffff0200205fa0120000001976a914485485425fa99504ec1638ac4213f3cfc9f32ef388acc0a8f9be010000001976a914811eacc14db8ebb5b64486dc43400c0226b428a488ac00000000

Result:

::

   cHNidP8BAHcCAAAAAWtJCIbAGYsCjGxcsUXE6zsQVaIkp6EFqt7/QbaeyR4GAQAAAAD/////AgAgX6ASAAAAGXapFEhUhUJfqZUE7BY4rEIT88/J8y7ziKzAqPm+AQAAABl2qRSBHqzBTbjrtbZEhtxDQAwCJrQopIisAAAAAAAAAAA=

*See also:*

-  `CreateRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#createrawtransaction>`__:
   creates an unsigned serialized transaction that spends a previous
   output to a new output with a P2PKH or P2SH address. The transaction
   is not stored in the wallet or transmitted to the network.
-  `CreatePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#createpsbt>`__:
   creates a transaction in the Partially Signed Transaction (PST)
   format.
-  `CombinePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#combinepsbt>`__:
   combine multiple partially-signed Dash transactions into one
   transaction.
-  `DecodePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#decodepsbt>`__:
   returns a JSON object representing the serialized, base64-encoded
   partially signed Dash transaction.
-  `FinalizePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#finalizepsbt>`__:
   finalizes the inputs of a PSBT.
-  `SignRawTransactionWithKey <#signrawtransactionwithkey>`__: signs
   inputs for a transaction in the serialized transaction format using
   private keys provided in the call.
-  `Serialized Transaction
   Format <core-ref-transactions-raw-transaction-format>`__
-  `WalletCreateFundedPSBT </docs/core-api-ref-remote-procedure-calls-wallet#walletcreatefundedpsbt>`__:
   creates and funds a transaction in the Partially Signed Transaction
   (PST) format.
-  `WalletProcessPSBT </docs/core-api-ref-remote-procedure-calls-wallet#walletprocesspsbt>`__:
   updates a PSBT with input information from a wallet and then allows
   the signing of inputs.

CreatePSBT
==========

The ```createpsbt``
RPC <core-api-ref-remote-procedure-calls-raw-transactions#createpsbt>`__
creates a transaction in the Partially Signed Transaction (PST) format.

Implements the Creator role.

*Parameter #1—Inputs*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Transactions    | array           | R               | An array of     |
|                 |                 | equired(exactly | objects, each   |
|                 |                 | 1)              | one to be used  |
|                 |                 |                 | as an input to  |
|                 |                 |                 | the transaction |
+-----------------+-----------------+-----------------+-----------------+
| → Input         | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing a    |
|                 |                 |                 | particular      |
|                 |                 |                 | input           |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``txid``   | string (hex)    | R               | The TXID of the |
|                 |                 | equired(exactly | outpoint to be  |
|                 |                 | 1)              | spent encoded   |
|                 |                 |                 | as hex in RPC   |
|                 |                 |                 | byte order      |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``vout``   | number (int)    | R               | The output      |
|                 |                 | equired(exactly | index number    |
|                 |                 | 1)              | (vout) of the   |
|                 |                 |                 | outpoint to be  |
|                 |                 |                 | spent; the      |
|                 |                 |                 | first output in |
|                 |                 |                 | a transaction   |
|                 |                 |                 | is index ``0``  |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | Optional(0 or   | The sequence    |
| →\ ``Sequence`` |                 | 1)              | number to use   |
|                 |                 |                 | for the input   |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—Outputs*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Outputs         | array           | R               | A JSON array    |
|                 |                 | equired(exactly | with outputs as |
|                 |                 | 1)              | key-value pairs |
+-----------------+-----------------+-----------------+-----------------+
| → Output        | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing a    |
|                 |                 |                 | particular      |
|                 |                 |                 | output          |
+-----------------+-----------------+-----------------+-----------------+
| → →Address      | string : number | Optional(0 or   | A key-value     |
|                 | (Dash)          | 1)              | pair. The key   |
|                 |                 |                 | (string) is the |
|                 |                 |                 | Dash address,   |
|                 |                 |                 | the value       |
|                 |                 |                 | (float or       |
|                 |                 |                 | string) is the  |
|                 |                 |                 | amount in DASH  |
+-----------------+-----------------+-----------------+-----------------+
| → →Data         | ``data`` :      | Optional(0 or   | A key-value     |
|                 | string (hex)    | 1)              | pair. The key   |
|                 |                 |                 | must be         |
|                 |                 |                 | ``data``, the   |
|                 |                 |                 | value is hex    |
|                 |                 |                 | encoded data    |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—locktime*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Locktime        | numeric (int)   | Optional(0 or   | Indicates the   |
|                 |                 | 1)              | earliest time a |
|                 |                 |                 | transaction can |
|                 |                 |                 | be added to the |
|                 |                 |                 | block chain.    |
|                 |                 |                 | Non-0 value     |
|                 |                 |                 | also            |
|                 |                 |                 | loc             |
|                 |                 |                 | ktime-activates |
|                 |                 |                 | inputs.         |
+-----------------+-----------------+-----------------+-----------------+

*Result—the raw transaction in base64*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | string          | R               | The resulting   |
|                 |                 | equired(Exactly | raw transaction |
|                 |                 | 1)              | (base64-encoded |
|                 |                 |                 | string)         |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

.. code:: bash

   dash-cli -testnet createpsbt "[{\"txid\":\"2662c87e1761ed5f4e98a0640b2608114d86f282824a51bd624985d236c71178\",\"vout\":0}]" "[{\"data\":\"00010203\"}]"

Result:

::

   cHNidP8BAEICAAAAAXgRxzbShUlivVFKgoLyhk0RCCYLZKCYTl/tYRd+yGImAAAAAAD/////AQAAAAAAAAAABmoEAAECAwAAAAAAAAA=

*See also*

-  `CombinePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#combinepsbt>`__:
   combine multiple partially-signed Dash transactions into one
   transaction.
-  `ConvertToPSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#converttopsbt>`__:
   converts a network serialized transaction to a PSBT.
-  `DecodePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#decodepsbt>`__:
   returns a JSON object representing the serialized, base64-encoded
   partially signed Dash transaction.
-  `FinalizePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#finalizepsbt>`__:
   finalizes the inputs of a PSBT.
-  `WalletCreateFundedPSBT </docs/core-api-ref-remote-procedure-calls-wallet#walletcreatefundedpsbt>`__:
   creates and funds a transaction in the Partially Signed Transaction
   (PST) format.
-  `WalletProcessPSBT </docs/core-api-ref-remote-procedure-calls-wallet#walletprocesspsbt>`__:
   updates a PSBT with input information from a wallet and then allows
   the signing of inputs.

CreateRawTransaction
====================

The ```createrawtransaction``
RPC <core-api-ref-remote-procedure-calls-raw-transactions#createrawtransaction>`__
creates an unsigned serialized transaction that spends a previous output
to a new output with a P2PKH or P2SH address. The transaction is not
stored in the wallet or transmitted to the network.

*Parameter #1—Inputs*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Transactions    | array           | R               | An array of     |
|                 |                 | equired(exactly | objects, each   |
|                 |                 | 1)              | one to be used  |
|                 |                 |                 | as an input to  |
|                 |                 |                 | the transaction |
+-----------------+-----------------+-----------------+-----------------+
| → Input         | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing a    |
|                 |                 |                 | particular      |
|                 |                 |                 | input           |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``txid``   | string (hex)    | R               | The TXID of the |
|                 |                 | equired(exactly | outpoint to be  |
|                 |                 | 1)              | spent encoded   |
|                 |                 |                 | as hex in RPC   |
|                 |                 |                 | byte order      |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``vout``   | number (int)    | R               | The output      |
|                 |                 | equired(exactly | index number    |
|                 |                 | 1)              | (vout) of the   |
|                 |                 |                 | outpoint to be  |
|                 |                 |                 | spent; the      |
|                 |                 |                 | first output in |
|                 |                 |                 | a transaction   |
|                 |                 |                 | is index ``0``  |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | Optional(0 or   | Added in Dash   |
| →\ ``Sequence`` |                 | 1)              | Core            |
|                 |                 |                 | 0.12.3.0.The    |
|                 |                 |                 | sequence number |
|                 |                 |                 | to use for the  |
|                 |                 |                 | input           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—Outputs*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Outputs         | array           | R               | A JSON array    |
|                 |                 | equired(exactly | with outputs as |
|                 |                 | 1)              | key-value pairs |
+-----------------+-----------------+-----------------+-----------------+
| → Output        | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing a    |
|                 |                 |                 | particular      |
|                 |                 |                 | output          |
+-----------------+-----------------+-----------------+-----------------+
| → →Address      | string : number | Optional(0 or   | A key-value     |
|                 | (Dash)          | 1)              | pair. The key   |
|                 |                 |                 | (string) is the |
|                 |                 |                 | Dash address,   |
|                 |                 |                 | the value       |
|                 |                 |                 | (float or       |
|                 |                 |                 | string) is the  |
|                 |                 |                 | amount in DASH  |
+-----------------+-----------------+-----------------+-----------------+
| → →Data         | ``data`` :      | Optional(0 or   | A key-value     |
|                 | string (hex)    | 1)              | pair. The key   |
|                 |                 |                 | must be         |
|                 |                 |                 | ``data``, the   |
|                 |                 |                 | value is hex    |
|                 |                 |                 | encoded data    |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—locktime*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Locktime        | numeric (int)   | Optional(0 or   | Indicates the   |
|                 |                 | 1)              | earliest time a |
|                 |                 |                 | transaction can |
|                 |                 |                 | be added to the |
|                 |                 |                 | block chain     |
+-----------------+-----------------+-----------------+-----------------+

*Result—the unsigned raw transaction in hex*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | string          | R               | The resulting   |
|                 |                 | equired(Exactly | unsigned raw    |
|                 |                 | 1)              | transaction in  |
|                 |                 |                 | serialized      |
|                 |                 |                 | transaction     |
|                 |                 |                 | format encoded  |
|                 |                 |                 | as base-64. If  |
|                 |                 |                 | the transaction |
|                 |                 |                 | couldn’t be     |
|                 |                 |                 | generated, this |
|                 |                 |                 | will be set to  |
|                 |                 |                 | JSON ``null``   |
|                 |                 |                 | and the         |
|                 |                 |                 | JSON-RPC error  |
|                 |                 |                 | field may       |
|                 |                 |                 | contain an      |
|                 |                 |                 | error message   |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

.. code:: bash

   dash-cli -testnet createrawtransaction '''
     [
       {
         "txid": "061ec99eb641ffdeaa05a1a724a255103bebc445b15c6c8c028b19c08608496b",
         "vout" : 1
       }
     ]''' \
     '''
     [
       {
         "ySutkc49Khpz1HQN8AfWNitVBLwqtyaxvv": 800
       },
       {
         "yY6AmGopsZS31wy1JLHR9P6AC6owFaXwuh": 74.99
       }
     ]''' \
     0

Result:

.. code:: text

   02000000016b490886c0198b028c6c5cb145c4eb3b1055a224a7a105aadeff41b69ec91e06010000\
   0000ffffffff0200205fa0120000001976a914485485425fa99504ec1638ac4213f3cfc9f32ef388\
   acc0a8f9be010000001976a914811eacc14db8ebb5b64486dc43400c0226b428a488ac00000000

*See also*

-  `CombineRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#combinerawtransaction>`__:
   combine multiple partially signed transactions into one transaction.
-  `DecodeRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#decoderawtransaction>`__:
   decodes a serialized transaction hex string into a JSON object
   describing the transaction.
-  `SignRawTransactionWithKey <#signrawtransactionwithkey>`__: signs
   inputs for a transaction in the serialized transaction format using
   private keys provided in the call.
-  `SendRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#sendrawtransaction>`__:
   validates a transaction and broadcasts it to the peer-to-peer
   network.
-  `Serialized Transaction
   Format <core-ref-transactions-raw-transaction-format>`__

DecodePSBT
==========

The ```decodepsbt``
RPC <core-api-ref-remote-procedure-calls-raw-transactions#decodepsbt>`__
returns a JSON object representing the serialized, base64-encoded
partially signed Dash transaction.

*Parameter #1—The PSBT base64 string*

======== ====== =================== ======================
Name     Type   Presence            Description
======== ====== =================== ======================
``psbt`` string Required(exactly 1) The PSBT base64 string
======== ====== =================== ======================

*Result—the decoded transaction*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An object       |
|                 |                 | equired(exactly | describing the  |
|                 |                 | 1)              | decoded         |
|                 |                 |                 | transaction, or |
|                 |                 |                 | JSON ``null``   |
|                 |                 |                 | if the          |
|                 |                 |                 | transaction     |
|                 |                 |                 | could not be    |
|                 |                 |                 | decoded         |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``tx``       | string (hex)    | R               | The decoded     |
|                 |                 | equired(exactly | net             |
|                 |                 | 1)              | work-serialized |
|                 |                 |                 | unsigned        |
|                 |                 |                 | transaction.    |
|                 |                 |                 | The layout is   |
|                 |                 |                 | the same as the |
|                 |                 |                 | output of       |
|                 |                 |                 | `dec            |
|                 |                 |                 | oderawtransacti |
|                 |                 |                 | on <#decoderawt |
|                 |                 |                 | ransaction>`__. |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``unknown``  | object          | R               | The unknown     |
|                 |                 | equired(exactly | global fields   |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →→Unknown       | object          | Required(0 or   | An unknown      |
|                 |                 | more)           | key-value pair  |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``inputs``   | array           | R               | An array of     |
|                 |                 | equired(exactly | objects with    |
|                 |                 | 1)              | each object     |
|                 |                 |                 | being an input  |
|                 |                 |                 | vector (vin)    |
|                 |                 |                 | for this        |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → →Input        | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing one  |
|                 |                 |                 | of this         |
|                 |                 |                 | transaction’s   |
|                 |                 |                 | inputs. May be  |
|                 |                 |                 | a regular input |
|                 |                 |                 | or a coinbase   |
+-----------------+-----------------+-----------------+-----------------+
| → →             | object          | Optional(0 or   | Decoded network |
| →\ ``non        |                 | more)           | transaction for |
| _witness_utxo`` |                 |                 | non-witness     |
|                 |                 |                 | UTXOs           |
+-----------------+-----------------+-----------------+-----------------+
| → →             | object          | Optional(0 or   | An object       |
| →\ ``parti      |                 | more)           | containing      |
| al_signatures`` |                 |                 | partial         |
|                 |                 |                 | signatures      |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | Required(1 or   | The public key  |
| →→\ ``pubkey``  |                 | more)           | and signature   |
|                 |                 |                 | that            |
|                 |                 |                 | corresponds to  |
|                 |                 |                 | it              |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | Optional(0 or   | The sighash     |
| →\ ``sighash``  |                 | 1)              | type to be used |
+-----------------+-----------------+-----------------+-----------------+
| → →             | object          | Optional(0 or   |                 |
| →\ ``           |                 | more)           |                 |
| redeem_script`` |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string          | R               | The signature   |
| →\ ``asm``      |                 | equired(exactly | script in       |
|                 |                 | 1)              | decoded form    |
|                 |                 |                 | with            |
|                 |                 |                 | n               |
|                 |                 |                 | on-data-pushing |
|                 |                 |                 | opcodes listed  |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string (hex)    | R               | The signature   |
| →\ ``hex``      |                 | equired(exactly | script encoded  |
|                 |                 | 1)              | as hex          |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string          | Optional(0 or   | The type of     |
| →\ ``type``     |                 | 1)              | script. This    |
|                 |                 |                 | will be one of  |
|                 |                 |                 | the following:• |
|                 |                 |                 | ``pubkey`` for  |
|                 |                 |                 | a P2PK script•  |
|                 |                 |                 | ``pubkeyhash``  |
|                 |                 |                 | for a P2PKH     |
|                 |                 |                 | script•         |
|                 |                 |                 | ``scripthash``  |
|                 |                 |                 | for a P2SH      |
|                 |                 |                 | script•         |
|                 |                 |                 | ``multisig``    |
|                 |                 |                 | for a bare      |
|                 |                 |                 | multisig        |
|                 |                 |                 | script•         |
|                 |                 |                 | ``nulldata``    |
|                 |                 |                 | for nulldata    |
|                 |                 |                 | scripts•        |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | for unknown     |
|                 |                 |                 | scripts         |
+-----------------+-----------------+-----------------+-----------------+
| → →             | object          | Optional(0 or   |                 |
| →\ `            |                 | more)           |                 |
| `bip32_derivs`` |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →             | object          | Optional(0 or   | The public key  |
| →→\ ``pubkey``  |                 | more)           | with the        |
|                 |                 |                 | derivation path |
|                 |                 |                 | as the value.   |
+-----------------+-----------------+-----------------+-----------------+
| → →             | object          | Optional(0 or   | The fingerprint |
| →→→\ ``maste    |                 | more)           | of the master   |
| r_fingerprint`` |                 |                 | key             |
+-----------------+-----------------+-----------------+-----------------+
| → →             | object          | Optional(0 or   | The public      |
| →→→\ ``path``   |                 | more)           | key’s path      |
+-----------------+-----------------+-----------------+-----------------+
| → →             | object          | Optional(0 or   |                 |
| →\ ``fi         |                 | more)           |                 |
| nal_scriptsig`` |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string          | R               | The signature   |
| →\ ``asm``      |                 | equired(exactly | script in       |
|                 |                 | 1)              | decoded form    |
|                 |                 |                 | with            |
|                 |                 |                 | n               |
|                 |                 |                 | on-data-pushing |
|                 |                 |                 | opcodes listed  |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string (hex)    | R               | The signature   |
| →\ ``hex``      |                 | equired(exactly | script encoded  |
|                 |                 | 1)              | as hex          |
+-----------------+-----------------+-----------------+-----------------+
| → →             | object          | Optional(0 or   | The unknown     |
| →\ ``unknown``  |                 | more)           | global fields   |
+-----------------+-----------------+-----------------+-----------------+
| → → → →Unknown  | object          | Required(0 or   | An unknown      |
|                 |                 | more)           | key-value pair  |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``vout``     | array           | R               | An array of     |
|                 |                 | equired(exactly | objects each    |
|                 |                 | 1)              | describing an   |
|                 |                 |                 | output vector   |
|                 |                 |                 | (vout) for this |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Output objects  |
|                 |                 |                 | will have the   |
|                 |                 |                 | same order      |
|                 |                 |                 | within the      |
|                 |                 |                 | array as they   |
|                 |                 |                 | have in the     |
|                 |                 |                 | transaction, so |
|                 |                 |                 | the first       |
|                 |                 |                 | output listed   |
|                 |                 |                 | will be output  |
|                 |                 |                 | 0               |
+-----------------+-----------------+-----------------+-----------------+
| → →Output       | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing one  |
|                 |                 |                 | of this         |
|                 |                 |                 | transaction’s   |
|                 |                 |                 | outputs         |
+-----------------+-----------------+-----------------+-----------------+
| → →             | object          | R               | An object       |
| →\ ``           |                 | equired(exactly | describing the  |
| redeem_script`` |                 | 1)              | pubkey script   |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string          | R               | The pubkey      |
| →\ ``asm``      |                 | equired(exactly | script in       |
|                 |                 | 1)              | decoded form    |
|                 |                 |                 | with            |
|                 |                 |                 | n               |
|                 |                 |                 | on-data-pushing |
|                 |                 |                 | opcodes listed  |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string (hex)    | R               | The pubkey      |
| →\ ``hex``      |                 | equired(exactly | script encoded  |
|                 |                 | 1)              | as hex          |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string          | Optional(0 or   | The type of     |
| →\ ``type``     |                 | 1)              | script. This    |
|                 |                 |                 | will be one of  |
|                 |                 |                 | the following:• |
|                 |                 |                 | ``pubkey`` for  |
|                 |                 |                 | a P2PK script•  |
|                 |                 |                 | ``pubkeyhash``  |
|                 |                 |                 | for a P2PKH     |
|                 |                 |                 | script•         |
|                 |                 |                 | ``scripthash``  |
|                 |                 |                 | for a P2SH      |
|                 |                 |                 | script•         |
|                 |                 |                 | ``multisig``    |
|                 |                 |                 | for a bare      |
|                 |                 |                 | multisig        |
|                 |                 |                 | script•         |
|                 |                 |                 | ``nulldata``    |
|                 |                 |                 | for nulldata    |
|                 |                 |                 | scripts•        |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | for unknown     |
|                 |                 |                 | scripts         |
+-----------------+-----------------+-----------------+-----------------+
| → →             | array           | Optional(0 or   | Array of JSON   |
| →\ `            |                 | more)           | objects         |
| `bip32_derivs`` |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| → → →→BIP32     | object          | Optional(0 or   | An object       |
| Deriv           |                 | more)           | containing      |
|                 |                 |                 | BIP32           |
|                 |                 |                 | derivation      |
|                 |                 |                 | infomation      |
+-----------------+-----------------+-----------------+-----------------+
| →→ →            | object          | Optional(0 or   | The public key  |
| →→\ ``pubkey``  |                 | more)           | this path       |
|                 |                 |                 | corresponds to  |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | object          | Optional(0 or   | The fingerprint |
| →→\ ``maste     |                 | more)           | of the master   |
| r_fingerprint`` |                 |                 | key             |
+-----------------+-----------------+-----------------+-----------------+
| → →             | object          | Optional(0 or   | The public      |
| →→→\ ``path``   |                 | more)           | key’s path      |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``fee``      | number (int)    | Optional(0 or   | The transaction |
|                 |                 | 1)              | fee paid if all |
|                 |                 |                 | UTXOs slots in  |
|                 |                 |                 | the PSBT have   |
|                 |                 |                 | been filled     |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

Decode a one-input, one-output transaction:

.. code:: bash

   dash-cli -testnet decodepsbt cHNidP8BAEICAAAAAXgRxzbShUlivVFKgoLyhk0RCCYLZKCYTl/tYRd+yGImAAAAAAD/////AQAAAAAAAAAABmoEAAECAwAAAAAAAAA=

Result:

.. code:: json

   {
     "tx": {
       "txid": "5954a007baf3f012af1484b42d24057f9b1541dd65003bababb1a53c9f7eabe4",
       "version": 2,
       "type": 0,
       "size": 66,
       "locktime": 0,
       "vin": [
         {
           "txid": "2662c87e1761ed5f4e98a0640b2608114d86f282824a51bd624985d236c71178",
           "vout": 0,
           "scriptSig": {
             "asm": "",
             "hex": ""
           },
           "sequence": 4294967295
         }
       ],
       "vout": [
         {
           "value": 0.00000000,
           "valueSat": 0,
           "n": 0,
           "scriptPubKey": {
             "asm": "OP_RETURN 50462976",
             "hex": "6a0400010203",
             "type": "nulldata"
           }
         }
       ]
     },
     "unknown": {
     },
     "inputs": [
       {
         "non_witness_utxo": {
           "txid": "2662c87e1761ed5f4e98a0640b2608114d86f282824a51bd624985d236c71178",
           "version": 2,
           "type": 0,
           "size": 225,
           "locktime": 542805,
           "vin": [
             {
               "txid": "427c8d2f712b72150496d53b67403a984b6fb41f37f6c0a85115d12c50b78b94",
               "vout": 1,
               "scriptSig": {
                 "asm": "304402204fe4fc488c955f286c52c848ec7950b40ec476e1b434c6add686b474bdde09a902206222d291fd9da341408aa8a4720f5a6959997715a1ddf8187e75277b6bfcae7e[ALL] 03c67d86944315838aea7ec80d390b5d09b91b62483370d4979da5ccf7a7df77a9",
                 "hex": "47304402204fe4fc488c955f286c52c848ec7950b40ec476e1b434c6add686b474bdde09a902206222d291fd9da341408aa8a4720f5a6959997715a1ddf8187e75277b6bfcae7e012103c67d86944315838aea7ec80d390b5d09b91b62483370d4979da5ccf7a7df77a9"
               },
               "sequence": 4294967294
             }
           ],
           "vout": [
             {
               "value": 1.64030388,
               "valueSat": 164030388,
               "n": 0,
               "scriptPubKey": {
                 "asm": "OP_DUP OP_HASH160 cefc464904c03814c01906e197dc759a745e47ee OP_EQUALVERIFY OP_CHECKSIG",
                 "hex": "76a914cefc464904c03814c01906e197dc759a745e47ee88ac",
                 "reqSigs": 1,
                 "type": "pubkeyhash",
                 "addresses": [
                   "yfBtG4d5ZRWXWo8JQrbVcCzpKyJRhcGyYk"
                 ]
               }
             },
             {
               "value": 10.00000000,
               "valueSat": 1000000000,
               "n": 1,
               "scriptPubKey": {
                 "asm": "OP_DUP OP_HASH160 3ef9bcbe92f77c8fadd0566eea7ff8d47f22bde0 OP_EQUALVERIFY OP_CHECKSIG",
                 "hex": "76a9143ef9bcbe92f77c8fadd0566eea7ff8d47f22bde088ac",
                 "reqSigs": 1,
                 "type": "pubkeyhash",
                 "addresses": [
                   "yS4Rv9VJnUvwcwggLzi88pu6jTPVya52Ba"
                 ]
               }
             }
           ]
         },
         "final_scriptSig": {
           "asm": "3044022005d5f8010e0d8cfd601e6136330a4122492ac3573718a1ef30c2bc3f31b760390220273a18050f61026ea3aa4d9c2c58ad51dd7f88bd64bbcc3dba769d8cd7ec09da[ALL] 0267da91139a4f14d97eaf7800ea9e7cb9ffa8fc232ece8b38a3d127891e6f71e8",
           "hex": "473044022005d5f8010e0d8cfd601e6136330a4122492ac3573718a1ef30c2bc3f31b760390220273a18050f61026ea3aa4d9c2c58ad51dd7f88bd64bbcc3dba769d8cd7ec09da01210267da91139a4f14d97eaf7800ea9e7cb9ffa8fc232ece8b38a3d127891e6f71e8"
         }
       }
     ],
     "outputs": [
       {
       }
     ],
     "fee": 1.64030388
   }

DecodeRawTransaction
====================

The ```decoderawtransaction``
RPC <core-api-ref-remote-procedure-calls-raw-transactions#decoderawtransaction>`__
decodes a serialized transaction hex string into a JSON object
describing the transaction.

*Parameter #1—serialized transaction in hex*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Serialized      | string (hex)    | R               | The transaction |
| Transaction     |                 | equired(exactly | to decode in    |
|                 |                 | 1)              | serialized      |
|                 |                 |                 | transaction     |
|                 |                 |                 | format          |
+-----------------+-----------------+-----------------+-----------------+

*Result—the decoded transaction*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An object       |
|                 |                 | equired(exactly | describing the  |
|                 |                 | 1)              | decoded         |
|                 |                 |                 | transaction, or |
|                 |                 |                 | JSON ``null``   |
|                 |                 |                 | if the          |
|                 |                 |                 | transaction     |
|                 |                 |                 | could not be    |
|                 |                 |                 | decoded         |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``txid``     | string (hex)    | R               | The             |
|                 |                 | equired(exactly | transaction’s   |
|                 |                 | 1)              | TXID encoded as |
|                 |                 |                 | hex in RPC byte |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``version``  | number (int)    | R               | The transaction |
|                 |                 | equired(exactly | format version  |
|                 |                 | 1)              | number          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``type``     | number (int)    | R               | *Added in Dash  |
|                 |                 | equired(exactly | Core            |
|                 |                 | 1)              | 0.13.0.0*\ The  |
|                 |                 |                 | transaction     |
|                 |                 |                 | format type     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``size``     | number (int)    | R               | *Added in       |
|                 |                 | equired(exactly | Bitcoin Core    |
|                 |                 | 1)              | 0.12.0*\ The    |
|                 |                 |                 | serialized      |
|                 |                 |                 | transaction     |
|                 |                 |                 | size            |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``locktime`` | number (int)    | R               | The             |
|                 |                 | equired(exactly | transaction’s   |
|                 |                 | 1)              | locktime:       |
|                 |                 |                 | either a Unix   |
|                 |                 |                 | epoch date or   |
|                 |                 |                 | block height;   |
|                 |                 |                 | see the         |
|                 |                 |                 | `locktime       |
|                 |                 |                 | parsing         |
|                 |                 |                 | rules <core     |
|                 |                 |                 | -guide-transact |
|                 |                 |                 | ions-locktime-a |
|                 |                 |                 | nd-sequence-num |
|                 |                 |                 | ber#locktime_pa |
|                 |                 |                 | rsing_rules>`__ |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``vin``      | array           | R               | An array of     |
|                 |                 | equired(exactly | objects with    |
|                 |                 | 1)              | each object     |
|                 |                 |                 | being an input  |
|                 |                 |                 | vector (vin)    |
|                 |                 |                 | for this        |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Input objects   |
|                 |                 |                 | will have the   |
|                 |                 |                 | same order      |
|                 |                 |                 | within the      |
|                 |                 |                 | array as they   |
|                 |                 |                 | have in the     |
|                 |                 |                 | transaction, so |
|                 |                 |                 | the first input |
|                 |                 |                 | listed will be  |
|                 |                 |                 | input 0         |
+-----------------+-----------------+-----------------+-----------------+
| → →Input        | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing one  |
|                 |                 |                 | of this         |
|                 |                 |                 | transaction’s   |
|                 |                 |                 | inputs. May be  |
|                 |                 |                 | a regular input |
|                 |                 |                 | or a coinbase   |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``txid`` | string          | Optional(0 or   | The TXID of the |
|                 |                 | 1)              | outpoint being  |
|                 |                 |                 | spent, encoded  |
|                 |                 |                 | as hex in RPC   |
|                 |                 |                 | byte order. Not |
|                 |                 |                 | present if this |
|                 |                 |                 | is a coinbase   |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``vout`` | number (int)    | Optional(0 or   | The output      |
|                 |                 | 1)              | index number    |
|                 |                 |                 | (vout) of the   |
|                 |                 |                 | outpoint being  |
|                 |                 |                 | spent. The      |
|                 |                 |                 | first output in |
|                 |                 |                 | a transaction   |
|                 |                 |                 | has an index of |
|                 |                 |                 | ``0``. Not      |
|                 |                 |                 | present if this |
|                 |                 |                 | is a coinbase   |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → →             | object          | Optional(0 or   | An object       |
| →               |                 | 1)              | describing the  |
| \ ``scriptSig`` |                 |                 | signature       |
|                 |                 |                 | script of this  |
|                 |                 |                 | input. Not      |
|                 |                 |                 | present if this |
|                 |                 |                 | is a coinbase   |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string          | R               | The signature   |
| →\ ``asm``      |                 | equired(exactly | script in       |
|                 |                 | 1)              | decoded form    |
|                 |                 |                 | with            |
|                 |                 |                 | n               |
|                 |                 |                 | on-data-pushing |
|                 |                 |                 | opcodes listed  |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string (hex)    | R               | The signature   |
| →\ ``hex``      |                 | equired(exactly | script encoded  |
|                 |                 | 1)              | as hex          |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string (hex)    | Optional(0 or   | The coinbase    |
| →\ ``coinbase`` |                 | 1)              | (similar to the |
|                 |                 |                 | hex field of a  |
|                 |                 |                 | scriptSig)      |
|                 |                 |                 | encoded as hex. |
|                 |                 |                 | Only present if |
|                 |                 |                 | this is a       |
|                 |                 |                 | coinbase        |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (Dash)   | O               | The number of   |
| →\ ``value``    |                 | ptional(exactly | Dash paid to    |
|                 |                 | 1)              | this output.    |
|                 |                 |                 | May be          |
|                 |                 |                 | ``0``.Only      |
|                 |                 |                 | present if      |
|                 |                 |                 | ``spentindex``  |
|                 |                 |                 | enabled         |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (duffs)  | O               | The number of   |
| →\ ``valueSat`` |                 | ptional(exactly | duffs paid to   |
|                 |                 | 1)              | this output.    |
|                 |                 |                 | May be          |
|                 |                 |                 | ``0``.Only      |
|                 |                 |                 | present if      |
|                 |                 |                 | ``spentindex``  |
|                 |                 |                 | enabled         |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string : array  | Optional(0 or   | The P2PKH or    |
| →               |                 | 1)              | P2SH addresses  |
| \ ``addresses`` |                 |                 | used in this    |
|                 |                 |                 | transaction, or |
|                 |                 |                 | the computed    |
|                 |                 |                 | P2PKH address   |
|                 |                 |                 | of any pubkeys  |
|                 |                 |                 | in this         |
|                 |                 |                 | transaction.    |
|                 |                 |                 | This array will |
|                 |                 |                 | not be returned |
|                 |                 |                 | for             |
|                 |                 |                 | ``nulldata`` or |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | script          |
|                 |                 |                 | types.Only      |
|                 |                 |                 | present if      |
|                 |                 |                 | ``spentindex``  |
|                 |                 |                 | enabled         |
+-----------------+-----------------+-----------------+-----------------+
| → → → →         | string          | Required(1 or   | A P2PKH or P2SH |
| →Address        |                 | more)           | address         |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (int)    | R               | The input       |
| →\ ``sequence`` |                 | equired(exactly | sequence number |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``vout``     | array           | R               | An array of     |
|                 |                 | equired(exactly | objects each    |
|                 |                 | 1)              | describing an   |
|                 |                 |                 | output vector   |
|                 |                 |                 | (vout) for this |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Output objects  |
|                 |                 |                 | will have the   |
|                 |                 |                 | same order      |
|                 |                 |                 | within the      |
|                 |                 |                 | array as they   |
|                 |                 |                 | have in the     |
|                 |                 |                 | transaction, so |
|                 |                 |                 | the first       |
|                 |                 |                 | output listed   |
|                 |                 |                 | will be output  |
|                 |                 |                 | 0               |
+-----------------+-----------------+-----------------+-----------------+
| → →Output       | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing one  |
|                 |                 |                 | of this         |
|                 |                 |                 | transaction’s   |
|                 |                 |                 | outputs         |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (Dash)   | R               | The number of   |
| →\ ``value``    |                 | equired(exactly | Dash paid to    |
|                 |                 | 1)              | this output.    |
|                 |                 |                 | May be ``0``    |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (duffs)  | R               | The number of   |
| →\ ``valueSat`` |                 | equired(exactly | duffs paid to   |
|                 |                 | 1)              | this output.    |
|                 |                 |                 | May be ``0``    |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``n``    | number (int)    | R               | The output      |
|                 |                 | equired(exactly | index number of |
|                 |                 | 1)              | this output     |
|                 |                 |                 | within this     |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → →             | object          | R               | An object       |
| →\ `            |                 | equired(exactly | describing the  |
| `scriptPubKey`` |                 | 1)              | pubkey script   |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string          | R               | The pubkey      |
| →\ ``asm``      |                 | equired(exactly | script in       |
|                 |                 | 1)              | decoded form    |
|                 |                 |                 | with            |
|                 |                 |                 | n               |
|                 |                 |                 | on-data-pushing |
|                 |                 |                 | opcodes listed  |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string (hex)    | R               | The pubkey      |
| →\ ``hex``      |                 | equired(exactly | script encoded  |
|                 |                 | 1)              | as hex          |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | number (int)    | Optional(0 or   | The number of   |
| →\ ``reqSigs``  |                 | 1)              | signatures      |
|                 |                 |                 | required; this  |
|                 |                 |                 | is always ``1`` |
|                 |                 |                 | for P2PK,       |
|                 |                 |                 | P2PKH, and P2SH |
|                 |                 |                 | (including P2SH |
|                 |                 |                 | multisig        |
|                 |                 |                 | because the     |
|                 |                 |                 | redeem script   |
|                 |                 |                 | is not          |
|                 |                 |                 | available in    |
|                 |                 |                 | the pubkey      |
|                 |                 |                 | script). It may |
|                 |                 |                 | be greater than |
|                 |                 |                 | 1 for bare      |
|                 |                 |                 | multisig. This  |
|                 |                 |                 | value will not  |
|                 |                 |                 | be returned for |
|                 |                 |                 | ``nulldata`` or |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | script types    |
|                 |                 |                 | (see the        |
|                 |                 |                 | ``type`` key    |
|                 |                 |                 | below)          |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string          | Optional(0 or   | The type of     |
| →\ ``type``     |                 | 1)              | script. This    |
|                 |                 |                 | will be one of  |
|                 |                 |                 | the following:• |
|                 |                 |                 | ``pubkey`` for  |
|                 |                 |                 | a P2PK script•  |
|                 |                 |                 | ``pubkeyhash``  |
|                 |                 |                 | for a P2PKH     |
|                 |                 |                 | script•         |
|                 |                 |                 | ``scripthash``  |
|                 |                 |                 | for a P2SH      |
|                 |                 |                 | script•         |
|                 |                 |                 | ``multisig``    |
|                 |                 |                 | for a bare      |
|                 |                 |                 | multisig        |
|                 |                 |                 | script•         |
|                 |                 |                 | ``nulldata``    |
|                 |                 |                 | for nulldata    |
|                 |                 |                 | scripts•        |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | for unknown     |
|                 |                 |                 | scripts         |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string : array  | Optional(0 or   | The P2PKH or    |
| →               |                 | 1)              | P2SH addresses  |
| \ ``addresses`` |                 |                 | used in this    |
|                 |                 |                 | transaction, or |
|                 |                 |                 | the computed    |
|                 |                 |                 | P2PKH address   |
|                 |                 |                 | of any pubkeys  |
|                 |                 |                 | in this         |
|                 |                 |                 | transaction.    |
|                 |                 |                 | This array will |
|                 |                 |                 | not be returned |
|                 |                 |                 | for             |
|                 |                 |                 | ``nulldata`` or |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | script types    |
+-----------------+-----------------+-----------------+-----------------+
| → → → →         | string          | Required(1 or   | A P2PKH or P2SH |
| →Address        |                 | more)           | address         |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``ext        | number (int)    | Optional(0 or   | *Added in Dash  |
| raPayloadSize`` |                 | 1)              | Core            |
|                 |                 |                 | 0.13.0.0*\ Size |
|                 |                 |                 | of the DIP2     |
|                 |                 |                 | extra payload.  |
|                 |                 |                 | Only present if |
|                 |                 |                 | it’s a DIP2     |
|                 |                 |                 | special         |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | string (hex)    | Optional(0 or   | *Added in Dash  |
| `extraPayload`` |                 | 1)              | Core            |
|                 |                 |                 | 0.13.0.0*\ Hex  |
|                 |                 |                 | encoded DIP2    |
|                 |                 |                 | extra payload   |
|                 |                 |                 | data. Only      |
|                 |                 |                 | present if it’s |
|                 |                 |                 | a DIP2 special  |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.13.0*

Decode a signed one-input, two-output transaction:

.. code:: bash

   dash-cli -testnet decoderawtransaction 02000000015d0b26079696875e9fc3cb480420aae3c8\
   b1da628fbb14cc718066df7fe7c5fd010000006a47304402202cfa683981898ad9adb89534\
   23a38f7185ed41e163aa195d608fbe5bc3034910022034e2376aaed1c6576c0dad79d626ee\
   27f706baaed86dabb105979c3e6f6e1cb9012103d14eb001cf0908f3a2333d171f6236497a\
   82318a6a6f649b4d7fd8e5c8922e08feffffff021e3f4b4c000000001976a914b02ae52066\
   542b4aec5cf45c7cae3183d7bd322788ac00f90295000000001976a914252c9de3a0ebd5c9\
   5886187b24969d4ccdb5576e88ac943d0000

Result:

.. code:: json

   {
     "txid": "f4de3be04efa18e203c9d0b7ad11bb2517f5889338918ed300a374f5bd736ed7",
     "version": 2,
     "type": 0,
     "size": 225,
     "locktime": 15764,
     "vin": [
       {
         "txid": "fdc5e77fdf668071cc14bb8f62dab1c8e3aa200448cbc39f5e87969607260b5d",
         "vout": 1,
         "scriptSig": {
           "asm": "304402202cfa683981898ad9adb8953423a38f7185ed41e163aa195d608fbe5bc3034910022034e2376aaed1c6576c0dad79d626ee27f706baaed86dabb105979c3e6f6e1cb9[ALL] 03d14eb001cf0908f3a2333d171f6236497a82318a6a6f649b4d7fd8e5c8922e08",
           "hex": "47304402202cfa683981898ad9adb8953423a38f7185ed41e163aa195d608fbe5bc3034910022034e2376aaed1c6576c0dad79d626ee27f706baaed86dabb105979c3e6f6e1cb9012103d14eb001cf0908f3a2333d171f6236497a82318a6a6f649b4d7fd8e5c8922e08"
         },
         "sequence": 4294967294
       }
     ],
     "vout": [
       {
         "value": 12.79999774,
         "valueSat": 1279999774,
         "n": 0,
         "scriptPubKey": {
           "asm": "OP_DUP OP_HASH160 b02ae52066542b4aec5cf45c7cae3183d7bd3227 OP_EQUALVERIFY OP_CHECKSIG",
           "hex": "76a914b02ae52066542b4aec5cf45c7cae3183d7bd322788ac",
           "reqSigs": 1,
           "type": "pubkeyhash",
           "addresses": [
             "ycNwAN4DQ7Xnw5XLKg84SR4U1GE22FfLNQ"
           ]
         }
       },
       {
         "value": 25.00000000,
         "valueSat": 2500000000,
         "n": 1,
         "scriptPubKey": {
           "asm": "OP_DUP OP_HASH160 252c9de3a0ebd5c95886187b24969d4ccdb5576e OP_EQUALVERIFY OP_CHECKSIG",
           "hex": "76a914252c9de3a0ebd5c95886187b24969d4ccdb5576e88ac",
           "reqSigs": 1,
           "type": "pubkeyhash",
           "addresses": [
             "yPi1JKw5fn8bMFsCCtnkGagogW6GXwGktZ"
           ]
         }
       }
     ]
   }

Decode a coinbase special transaction (CbTx):

.. code:: bash

   dash-cli -testnet decoderawtransaction 03000500010000000000000000000000000000000000\
   000000000000000000000000000000ffffffff2703ae50011a4d696e656420627920416e74\
   506f6f6c2021000b01201da9196f0000000007000000ffffffff02809e4730000000001976\
   a914cbd7bfcc50351180132b2c0698cb90ad74c473c788ac809e4730000000001976a91488\
   a060bc2dfe05780ae4dcb6c98b12436c35a93988ac00000000460200ae50010078e5c08b39\
   960887bf95185c381bdb719e60b6925fa12af78a8824fade927387c757acb6bac63da84f92\
   45e20cfd5d830382ac634d434725ca6349ab5db920a3

Result:

.. code:: json

   {
     "txid": "25632685ed0d7286901a80961c924c1ddd952e764754dbd8b40d0956413c8b56",
     "version": 3,
     "type": 5,
     "size": 229,
     "locktime": 0,
     "vin": [
       {
         "coinbase": "03ae50011a4d696e656420627920416e74506f6f6c2021000b01201da9196f0000000007000000",
         "sequence": 4294967295
       }
     ],
     "vout": [
       {
         "value": 8.10000000,
         "valueSat": 810000000,
         "n": 0,
         "scriptPubKey": {
           "asm": "OP_DUP OP_HASH160 cbd7bfcc50351180132b2c0698cb90ad74c473c7 OP_EQUALVERIFY OP_CHECKSIG",
           "hex": "76a914cbd7bfcc50351180132b2c0698cb90ad74c473c788ac",
           "reqSigs": 1,
           "type": "pubkeyhash",
           "addresses": [
             "yeuGUfPMrbEqAS2Pw1wonYgEPbM4LAA9LK"
           ]
         }
       },
       {
         "value": 8.10000000,
         "valueSat": 810000000,
         "n": 1,
         "scriptPubKey": {
           "asm": "OP_DUP OP_HASH160 88a060bc2dfe05780ae4dcb6c98b12436c35a939 OP_EQUALVERIFY OP_CHECKSIG",
           "hex": "76a91488a060bc2dfe05780ae4dcb6c98b12436c35a93988ac",
           "reqSigs": 1,
           "type": "pubkeyhash",
           "addresses": [
             "yYmrsYP3XYMZr1cGtha3QzmuNB1C7CfyhV"
           ]
         }
       }
     ],
     "extraPayloadSize": 70,
     "extraPayload": "0200ae50010078e5c08b39960887bf95185c381bdb719e60b6925fa12af78a8824fade927387c757acb6bac63da84f9245e20cfd5d830382ac634d434725ca6349ab5db920a3",
     "cbTx": {
       "version": 2,
       "height": 86190,
       "merkleRootMNList": "877392defa24888af72aa15f92b6609e71db1b385c1895bf870896398bc0e578",
       "merkleRootQuorums": "a320b95dab4963ca2547434d63ac8203835dfd0ce245924fa83dc6bab6ac57c7"
     }
   }

*See also*

-  `CombineRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#combinerawtransaction>`__:
   combine multiple partially signed transactions into one transaction.
-  `CreateRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#createrawtransaction>`__:
   creates an unsigned serialized transaction that spends a previous
   output to a new output with a P2PKH or P2SH address. The transaction
   is not stored in the wallet or transmitted to the network.
-  `SignRawTransactionWithKey <#signrawtransactionwithkey>`__: signs
   inputs for a transaction in the serialized transaction format using
   private keys provided in the call.
-  `SendRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#sendrawtransaction>`__:
   validates a transaction and broadcasts it to the peer-to-peer
   network.

DecodeScript
============

The ```decodescript``
RPC <core-api-ref-remote-procedure-calls-raw-transactions#decodescript>`__
decodes a hex-encoded P2SH redeem script.

*Parameter #1—a hex-encoded redeem script*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Redeem Script   | string (hex)    | R               | The redeem      |
|                 |                 | equired(exactly | script to       |
|                 |                 | 1)              | decode as a     |
|                 |                 |                 | hex-encoded     |
|                 |                 |                 | serialized      |
|                 |                 |                 | script          |
+-----------------+-----------------+-----------------+-----------------+

*Result—the decoded script*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An object       |
|                 |                 | equired(exactly | describing the  |
|                 |                 | 1)              | decoded script, |
|                 |                 |                 | or JSON         |
|                 |                 |                 | ``null`` if the |
|                 |                 |                 | script could    |
|                 |                 |                 | not be decoded  |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``asm``      | string          | R               | The redeem      |
|                 |                 | equired(exactly | script in       |
|                 |                 | 1)              | decoded form    |
|                 |                 |                 | with            |
|                 |                 |                 | n               |
|                 |                 |                 | on-data-pushing |
|                 |                 |                 | opcodes listed. |
|                 |                 |                 | May be empty    |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``reqSigs``  | number (int)    | Optional(0 or   | The number of   |
|                 |                 | 1)              | signatures      |
|                 |                 |                 | required; this  |
|                 |                 |                 | is always ``1`` |
|                 |                 |                 | for P2PK or     |
|                 |                 |                 | P2PKH within    |
|                 |                 |                 | P2SH. It may be |
|                 |                 |                 | greater than 1  |
|                 |                 |                 | for P2SH        |
|                 |                 |                 | multisig. This  |
|                 |                 |                 | value will not  |
|                 |                 |                 | be returned for |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | script types    |
|                 |                 |                 | (see the        |
|                 |                 |                 | ``type`` key    |
|                 |                 |                 | above)          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``type``     | string          | Optional(0 or   | The type of     |
|                 |                 | 1)              | script. This    |
|                 |                 |                 | will be one of  |
|                 |                 |                 | the following:• |
|                 |                 |                 | ``pubkey`` for  |
|                 |                 |                 | a P2PK script   |
|                 |                 |                 | inside P2SH•    |
|                 |                 |                 | ``pubkeyhash``  |
|                 |                 |                 | for a P2PKH     |
|                 |                 |                 | script inside   |
|                 |                 |                 | P2SH•           |
|                 |                 |                 | ``multisig``    |
|                 |                 |                 | for a multisig  |
|                 |                 |                 | script inside   |
|                 |                 |                 | P2SH•           |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | for unknown     |
|                 |                 |                 | scripts         |
+-----------------+-----------------+-----------------+-----------------+
| →               | array           | Optional(0 or   | A P2PKH         |
| \ ``addresses`` |                 | 1)              | addresses used  |
|                 |                 |                 | in this script, |
|                 |                 |                 | or the computed |
|                 |                 |                 | P2PKH addresses |
|                 |                 |                 | of any pubkeys  |
|                 |                 |                 | in this script. |
|                 |                 |                 | This array will |
|                 |                 |                 | not be returned |
|                 |                 |                 | for             |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | script types    |
+-----------------+-----------------+-----------------+-----------------+
| → →Address      | string          | Required(1 or   | A P2PKH address |
|                 |                 | more)           |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``p2sh``     | string (hex)    | R               | The P2SH        |
|                 |                 | equired(exactly | address of this |
|                 |                 | 1)              | redeem script   |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

A 2-of-3 P2SH multisig pubkey script:

.. code:: bash

   dash-cli -testnet decodescript 522102eacba539d92eb88d4e73bb32\
   749d79f53f6e8d7947ac40a71bd4b26c13b6ec29210311f97539724e0de38fb1\
   ff79f5148e5202459d06ed07193ab18c730274fd0d882103251f25a5c0291446\
   d801ba6df122f67a7dd06c60a9b332b7b29cc94f3b8f57d053ae

Result:

.. code:: json

   {
     "asm": "2 02eacba539d92eb88d4e73bb32749d79f53f6e8d7947ac40a71bd4b26c13b6ec29 0311f97539724e0de38fb1ff79f5148e5202459d06ed07193ab18c730274fd0d88 03251f25a5c0291446d801ba6df122f67a7dd06c60a9b332b7b29cc94f3b8f57d0 3 OP_CHECKMULTISIG",
     "reqSigs": 2,
     "type": "multisig",
     "addresses": [
       "yNpezfFDfoikDuT1f4iK75AiLp2YLPsGAb",
       "yWAk1cDVvsRdPYjnzcFkySJux75yaCE7xz",
       "yVJj7TB3ZhMcSP2wo65ZFNqy23BQH9tT87"
     ],
     "p2sh": "8uJLxDxk2gEMbidF5vT8XLS2UCgQmVcroW"
   }

*See also*

-  `CreateMultiSig </docs/core-api-ref-remote-procedure-calls-util#createmultisig>`__:
   creates a P2SH multi-signature address.

FinalizePSBT
============

The ```finalizepsbt``
RPC <core-api-ref-remote-procedure-calls-raw-transactions#finalizepsbt>`__
finalizes the inputs of a PSBT. The PSBT produces a network serialized
transaction if the transaction is fully signed. This can broadcast with
``sendrawtransaction``. Otherwise, a PSBT will be created which has the
``final_scriptSig`` fields filled for inputs that are complete.
Implements the Finalizer and Extractor roles.

*Parameter #1—psbt*

==== ====== ======== =========================
Name Type   Presence Description
==== ====== ======== =========================
psbt string Required A base64 string of a PSBT
==== ====== ======== =========================

*Parameter #2—extract*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| data            | bool            | Optional        | If true, and    |
|                 |                 |                 | the transaction |
|                 |                 |                 | is complete,    |
|                 |                 |                 | extract and     |
|                 |                 |                 | return the      |
|                 |                 |                 | complete        |
|                 |                 |                 | transaction in  |
|                 |                 |                 | normal network  |
|                 |                 |                 | serialization   |
|                 |                 |                 | instead of the  |
|                 |                 |                 | PSBT.           |
+-----------------+-----------------+-----------------+-----------------+

*Result—psbt*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| → psbt          | string          | R               | The             |
|                 |                 | equired(Exactly | base64-encoded  |
|                 |                 | 1)              | partially       |
|                 |                 |                 | signed          |
|                 |                 |                 | transaction if  |
|                 |                 |                 | not extracted   |
+-----------------+-----------------+-----------------+-----------------+
| → hex           | string (hex)    | R               | The hex-encoded |
|                 |                 | equired(Exactly | network         |
|                 |                 | 1)              | transaction if  |
|                 |                 |                 | extracted       |
+-----------------+-----------------+-----------------+-----------------+
| → complete      | bool            | R               | If the          |
|                 |                 | equired(Exactly | transaction has |
|                 |                 | 1)              | a complete set  |
|                 |                 |                 | of signatures   |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

.. code:: bash

   dash-cli -testnet finalizepsbt cHNidP8BAEICAAAAAXgRxzbShUlivVFKgoLyhk0RCCYLZKCYTl/tYRd+yGImAAAAAAD/////AQAAAAAAAAAABmoEAAECAwAAAAAAAQDhAgAAAAGUi7dQLNEVUajA9jcftG9LmDpAZzvVlgQVcitxL418QgEAAABqRzBEAiBP5PxIjJVfKGxSyEjseVC0DsR24bQ0xq3WhrR0vd4JqQIgYiLSkf2do0FAiqikcg9aaVmZdxWh3fgYfnUne2v8rn4BIQPGfYaUQxWDiup+yA05C10JuRtiSDNw1Jedpcz3p993qf7///8CtOfGCQAAAAAZdqkUzvxGSQTAOBTAGQbhl9x1mnReR+6IrADKmjsAAAAAGXapFD75vL6S93yPrdBWbup/+NR/Ir3giKxVSAgAAQdqRzBEAiAF1fgBDg2M/WAeYTYzCkEiSSrDVzcYoe8wwrw/MbdgOQIgJzoYBQ9hAm6jqk2cLFitUd1/iL1ku8w9unadjNfsCdoBIQJn2pETmk8U2X6veADqnny5/6j8Iy7Oizij0SeJHm9x6AAA

Result:

.. code:: json

   {
     "hex": "02000000017811c736d2854962bd514a8282f2864d1108260b64a0984e5fed61177ec86226000000006a473044022005d5f8010e0d8cfd601e6136330a4122492ac3573718a1ef30c2bc3f31b760390220273a18050f61026ea3aa4d9c2c58ad51dd7f88bd64bbcc3dba769d8cd7ec09da01210267da91139a4f14d97eaf7800ea9e7cb9ffa8fc232ece8b38a3d127891e6f71e8ffffffff010000000000000000066a040001020300000000",
     "complete": true
   }

*See also:*

-  `CreatePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#createpsbt>`__:
   creates a transaction in the Partially Signed Transaction (PST)
   format.
-  `CombinePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#combinepsbt>`__:
   combine multiple partially-signed Dash transactions into one
   transaction.
-  `ConvertToPSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#converttopsbt>`__:
   converts a network serialized transaction to a PSBT.
-  `DecodePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#decodepsbt>`__:
   returns a JSON object representing the serialized, base64-encoded
   partially signed Dash transaction.
-  `WalletCreateFundedPSBT </docs/core-api-ref-remote-procedure-calls-wallet#walletcreatefundedpsbt>`__:
   creates and funds a transaction in the Partially Signed Transaction
   (PST) format.
-  `WalletProcessPSBT </docs/core-api-ref-remote-procedure-calls-wallet#walletprocesspsbt>`__:
   updates a PSBT with input information from a wallet and then allows
   the signing of inputs.

FundRawTransaction
==================

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block]

The ```fundrawtransaction``
RPC <core-api-ref-remote-procedure-calls-raw-transactions#fundrawtransaction>`__
adds inputs to a transaction until it has enough in value to meet its
out value. This will not modify existing inputs, and will add one change
output to the outputs. Note that inputs which were signed may need to be
resigned after completion since in/outputs have been added. The inputs
added will not be signed, use signrawtransaction for that. All existing
inputs must have their previous output transaction be in the wallet.

*Parameter #1—The hex string of the raw transaction*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Hex string      | string (hex)    | R               | The hex string  |
|                 |                 | equired(exactly | of the raw      |
|                 |                 | 1)              | transaction     |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—Additional options*

Note: For backwards compatibility, passing in a ``true`` instead of an
object will result in ``{"includeWatching": true}``.

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Options         | Object          | Optional(0 or   | Additional      |
|                 |                 | 1)              | options         |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | Optional(0 or   | The address to  |
| \ ``            |                 | 1)              | receive the     |
| changeAddress`` |                 |                 | change. If not  |
|                 |                 |                 | set, the        |
|                 |                 |                 | address is      |
|                 |                 |                 | chosen from     |
|                 |                 |                 | address pool    |
+-----------------+-----------------+-----------------+-----------------+
| →               | nummeric (int)  | Optional(0 or   | The index of    |
| \ ``c           |                 | 1)              | the change      |
| hangePosition`` |                 |                 | output. If not  |
|                 |                 |                 | set, the change |
|                 |                 |                 | position is     |
|                 |                 |                 | randomly chosen |
+-----------------+-----------------+-----------------+-----------------+
| ``in            | bool            | Optional(0 or   | Inputs from     |
| cludeWatching`` |                 | 1)              | watch-only      |
|                 |                 |                 | addresses are   |
|                 |                 |                 | also            |
|                 |                 |                 | considered. The |
|                 |                 |                 | default is      |
|                 |                 |                 | ``false``       |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | Optional(0 or   | The selected    |
| \               |                 | 1)              | outputs are     |
| ``lockUnspent`` |                 |                 | locked after    |
|                 |                 |                 | running the rpc |
|                 |                 |                 | call. The       |
|                 |                 |                 | default is      |
|                 |                 |                 | ``false``       |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | Optional(0 or   | **Removed in    |
| \ ``res         |                 | 1)              | Dash Core       |
| erveChangeKey`` |                 |                 | 0.17.0**        |
+-----------------+-----------------+-----------------+-----------------+
| → \ ``feeRate`` | numeric         | Optional(0 or   | The specific    |
|                 | (bitcoins)      | 1)              | feerate you are |
|                 |                 |                 | willing to pay  |
|                 |                 |                 | (BTC per KB).   |
|                 |                 |                 | If not set, the |
|                 |                 |                 | wallet          |
|                 |                 |                 | determines the  |
|                 |                 |                 | fee             |
+-----------------+-----------------+-----------------+-----------------+
| →               | array           | Optional(0 or   | A json array of |
| \ ``subtractF   |                 | 1)              | integers. The   |
| eeFromOutputs`` |                 |                 | fee will be     |
|                 |                 |                 | equally         |
|                 |                 |                 | deducted from   |
|                 |                 |                 | the amount of   |
|                 |                 |                 | each specified  |
|                 |                 |                 | output. The     |
|                 |                 |                 | outputs are     |
|                 |                 |                 | specified by    |
|                 |                 |                 | their           |
|                 |                 |                 | zero-based      |
|                 |                 |                 | index, before   |
|                 |                 |                 | any change      |
|                 |                 |                 | output is       |
|                 |                 |                 | added.          |
+-----------------+-----------------+-----------------+-----------------+
| → →Output index | numeric (int)   | Optional(0 or   | A output index  |
|                 |                 | more)           | number (vout)   |
|                 |                 |                 | from which the  |
|                 |                 |                 | fee should be   |
|                 |                 |                 | subtracted. If  |
|                 |                 |                 | multiple vouts  |
|                 |                 |                 | are provided,   |
|                 |                 |                 | the total fee   |
|                 |                 |                 | will be divided |
|                 |                 |                 | by the number   |
|                 |                 |                 | of vouts listed |
|                 |                 |                 | and each vout   |
|                 |                 |                 | will have that  |
|                 |                 |                 | amount          |
|                 |                 |                 | subtracted from |
|                 |                 |                 | it.             |
+-----------------+-----------------+-----------------+-----------------+

*Result—information about the created transaction*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An object       |
|                 |                 | equired(exactly | including       |
|                 |                 | 1)              | information     |
|                 |                 |                 | about the       |
|                 |                 |                 | created         |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → hex           | string (hex)    | R               | The resulting   |
|                 |                 | equired(Exactly | unsigned raw    |
|                 |                 | 1)              | transaction in  |
|                 |                 |                 | serialized      |
|                 |                 |                 | transaction     |
|                 |                 |                 | format encoded  |
|                 |                 |                 | as hex          |
+-----------------+-----------------+-----------------+-----------------+
| → fee           | numeric         | R               | Fee in BTC the  |
|                 | (bitcoins)      | equired(Exactly | resulting       |
|                 |                 | 1)              | transaction     |
|                 |                 |                 | pays            |
+-----------------+-----------------+-----------------+-----------------+
| → changepos     | numeric (int)   | R               | The position of |
|                 |                 | equired(Exactly | the added       |
|                 |                 | 1)              | change output,  |
|                 |                 |                 | or ``-1`` if no |
|                 |                 |                 | change output   |
|                 |                 |                 | was added       |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet fundrawtransaction 01000000000100205fa012000000\
   1976a914485485425fa99504ec1638ac4213f3cfc9f32ef388ac00000000

Result:

.. code:: text

   {
     "hex": "01000000016b490886c0198b028c6c5cb145c4eb3b1055a224a7a105aadeff41b69ec91e060100000000feffffff023e1207bf010000001976a914bd652a167e7ad674f7815dc549bea9c57a7f919b88ac00205fa0120000001976a914485485425fa99504ec1638ac4213f3cfc9f32ef388ac00000000",
     "changepos": 0,
     "fee": 0.00000226
   }

*See also*

-  `CreateRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#createrawtransaction>`__:
   creates an unsigned serialized transaction that spends a previous
   output to a new output with a P2PKH or P2SH address. The transaction
   is not stored in the wallet or transmitted to the network.
-  `DecodeRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#decoderawtransaction>`__:
   decodes a serialized transaction hex string into a JSON object
   describing the transaction.
-  `SignRawTransactionWithKey <#signrawtransactionwithkey>`__: signs
   inputs for a transaction in the serialized transaction format using
   private keys provided in the call.
-  `SendRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#sendrawtransaction>`__:
   validates a transaction and broadcasts it to the peer-to-peer
   network.
-  `Serialized Transaction
   Format <core-ref-transactions-raw-transaction-format>`__

﻿

GetRawTransaction
=================

The ```getrawtransaction``
RPC <core-api-ref-remote-procedure-calls-raw-transactions#getrawtransaction>`__
gets a hex-encoded serialized transaction or a JSON object describing
the transaction. By default, Dash Core only stores complete transaction
data for UTXOs and your own transactions, so the RPC may fail on
historic transactions unless you use the non-default ``txindex=1`` in
your Dash Core startup settings.

Note: By default this function only works for mempool transactions. When
called with a blockhash argument, getrawtransaction will return the
transaction if the specified block is available and the transaction is
found in that block. When called without a blockhash argument,
getrawtransaction will return the transaction if it is in the mempool,
or if -txindex is enabled and the transaction is in a block in the
blockchain.

As of Dash Core 18.0.0, transactions with unspent outputs will no longer
be included unless -txindex is enabled. [block:callout] { “type”:
“warning”, “title”: “Reindex note”, “body”: “If you begin using
``txindex=1`` after downloading the block chain, you must rebuild your
indexes by starting Dash Core with the option ``-reindex``. This may
take several hours to complete, during which time your node will not
process new blocks or transactions. This reindex only needs to be done
once.” } [/block]

*Parameter #1—the TXID of the transaction to get*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| TXID            | string (hex)    | R               | The TXID of the |
|                 |                 | equired(exactly | transaction to  |
|                 |                 | 1)              | get, encoded as |
|                 |                 |                 | hex in RPC byte |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—whether to get the serialized or decoded transaction*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Verbose         | bool            | Optional(0 or   | *Updated in     |
|                 |                 | 1)              | Dash Core       |
|                 |                 |                 | 0.12.3 /        |
|                 |                 |                 | Bitcoin Core    |
|                 |                 |                 | 0.14.0*\ Set to |
|                 |                 |                 | ``false`` (the  |
|                 |                 |                 | default) to     |
|                 |                 |                 | return the      |
|                 |                 |                 | serialized      |
|                 |                 |                 | transaction as  |
|                 |                 |                 | hex. Set to     |
|                 |                 |                 | ``true`` to     |
|                 |                 |                 | return a        |
|                 |                 |                 | decoded         |
|                 |                 |                 | transaction in  |
|                 |                 |                 | JSON. Before    |
|                 |                 |                 | 0.12.3, use     |
|                 |                 |                 | ``0`` and       |
|                 |                 |                 | ``1``,          |
|                 |                 |                 | respectively    |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—hash of a block to look in for the transaction*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Block Hash      | bool            | Optional(0 or   | *Added in Dash  |
|                 |                 | 1)              | Core            |
|                 |                 |                 | 0.16.0*\ The    |
|                 |                 |                 | hash of the     |
|                 |                 |                 | block in which  |
|                 |                 |                 | to look for the |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+

*Result (if transaction not found)—``null``*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | null            | R               | If the          |
|                 |                 | equired(exactly | transaction     |
|                 |                 | 1)              | wasn’t found,   |
|                 |                 |                 | the result will |
|                 |                 |                 | be JSON         |
|                 |                 |                 | ``null``. This  |
|                 |                 |                 | can occur       |
|                 |                 |                 | because the     |
|                 |                 |                 | transaction     |
|                 |                 |                 | doesn’t exist   |
|                 |                 |                 | in the block    |
|                 |                 |                 | chain or memory |
|                 |                 |                 | pool, or        |
|                 |                 |                 | because it      |
|                 |                 |                 | isn’t part of   |
|                 |                 |                 | the transaction |
|                 |                 |                 | index. See the  |
|                 |                 |                 | Dash Core       |
|                 |                 |                 | ``-help`` entry |
|                 |                 |                 | for             |
|                 |                 |                 | ``-txindex``    |
+-----------------+-----------------+-----------------+-----------------+

*Result (if verbose=\ ``false``)—the serialized transaction*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | string (hex)    | R               | If the          |
|                 |                 | equired(exactly | transaction was |
|                 |                 | 1)              | found, this     |
|                 |                 |                 | will be the     |
|                 |                 |                 | serialized      |
|                 |                 |                 | transaction     |
|                 |                 |                 | encoded as hex  |
+-----------------+-----------------+-----------------+-----------------+

*Result (if verbose=\ ``true``)—the decoded transaction*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | If the          |
|                 |                 | equired(exactly | transaction was |
|                 |                 | 1)              | found, this     |
|                 |                 |                 | will be an      |
|                 |                 |                 | object          |
|                 |                 |                 | describing it   |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``in         | bool            | R               | ) Whether       |
| _active_chain`` |                 | equired(exactly | specified block |
|                 |                 | 1)              | is in the       |
|                 |                 |                 | active chain or |
|                 |                 |                 | not (only       |
|                 |                 |                 | present with    |
|                 |                 |                 | explicit        |
|                 |                 |                 | ``blockhash``   |
|                 |                 |                 | argument)       |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``txid``     | string (hex)    | R               | The             |
|                 |                 | equired(exactly | transaction’s   |
|                 |                 | 1)              | TXID encoded as |
|                 |                 |                 | hex in RPC byte |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``size``     | number (int)    | R               | *Added in       |
|                 |                 | equired(exactly | Bitcoin Core    |
|                 |                 | 1)              | 0.12.0*\ The    |
|                 |                 |                 | serialized      |
|                 |                 |                 | transaction     |
|                 |                 |                 | size            |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``version``  | number (int)    | R               | The transaction |
|                 |                 | equired(exactly | format version  |
|                 |                 | 1)              | number          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``type``     | number (int)    | R               | *Added in Dash  |
|                 |                 | equired(exactly | Core            |
|                 |                 | 1)              | 0.13.0.0*\ The  |
|                 |                 |                 | transaction     |
|                 |                 |                 | format type     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``locktime`` | number (int)    | R               | The             |
|                 |                 | equired(exactly | transaction’s   |
|                 |                 | 1)              | locktime:       |
|                 |                 |                 | either a Unix   |
|                 |                 |                 | epoch date or   |
|                 |                 |                 | block height;   |
|                 |                 |                 | see the         |
|                 |                 |                 | `locktime       |
|                 |                 |                 | parsing         |
|                 |                 |                 | rules <core     |
|                 |                 |                 | -guide-transact |
|                 |                 |                 | ions-locktime-a |
|                 |                 |                 | nd-sequence-num |
|                 |                 |                 | ber#locktime_pa |
|                 |                 |                 | rsing_rules>`__ |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``vin``      | array           | R               | An array of     |
|                 |                 | equired(exactly | objects with    |
|                 |                 | 1)              | each object     |
|                 |                 |                 | being an input  |
|                 |                 |                 | vector (vin)    |
|                 |                 |                 | for this        |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Input objects   |
|                 |                 |                 | will have the   |
|                 |                 |                 | same order      |
|                 |                 |                 | within the      |
|                 |                 |                 | array as they   |
|                 |                 |                 | have in the     |
|                 |                 |                 | transaction, so |
|                 |                 |                 | the first input |
|                 |                 |                 | listed will be  |
|                 |                 |                 | input 0         |
+-----------------+-----------------+-----------------+-----------------+
| → →Input        | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing one  |
|                 |                 |                 | of this         |
|                 |                 |                 | transaction’s   |
|                 |                 |                 | inputs. May be  |
|                 |                 |                 | a regular input |
|                 |                 |                 | or a coinbase   |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``txid`` | string          | Optional(0 or   | The TXID of the |
|                 |                 | 1)              | outpoint being  |
|                 |                 |                 | spent, encoded  |
|                 |                 |                 | as hex in RPC   |
|                 |                 |                 | byte order. Not |
|                 |                 |                 | present if this |
|                 |                 |                 | is a coinbase   |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``vout`` | number (int)    | Optional(0 or   | The output      |
|                 |                 | 1)              | index number    |
|                 |                 |                 | (vout) of the   |
|                 |                 |                 | outpoint being  |
|                 |                 |                 | spent. The      |
|                 |                 |                 | first output in |
|                 |                 |                 | a transaction   |
|                 |                 |                 | has an index of |
|                 |                 |                 | ``0``. Not      |
|                 |                 |                 | present if this |
|                 |                 |                 | is a coinbase   |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → →             | object          | Optional(0 or   | An object       |
| →               |                 | 1)              | describing the  |
| \ ``scriptSig`` |                 |                 | signature       |
|                 |                 |                 | script of this  |
|                 |                 |                 | input. Not      |
|                 |                 |                 | present if this |
|                 |                 |                 | is a coinbase   |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string          | R               | The signature   |
| →\ ``asm``      |                 | equired(exactly | script in       |
|                 |                 | 1)              | decoded form    |
|                 |                 |                 | with            |
|                 |                 |                 | n               |
|                 |                 |                 | on-data-pushing |
|                 |                 |                 | opcodes listed  |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string (hex)    | R               | The signature   |
| →\ ``hex``      |                 | equired(exactly | script encoded  |
|                 |                 | 1)              | as hex          |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string (hex)    | Optional(0 or   | The coinbase    |
| →\ ``coinbase`` |                 | 1)              | (similar to the |
|                 |                 |                 | hex field of a  |
|                 |                 |                 | scriptSig)      |
|                 |                 |                 | encoded as hex. |
|                 |                 |                 | Only present if |
|                 |                 |                 | this is a       |
|                 |                 |                 | coinbase        |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (Dash)   | O               | The number of   |
| →\ ``value``    |                 | ptional(exactly | Dash paid to    |
|                 |                 | 1)              | this output.    |
|                 |                 |                 | May be          |
|                 |                 |                 | ``0``.Only      |
|                 |                 |                 | present if      |
|                 |                 |                 | ``spentindex``  |
|                 |                 |                 | enabled         |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (duffs)  | O               | The number of   |
| →\ ``valueSat`` |                 | ptional(exactly | duffs paid to   |
|                 |                 | 1)              | this output.    |
|                 |                 |                 | May be          |
|                 |                 |                 | ``0``.Only      |
|                 |                 |                 | present if      |
|                 |                 |                 | ``spentindex``  |
|                 |                 |                 | enabled         |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string : array  | Optional(0 or   | The P2PKH or    |
| →               |                 | 1)              | P2SH addresses  |
| \ ``addresses`` |                 |                 | used in this    |
|                 |                 |                 | transaction, or |
|                 |                 |                 | the computed    |
|                 |                 |                 | P2PKH address   |
|                 |                 |                 | of any pubkeys  |
|                 |                 |                 | in this         |
|                 |                 |                 | transaction.    |
|                 |                 |                 | This array will |
|                 |                 |                 | not be returned |
|                 |                 |                 | for             |
|                 |                 |                 | ``nulldata`` or |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | script          |
|                 |                 |                 | types.Only      |
|                 |                 |                 | present if      |
|                 |                 |                 | ``spentindex``  |
|                 |                 |                 | enabled         |
+-----------------+-----------------+-----------------+-----------------+
| → → → →         | string          | Required(1 or   | A P2PKH or P2SH |
| →Address        |                 | more)           | address         |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (int)    | R               | The input       |
| →\ ``sequence`` |                 | equired(exactly | sequence number |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``vout``     | array           | R               | An array of     |
|                 |                 | equired(exactly | objects each    |
|                 |                 | 1)              | describing an   |
|                 |                 |                 | output vector   |
|                 |                 |                 | (vout) for this |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Output objects  |
|                 |                 |                 | will have the   |
|                 |                 |                 | same order      |
|                 |                 |                 | within the      |
|                 |                 |                 | array as they   |
|                 |                 |                 | have in the     |
|                 |                 |                 | transaction, so |
|                 |                 |                 | the first       |
|                 |                 |                 | output listed   |
|                 |                 |                 | will be output  |
|                 |                 |                 | 0               |
+-----------------+-----------------+-----------------+-----------------+
| → →Output       | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing one  |
|                 |                 |                 | of this         |
|                 |                 |                 | transaction’s   |
|                 |                 |                 | outputs         |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (Dash)   | R               | The number of   |
| →\ ``value``    |                 | equired(exactly | Dash paid to    |
|                 |                 | 1)              | this output.    |
|                 |                 |                 | May be ``0``    |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (duffs)  | R               | The number of   |
| →\ ``valueSat`` |                 | equired(exactly | duffs paid to   |
|                 |                 | 1)              | this output.    |
|                 |                 |                 | May be ``0``    |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``n``    | number (int)    | R               | The output      |
|                 |                 | equired(exactly | index number of |
|                 |                 | 1)              | this output     |
|                 |                 |                 | within this     |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → →             | object          | R               | An object       |
| →\ `            |                 | equired(exactly | describing the  |
| `scriptPubKey`` |                 | 1)              | pubkey script   |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string          | R               | The pubkey      |
| →\ ``asm``      |                 | equired(exactly | script in       |
|                 |                 | 1)              | decoded form    |
|                 |                 |                 | with            |
|                 |                 |                 | n               |
|                 |                 |                 | on-data-pushing |
|                 |                 |                 | opcodes listed  |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string (hex)    | R               | The pubkey      |
| →\ ``hex``      |                 | equired(exactly | script encoded  |
|                 |                 | 1)              | as hex          |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | number (int)    | Optional(0 or   | The number of   |
| →\ ``reqSigs``  |                 | 1)              | signatures      |
|                 |                 |                 | required; this  |
|                 |                 |                 | is always ``1`` |
|                 |                 |                 | for P2PK,       |
|                 |                 |                 | P2PKH, and P2SH |
|                 |                 |                 | (including P2SH |
|                 |                 |                 | multisig        |
|                 |                 |                 | because the     |
|                 |                 |                 | redeem script   |
|                 |                 |                 | is not          |
|                 |                 |                 | available in    |
|                 |                 |                 | the pubkey      |
|                 |                 |                 | script). It may |
|                 |                 |                 | be greater than |
|                 |                 |                 | 1 for bare      |
|                 |                 |                 | multisig. This  |
|                 |                 |                 | value will not  |
|                 |                 |                 | be returned for |
|                 |                 |                 | ``nulldata`` or |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | script types    |
|                 |                 |                 | (see the        |
|                 |                 |                 | ``type`` key    |
|                 |                 |                 | below)          |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string          | Optional(0 or   | The type of     |
| →\ ``type``     |                 | 1)              | script. This    |
|                 |                 |                 | will be one of  |
|                 |                 |                 | the following:• |
|                 |                 |                 | ``pubkey`` for  |
|                 |                 |                 | a P2PK script•  |
|                 |                 |                 | ``pubkeyhash``  |
|                 |                 |                 | for a P2PKH     |
|                 |                 |                 | script•         |
|                 |                 |                 | ``scripthash``  |
|                 |                 |                 | for a P2SH      |
|                 |                 |                 | script•         |
|                 |                 |                 | ``multisig``    |
|                 |                 |                 | for a bare      |
|                 |                 |                 | multisig        |
|                 |                 |                 | script•         |
|                 |                 |                 | ``nulldata``    |
|                 |                 |                 | for nulldata    |
|                 |                 |                 | scripts•        |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | for unknown     |
|                 |                 |                 | scripts         |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string : array  | Optional(0 or   | The P2PKH or    |
| →               |                 | 1)              | P2SH addresses  |
| \ ``addresses`` |                 |                 | used in this    |
|                 |                 |                 | transaction, or |
|                 |                 |                 | the computed    |
|                 |                 |                 | P2PKH address   |
|                 |                 |                 | of any pubkeys  |
|                 |                 |                 | in this         |
|                 |                 |                 | transaction.    |
|                 |                 |                 | This array will |
|                 |                 |                 | not be returned |
|                 |                 |                 | for             |
|                 |                 |                 | ``nulldata`` or |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | script types    |
+-----------------+-----------------+-----------------+-----------------+
| → → → →         | string          | Required(1 or   | A P2PKH or P2SH |
| →Address        |                 | more)           | address         |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``ext        | number (int)    | Optional(0 or   | *Added in Dash  |
| raPayloadSize`` |                 | 1)              | Core            |
|                 |                 |                 | 0.13.0.0*\ Size |
|                 |                 |                 | of the DIP2     |
|                 |                 |                 | extra payload.  |
|                 |                 |                 | Only present if |
|                 |                 |                 | it’s a DIP2     |
|                 |                 |                 | special         |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | string (hex)    | Optional(0 or   | *Added in Dash  |
| `extraPayload`` |                 | 1)              | Core            |
|                 |                 |                 | 0.13.0.0*\ Hex  |
|                 |                 |                 | encoded DIP2    |
|                 |                 |                 | extra payload   |
|                 |                 |                 | data. Only      |
|                 |                 |                 | present if it’s |
|                 |                 |                 | a DIP2 special  |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``hex``      | string (hex)    | R               | The serialized, |
|                 |                 | equired(exactly | hex-encoded     |
|                 |                 | 1)              | data for the    |
|                 |                 |                 | provided        |
|                 |                 |                 | ``txid``        |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | Optional(0 or   | If the          |
| \ ``blockhash`` |                 | 1)              | transaction has |
|                 |                 |                 | been included   |
|                 |                 |                 | in a block on   |
|                 |                 |                 | the local best  |
|                 |                 |                 | block chain,    |
|                 |                 |                 | this is the     |
|                 |                 |                 | hash of that    |
|                 |                 |                 | block encoded   |
|                 |                 |                 | as hex in RPC   |
|                 |                 |                 | byte order      |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``height``   | number (int)    | Optional(0 or   | The block       |
|                 |                 | 1)              | height where    |
|                 |                 |                 | the transaction |
|                 |                 |                 | was mined       |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | number (int)    | R               | If the          |
| confirmations`` |                 | equired(exactly | transaction has |
|                 |                 | 1)              | been included   |
|                 |                 |                 | in a block on   |
|                 |                 |                 | the local best  |
|                 |                 |                 | block chain,    |
|                 |                 |                 | this is how     |
|                 |                 |                 | many            |
|                 |                 |                 | confirmations   |
|                 |                 |                 | it has.         |
|                 |                 |                 | Otherwise, this |
|                 |                 |                 | is ``0``        |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``time``     | number (int)    | Optional(0 or   | If the          |
|                 |                 | 1)              | transaction has |
|                 |                 |                 | been included   |
|                 |                 |                 | in a block on   |
|                 |                 |                 | the local best  |
|                 |                 |                 | block chain,    |
|                 |                 |                 | this is the     |
|                 |                 |                 | block header    |
|                 |                 |                 | time of that    |
|                 |                 |                 | block (may be   |
|                 |                 |                 | in the future)  |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | Optional(0 or   | This field is   |
| \ ``blocktime`` |                 | 1)              | currently       |
|                 |                 |                 | identical to    |
|                 |                 |                 | the time field  |
|                 |                 |                 | described above |
+-----------------+-----------------+-----------------+-----------------+
| →\              | bool            | R               | **Always        |
| ``instantlock`` |                 | equired(exactly | ``false``       |
|                 |                 | 1)              | if**\ `lite     |
|                 |                 |                 | mode            |
|                 |                 |                 | <core-guide-das |
|                 |                 |                 | h-features#lite |
|                 |                 |                 | -mode>`__\ **is |
|                 |                 |                 | enabled**\ If   |
|                 |                 |                 | set to          |
|                 |                 |                 | ``true``, this  |
|                 |                 |                 | transaction is  |
|                 |                 |                 | locked (by      |
|                 |                 |                 | InstantSend or  |
|                 |                 |                 | a ChainLock)    |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``instant    | bool            | R               | **Always        |
| lock_internal`` |                 | equired(exactly | ``false``       |
|                 |                 | 1)              | if**\ `lite     |
|                 |                 |                 | mode            |
|                 |                 |                 | <core-guide-das |
|                 |                 |                 | h-features#lite |
|                 |                 |                 | -mode>`__\ **is |
|                 |                 |                 | enabled**\ If   |
|                 |                 |                 | set to          |
|                 |                 |                 | ``true``, this  |
|                 |                 |                 | transaction has |
|                 |                 |                 | an InstantSend  |
|                 |                 |                 | lock            |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | R               | *Added in Dash  |
| \ ``chainlock`` |                 | equired(exactly | Core            |
|                 |                 | 1)              | 0.14            |
|                 |                 |                 | .0*\ \ **Always |
|                 |                 |                 | ``false``       |
|                 |                 |                 | if**\ `lite     |
|                 |                 |                 | mode            |
|                 |                 |                 | <core-guide-das |
|                 |                 |                 | h-features#lite |
|                 |                 |                 | -mode>`__\ **is |
|                 |                 |                 | enabled**\ If   |
|                 |                 |                 | set to          |
|                 |                 |                 | ``true``, this  |
|                 |                 |                 | transaction is  |
|                 |                 |                 | in a block that |
|                 |                 |                 | is locked (not  |
|                 |                 |                 | susceptible to  |
|                 |                 |                 | a chain re-org) |
+-----------------+-----------------+-----------------+-----------------+

*Examples from Dash Core 0.14.0*

A classical transaction in serialized transaction format:

.. code:: bash

   dash-cli getrawtransaction \
     f4de3be04efa18e203c9d0b7ad11bb2517f5889338918ed300a374f5bd736ed7

Result (wrapped):

.. code:: text

   02000000015d0b26079696875e9fc3cb480420aae3c8b1da628fbb14cc718066\
   df7fe7c5fd010000006a47304402202cfa683981898ad9adb8953423a38f7185\
   ed41e163aa195d608fbe5bc3034910022034e2376aaed1c6576c0dad79d626ee\
   27f706baaed86dabb105979c3e6f6e1cb9012103d14eb001cf0908f3a2333d17\
   1f6236497a82318a6a6f649b4d7fd8e5c8922e08feffffff021e3f4b4c000000\
   001976a914b02ae52066542b4aec5cf45c7cae3183d7bd322788ac00f9029500\
   0000001976a914252c9de3a0ebd5c95886187b24969d4ccdb5576e88ac943d0000

Get the same transaction in JSON:

.. code:: bash

   dash-cli getrawtransaction \
   f4de3be04efa18e203c9d0b7ad11bb2517f5889338918ed300a374f5bd736ed7 \
   1

Result:

.. code:: json

   {
     "txid": "f4de3be04efa18e203c9d0b7ad11bb2517f5889338918ed300a374f5bd736ed7",
     "version": 2,
     "type": 0,
     "size": 225,
     "locktime": 15764,
     "vin": [
       {
         "txid": "fdc5e77fdf668071cc14bb8f62dab1c8e3aa200448cbc39f5e87969607260b5d",
         "vout": 1,
         "scriptSig": {
           "asm": "304402202cfa683981898ad9adb8953423a38f7185ed41e163aa195d608fbe5bc3034910022034e2376aaed1c6576c0dad79d626ee27f706baaed86dabb105979c3e6f6e1cb9[ALL] 03d14eb001cf0908f3a2333d171f6236497a82318a6a6f649b4d7fd8e5c8922e08",
           "hex": "47304402202cfa683981898ad9adb8953423a38f7185ed41e163aa195d608fbe5bc3034910022034e2376aaed1c6576c0dad79d626ee27f706baaed86dabb105979c3e6f6e1cb9012103d14eb001cf0908f3a2333d171f6236497a82318a6a6f649b4d7fd8e5c8922e08"
         },
         "value": 37.80000000,
         "valueSat": 3780000000,
         "address": "yTsGq4wV8WF5GKLaYV2C43zrkr2sfTtysT",
         "sequence": 4294967294
       }
     ],
     "vout": [
       {
         "value": 12.79999774,
         "valueSat": 1279999774,
         "n": 0,
         "scriptPubKey": {
           "asm": "OP_DUP OP_HASH160 b02ae52066542b4aec5cf45c7cae3183d7bd3227 OP_EQUALVERIFY OP_CHECKSIG",
           "hex": "76a914b02ae52066542b4aec5cf45c7cae3183d7bd322788ac",
           "reqSigs": 1,
           "type": "pubkeyhash",
           "addresses": [
             "ycNwAN4DQ7Xnw5XLKg84SR4U1GE22FfLNQ"
           ]
         },
         "spentTxId": "85b40136f077cded9587022645fde82389e2f01b0bec697d8cd22ccab930f3d3",
         "spentIndex": 19,
         "spentHeight": 20631
       },
       {
         "value": 25.00000000,
         "valueSat": 2500000000,
         "n": 1,
         "scriptPubKey": {
           "asm": "OP_DUP OP_HASH160 252c9de3a0ebd5c95886187b24969d4ccdb5576e OP_EQUALVERIFY OP_CHECKSIG",
           "hex": "76a914252c9de3a0ebd5c95886187b24969d4ccdb5576e88ac",
           "reqSigs": 1,
           "type": "pubkeyhash",
           "addresses": [
             "yPi1JKw5fn8bMFsCCtnkGagogW6GXwGktZ"
           ]
         },
         "spentTxId": "90aa8902dbab71c07a5ac06dfe45c5e5fa1f032788b5f916951d0969c9feef39",
         "spentIndex": 1,
         "spentHeight": 24630
       }
     ],
     "hex": "02000000015d0b26079696875e9fc3cb480420aae3c8b1da628fbb14cc718066df7fe7c5fd010000006a47304402202cfa683981898ad9adb8953423a38f7185ed41e163aa195d608fbe5bc3034910022034e2376aaed1c6576c0dad79d626ee27f706baaed86dabb105979c3e6f6e1cb9012103d14eb001cf0908f3a2333d171f6236497a82318a6a6f649b4d7fd8e5c8922e08feffffff021e3f4b4c000000001976a914b02ae52066542b4aec5cf45c7cae3183d7bd322788ac00f90295000000001976a914252c9de3a0ebd5c95886187b24969d4ccdb5576e88ac943d0000",
     "blockhash": "0000000005f395d62a40ef9f2a13000bd4076e2131c8671db8333a5b31e4403f",
     "height": 15765,
     "confirmations": 153657,
     "time": 1546278750,
     "blocktime": 1546278750,
     "instantlock": true,
     "instantlock_internal": false,
     "chainlock": true
   }

A special transaction (CbTx) in serialized transaction format:

.. code:: bash

   dash-cli getrawtransaction \
     25632685ed0d7286901a80961c924c1ddd952e764754dbd8b40d0956413c8b56

Result (wrapped):

.. code:: text

   030005000100000000000000000000000000000000000000000000000000000000000\
   00000ffffffff2703ae50011a4d696e656420627920416e74506f6f6c2021000b0120\
   1da9196f0000000007000000ffffffff02809e4730000000001976a914cbd7bfcc503\
   51180132b2c0698cb90ad74c473c788ac809e4730000000001976a91488a060bc2dfe\
   05780ae4dcb6c98b12436c35a93988ac00000000460200ae50010078e5c08b3996088\
   7bf95185c381bdb719e60b6925fa12af78a8824fade927387c757acb6bac63da84f92\
   45e20cfd5d830382ac634d434725ca6349ab5db920a3

Get the same transaction in JSON:

.. code:: bash

   dash-cli getrawtransaction \
   25632685ed0d7286901a80961c924c1ddd952e764754dbd8b40d0956413c8b56 \
   1

Result:

.. code:: json

   {
     "txid": "25632685ed0d7286901a80961c924c1ddd952e764754dbd8b40d0956413c8b56",
     "version": 3,
     "type": 5,
     "size": 229,
     "locktime": 0,
     "vin": [
       {
         "coinbase": "03ae50011a4d696e656420627920416e74506f6f6c2021000b01201da9196f0000000007000000",
         "sequence": 4294967295
       }
     ],
     "vout": [
       {
         "value": 8.10000000,
         "valueSat": 810000000,
         "n": 0,
         "scriptPubKey": {
           "asm": "OP_DUP OP_HASH160 cbd7bfcc50351180132b2c0698cb90ad74c473c7 OP_EQUALVERIFY OP_CHECKSIG",
           "hex": "76a914cbd7bfcc50351180132b2c0698cb90ad74c473c788ac",
           "reqSigs": 1,
           "type": "pubkeyhash",
           "addresses": [
             "yeuGUfPMrbEqAS2Pw1wonYgEPbM4LAA9LK"
           ]
         },
         "spentTxId": "1790b286922d1a439bdc056939bc902a222f9d66ee63d8427805617eedf835bd",
         "spentIndex": 83,
         "spentHeight": 94680
       },
       {
         "value": 8.10000000,
         "valueSat": 810000000,
         "n": 1,
         "scriptPubKey": {
           "asm": "OP_DUP OP_HASH160 88a060bc2dfe05780ae4dcb6c98b12436c35a939 OP_EQUALVERIFY OP_CHECKSIG",
           "hex": "76a91488a060bc2dfe05780ae4dcb6c98b12436c35a93988ac",
           "reqSigs": 1,
           "type": "pubkeyhash",
           "addresses": [
             "yYmrsYP3XYMZr1cGtha3QzmuNB1C7CfyhV"
           ]
         }
       }
     ],
     "extraPayloadSize": 70,
     "extraPayload": "0200ae50010078e5c08b39960887bf95185c381bdb719e60b6925fa12af78a8824fade927387c757acb6bac63da84f9245e20cfd5d830382ac634d434725ca6349ab5db920a3",
     "cbTx": {
       "version": 2,
       "height": 86190,
       "merkleRootMNList": "877392defa24888af72aa15f92b6609e71db1b385c1895bf870896398bc0e578",
       "merkleRootQuorums": "a320b95dab4963ca2547434d63ac8203835dfd0ce245924fa83dc6bab6ac57c7"
     },
     "hex": "03000500010000000000000000000000000000000000000000000000000000000000000000ffffffff2703ae50011a4d696e656420627920416e74506f6f6c2021000b01201da9196f0000000007000000ffffffff02809e4730000000001976a914cbd7bfcc50351180132b2c0698cb90ad74c473c788ac809e4730000000001976a91488a060bc2dfe05780ae4dcb6c98b12436c35a93988ac00000000460200ae50010078e5c08b39960887bf95185c381bdb719e60b6925fa12af78a8824fade927387c757acb6bac63da84f9245e20cfd5d830382ac634d434725ca6349ab5db920a3",
     "blockhash": "00000000007b0fb99e36713cf08012482478ee496e6dcb4007ad2e806306e62b",
     "height": 86190,
     "confirmations": 83233,
     "time": 1556114577,
     "blocktime": 1556114577,
     "instantlock": true,
     "instantlock_internal": false,
     "chainlock": true
   }

*See also*

-  `GetSpecialTxes </docs/core-api-ref-remote-procedure-calls-blockchain#getspecialtxes>`__:
   returns an array of special transactions found in the specified block
-  `GetTransaction </docs/core-api-ref-remote-procedure-calls-wallet#gettransaction>`__:
   gets detailed information about an in-wallet transaction.

JoinPSBTs
=========

The ```joinpsbts``
RPC <core-api-ref-remote-procedure-calls-raw-transactions#joinpsbts>`__
joins multiple distinct PSBTs with different inputs and outputs into one
PSBT with inputs and outputs from all of the PSBTs. No input in any of
the PSBTs can be in more than one of the PSBTs.

*Parameter #1—Transactions*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``txs``         | array           | R               | A JSON array of |
|                 |                 | equired(exactly | base64 strings  |
|                 |                 | 1)              | of partially    |
|                 |                 |                 | signed          |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+
| → PSBT          | string          | Required(1 or   | A PSBT base64   |
|                 |                 | more)           | string          |
+-----------------+-----------------+-----------------+-----------------+

*Result—the combined raw transaction in base64*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | string          | R               | The resulting   |
|                 |                 | equired(Exactly | raw transaction |
|                 |                 | 1)              | (base64-encoded |
|                 |                 |                 | string)         |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

.. code:: bash

   dash-cli -testnet joinpsbts "[\"cHNidP8BAEICAAAAAfisRhf3kqdGJdB8vKvQz81ze9cH6bh0RKZfFTMsXatUAAAAAAD/////AQAAAAAAAAAABmoEAAECAwAAAAAAAAA=\", \"cHNidP8BAEICAAAAAXgRxzbShUlivVFKgoLyhk0RCCYLZKCYTl/tYRd+yGImAAAAAAD/////AQAAAAAAAAAABmoEAAECAwAAAAAAAAA=\"]"

Result:

::

   cHNidP8BAHoCAAAAAvisRhf3kqdGJdB8vKvQz81ze9cH6bh0RKZfFTMsXatUAAAAAAD/////eBHHNtKFSWK9UUqCgvKGTREIJgtkoJhOX+1hF37IYiYAAAAAAP////8CAAAAAAAAAAAGagQAAQIDAAAAAAAAAAAGagQAAQIDAAAAAAAAAAAA

*See also*

-  `CombinePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#combinepsbt>`__:
   combine multiple partially-signed Dash transactions into one
   transaction.
-  `ConvertToPSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#converttopsbt>`__:
   converts a network serialized transaction to a PSBT.
-  `DecodePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#decodepsbt>`__:
   returns a JSON object representing the serialized, base64-encoded
   partially signed Dash transaction.
-  `FinalizePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#finalizepsbt>`__:
   finalizes the inputs of a PSBT.
-  `WalletCreateFundedPSBT </docs/core-api-ref-remote-procedure-calls-wallet#walletcreatefundedpsbt>`__:
   creates and funds a transaction in the Partially Signed Transaction
   (PST) format.
-  `WalletProcessPSBT </docs/core-api-ref-remote-procedure-calls-wallet#walletprocesspsbt>`__:
   updates a PSBT with input information from a wallet and then allows
   the signing of inputs.

SendRawTransaction
==================

The ```sendrawtransaction``
RPC <core-api-ref-remote-procedure-calls-raw-transactions#sendrawtransaction>`__
validates a transaction and broadcasts it to the peer-to-peer network.
[block:callout] { “type”: “danger”, “body”: “Breaking change(s) in Dash
Core 18.0. See parameter and/or response information for details.” }
[/block] *Parameter #1—a serialized transaction to broadcast*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Transaction     | string (hex)    | R               | The serialized  |
|                 |                 | equired(exactly | transaction to  |
|                 |                 | 1)              | broadcast       |
|                 |                 |                 | encoded as hex  |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2–whether to allow high fees*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``maxfeerate``  | number          | Optional(0 or   | Reject          |
|                 |                 | 1)              | transactions    |
|                 |                 |                 | whose fee rate  |
|                 |                 |                 | is higher than  |
|                 |                 |                 | the specified   |
|                 |                 |                 | value,          |
|                 |                 |                 | expressed in    |
|                 |                 |                 | DASH/kB.        |
|                 |                 |                 | **Breaking      |
|                 |                 |                 | change:         |
|                 |                 |                 | parameter       |
|                 |                 |                 | changed from    |
|                 |                 |                 | ``              |
|                 |                 |                 | allowhighfees`` |
|                 |                 |                 | to              |
|                 |                 |                 | ``maxfeerate``  |
|                 |                 |                 | in Dash Core    |
|                 |                 |                 | 18.0.0.         |
|                 |                 |                 | S               |
|                 |                 |                 | ee**\ `previous |
|                 |                 |                 | version <ht     |
|                 |                 |                 | tps://dashcore. |
|                 |                 |                 | readme.io/v0.17 |
|                 |                 |                 | .0/docs/core-ap |
|                 |                 |                 | i-ref-remote-pr |
|                 |                 |                 | ocedure-calls-r |
|                 |                 |                 | aw-transactions |
|                 |                 |                 | #sendrawtransac |
|                 |                 |                 | tion>`__\ **.** |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3–whether to use InstantSend*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Use InstantSend | bool            | Optional(0 or   | *Deprecated and |
|                 |                 | 1)              | ignored since   |
|                 |                 |                 | Dash Core       |
|                 |                 |                 | 0.15.0*         |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #4–whether to bypass policy limits*

============= ==== ================ ================================
Name          Type Presence         Description
============= ==== ================ ================================
Bypass Limits bool Optional(0 or 1) Bypass transaction policy limits
============= ==== ================ ================================

*Result—a TXID or error message*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | null/string     | R               | If the          |
|                 | (hex)           | equired(exactly | transaction was |
|                 |                 | 1)              | accepted by the |
|                 |                 |                 | node for        |
|                 |                 |                 | broadcast, this |
|                 |                 |                 | will be the     |
|                 |                 |                 | TXID of the     |
|                 |                 |                 | transaction     |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order. If the   |
|                 |                 |                 | transaction was |
|                 |                 |                 | rejected by the |
|                 |                 |                 | node, this will |
|                 |                 |                 | set to          |
|                 |                 |                 | ``null``, the   |
|                 |                 |                 | JSON-RPC error  |
|                 |                 |                 | field will be   |
|                 |                 |                 | set to a code,  |
|                 |                 |                 | and the         |
|                 |                 |                 | JSON-RPC        |
|                 |                 |                 | message field   |
|                 |                 |                 | may contain an  |
|                 |                 |                 | informative     |
|                 |                 |                 | error message   |
+-----------------+-----------------+-----------------+-----------------+

*Examples from Dash Core 0.12.2*

Broadcast a signed transaction:

.. code:: bash

   dash-cli -testnet sendrawtransaction 01000000016b490886c0198b\
   028c6c5cb145c4eb3b1055a224a7a105aadeff41b69ec91e0601000000694630\
   43022033a61c56fa0867ed67b76b023204a9dc0ee6b0d63305dc5f65fe943354\
   45ff2f021f712f55399d5238fc7146497c431fc4182a1de0b96fc22716e0845f\
   561d542e012102eacba539d92eb88d4e73bb32749d79f53f6e8d7947ac40a71b\
   d4b26c13b6ec29ffffffff0200205fa0120000001976a914485485425fa99504\
   ec1638ac4213f3cfc9f32ef388acc0a8f9be010000001976a914811eacc14db8\
   ebb5b64486dc43400c0226b428a488ac00000000

Result:

.. code:: text

   2f124cb550d9967b81914b544dea3783de23e85d67a9816f9bada665ecfe1cd5

*See also*

-  `CombineRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#combinerawtransaction>`__:
   combine multiple partially signed transactions into one transaction.
-  `CreateRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#createrawtransaction>`__:
   creates an unsigned serialized transaction that spends a previous
   output to a new output with a P2PKH or P2SH address. The transaction
   is not stored in the wallet or transmitted to the network.
-  `DecodeRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#decoderawtransaction>`__:
   decodes a serialized transaction hex string into a JSON object
   describing the transaction.
-  `SignRawTransactionWithKey <#signrawtransactionwithkey>`__: signs
   inputs for a transaction in the serialized transaction format using
   private keys provided in the call.

SignRawTransactionWithKey
=========================

[block:callout] { “type”: “success”, “body”: “Add in Dash Core 0.17.0” }
[/block] The ```signrawtransactionwithkey``
RPC <#signrawtransactionwithkey>`__ signs inputs for a transaction in
the serialized transaction format using private keys provided in the
call.

*Parameter #1—the transaction to sign*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Transaction     | string (hex)    | R               | The transaction |
|                 |                 | equired(exactly | to sign as a    |
|                 |                 | 1)              | serialized      |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—private keys for signing*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Private Keys    | array           | R               | An array        |
|                 |                 | equired(exactly | holding private |
|                 |                 | 1)              | keys. If any    |
|                 |                 |                 | keys are        |
|                 |                 |                 | provided, only  |
|                 |                 |                 | they will be    |
|                 |                 |                 | used to sign    |
|                 |                 |                 | the transaction |
|                 |                 |                 | (even if the    |
|                 |                 |                 | wallet has      |
|                 |                 |                 | other matching  |
|                 |                 |                 | keys). If this  |
|                 |                 |                 | array is empty  |
|                 |                 |                 | or not used,    |
|                 |                 |                 | and wallet      |
|                 |                 |                 | support is      |
|                 |                 |                 | enabled, keys   |
|                 |                 |                 | from the wallet |
|                 |                 |                 | will be used    |
+-----------------+-----------------+-----------------+-----------------+
| →Key            | string (base58) | Required(1 or   | A private key   |
|                 |                 | more)           | in base58check  |
|                 |                 |                 | format to use   |
|                 |                 |                 | to create a     |
|                 |                 |                 | signature for   |
|                 |                 |                 | this            |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—unspent transaction output details*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Dependencies    | array           | Optional(0 or   | The previous    |
|                 |                 | 1)              | outputs being   |
|                 |                 |                 | spent by this   |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| →Output         | object          | Optional(0 or   | An output being |
|                 |                 | more)           | spent           |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``txid``   | string (hex)    | R               | The TXID of the |
|                 |                 | equired(exactly | transaction the |
|                 |                 | 1)              | output appeared |
|                 |                 |                 | in. The TXID    |
|                 |                 |                 | must be encoded |
|                 |                 |                 | in hex in RPC   |
|                 |                 |                 | byte order      |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``vout``   | number (int)    | R               | The index       |
|                 |                 | equired(exactly | number of the   |
|                 |                 | 1)              | output (vout)   |
|                 |                 |                 | as it appeared  |
|                 |                 |                 | in its          |
|                 |                 |                 | transaction,    |
|                 |                 |                 | with the first  |
|                 |                 |                 | output being 0  |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | The output’s    |
| →\ `            |                 | equired(exactly | pubkey script   |
| `scriptPubKey`` |                 | 1)              | encoded as hex  |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | Optional(0 or   | If the pubkey   |
| →\ `            |                 | 1)              | script was a    |
| `redeemScript`` |                 |                 | script hash,    |
|                 |                 |                 | this must be    |
|                 |                 |                 | the             |
|                 |                 |                 | corresponding   |
|                 |                 |                 | redeem script   |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``amount`` | numeric         | R               | The amount of   |
|                 |                 | equired(exactly | Dash spent      |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #4—signature hash type*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| SigHash         | string          | Optional(0 or   | The type of     |
|                 |                 | 1)              | signature hash  |
|                 |                 |                 | to use for all  |
|                 |                 |                 | of the          |
|                 |                 |                 | signatures      |
|                 |                 |                 | performed. (You |
|                 |                 |                 | must use        |
|                 |                 |                 | separate calls  |
|                 |                 |                 | to the          |
|                 |                 |                 | ```signr        |
|                 |                 |                 | awtransaction`` |
|                 |                 |                 | RPC <           |
|                 |                 |                 | core-api-ref-re |
|                 |                 |                 | mote-procedure- |
|                 |                 |                 | calls-raw-trans |
|                 |                 |                 | actions#signraw |
|                 |                 |                 | transaction>`__ |
|                 |                 |                 | if you want to  |
|                 |                 |                 | use different   |
|                 |                 |                 | signature hash  |
|                 |                 |                 | types for       |
|                 |                 |                 | different       |
|                 |                 |                 | signatures. The |
|                 |                 |                 | allowed values  |
|                 |                 |                 | are: ``ALL``,   |
|                 |                 |                 | ``NONE``,       |
|                 |                 |                 | ``SINGLE``,     |
|                 |                 |                 | ``ALL|          |
|                 |                 |                 | ANYONECANPAY``, |
|                 |                 |                 | ``NONE|         |
|                 |                 |                 | ANYONECANPAY``, |
|                 |                 |                 | and             |
|                 |                 |                 | ``SINGLE        |
|                 |                 |                 | |ANYONECANPAY`` |
+-----------------+-----------------+-----------------+-----------------+

*Result—the transaction with any signatures made*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | The results of  |
|                 |                 | equired(exactly | the signature   |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``hex``      | string (hex)    | R               | The resulting   |
|                 |                 | equired(exactly | serialized      |
|                 |                 | 1)              | transaction     |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | with any        |
|                 |                 |                 | signatures made |
|                 |                 |                 | inserted. If no |
|                 |                 |                 | signatures were |
|                 |                 |                 | made, this will |
|                 |                 |                 | be the same     |
|                 |                 |                 | transaction     |
|                 |                 |                 | provided in     |
|                 |                 |                 | parameter #1    |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``complete`` | bool            | R               | The value       |
|                 |                 | equired(exactly | ``true`` if     |
|                 |                 | 1)              | transaction is  |
|                 |                 |                 | fully signed;   |
|                 |                 |                 | the value       |
|                 |                 |                 | ``false`` if    |
|                 |                 |                 | more signatures |
|                 |                 |                 | are required.   |
|                 |                 |                 | Once ``true``   |
|                 |                 |                 | the transaction |
|                 |                 |                 | can be sent     |
|                 |                 |                 | using the       |
|                 |                 |                 | ```sendr        |
|                 |                 |                 | awtransaction`` |
|                 |                 |                 | RPC <#sendrawt  |
|                 |                 |                 | ransaction>`__. |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

Sign the raw transaction hex generated from the
```createrawtransaction`` RPC <#createrawtransaction>`__:

.. code:: bash

   dash-cli -testnet signrawtransactionwithkey 020000000121f39228a11ddf197ac3658e\
   93bd264d0afd927f0cdfc7caeb760537e529c94a0100000000ffffffff01809698000000000019\
   76a914fe64a96d6660e30c433e1189082466a95bdf9ceb88ac00000000 \
   [\"cSxm6ji1SQ7vF1r8QhcsE1AZ42ZJqs5CEAAnD18iV18ZCQ2u3gGa\"]

Result:

.. code:: json

   {
     "hex": "020000000121f39228a11ddf197ac3658e93bd264d0afd927f0cdfc7caeb760537e529c94a010000006b483045022100811c5679ef097b0e5a338fc3cd05ee50e1802680ea8a172d0fd3a81da3c1fc2002204804b18a44e888ac1ee9b6a7cbadc211ecdc30f8c889938c95125206e39554220121025d81ce6581e547dd34194385352053abb17f0246768d75443b25ded5e37d594fffffffff0180969800000000001976a914fe64a96d6660e30c433e1189082466a95bdf9ceb88ac00000000",
     "complete": true
   }

*See also*

-  `CombineRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#combinerawtransaction>`__:
   combine multiple partially signed transactions into one transaction.
-  `CreateRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#createrawtransaction>`__:
   creates an unsigned serialized transaction that spends a previous
   output to a new output with a P2PKH or P2SH address. The transaction
   is not stored in the wallet or transmitted to the network.
-  `DecodeRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#decoderawtransaction>`__:
   decodes a serialized transaction hex string into a JSON object
   describing the transaction.
-  `SendRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#sendrawtransaction>`__:
   validates a transaction and broadcasts it to the peer-to-peer
   network.

TestMemPoolAccept
=================

The ```testmempoolaccept``
RPC <core-api-ref-remote-procedure-calls-raw-transactions#testmempoolaccept>`__
returns the results of mempool acceptance tests indicating if raw
transaction (serialized, hex-encoded) would be accepted by mempool.

*Parameter #1—raw txs*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``rawtxs``      | array           | R               | An array of hex |
|                 |                 | equired(exactly | strings of raw  |
|                 |                 | 1)              | transactions    |
|                 |                 |                 | (the length     |
|                 |                 |                 | must be one for |
|                 |                 |                 | now)            |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—set max fee rate*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``maxfeerate``  | number          | Optional(0 or   | Reject          |
|                 |                 | 1)              | transactions    |
|                 |                 |                 | whose fee rate  |
|                 |                 |                 | is higher than  |
|                 |                 |                 | the specified   |
|                 |                 |                 | value,          |
|                 |                 |                 | expressed in    |
|                 |                 |                 | DASH/kB.        |
|                 |                 |                 | Changed from    |
|                 |                 |                 | ``              |
|                 |                 |                 | allowhighfees`` |
|                 |                 |                 | in Dash Core    |
|                 |                 |                 | 18.0.0. See     |
|                 |                 |                 | `previous       |
|                 |                 |                 | versi           |
|                 |                 |                 | on <https://das |
|                 |                 |                 | hcore.readme.io |
|                 |                 |                 | /v0.17.0/docs/c |
|                 |                 |                 | ore-api-ref-rem |
|                 |                 |                 | ote-procedure-c |
|                 |                 |                 | alls-raw-transa |
|                 |                 |                 | ctions#sendrawt |
|                 |                 |                 | ransaction>`__. |
+-----------------+-----------------+-----------------+-----------------+

*Result—mempool acceptance test results*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | The result of   |
|                 |                 | equired(exactly | the mempool     |
|                 |                 | 1)              | acceptance test |
|                 |                 |                 | for each raw    |
|                 |                 |                 | transaction in  |
|                 |                 |                 | the input       |
|                 |                 |                 | array.          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``txid``     | string (hex)    | R               | The TXID of the |
|                 |                 | equired(exactly | transaction the |
|                 |                 | 1)              | output appeared |
|                 |                 |                 | in. The TXID    |
|                 |                 |                 | must be encoded |
|                 |                 |                 | in hex in RPC   |
|                 |                 |                 | byte order      |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``allowed``  | bool            | R               | If the mempool  |
|                 |                 | equired(exactly | allows this tx  |
|                 |                 | 1)              | to be inserted  |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | string (hex)    | R               | A rejection     |
| reject-reason`` |                 | equired(exactly | string that is  |
|                 |                 | 1)              | only present    |
|                 |                 |                 | when ‘allowed’  |
|                 |                 |                 | is false.       |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

.. code:: bash

   dash-cli -testnet testmempoolaccept [\"020000000234a2863f9781a7200330e700e684804bb2407d225c4e940c9cfb772f22fc0748000000006a47304402203b5a7899b6be2f33d30c1a71940c51f38074f4224a1ad6dee03dcc65f8646072022050d711115cd7291c2f094e3a3cfda14441721b1438e406b963b5660274ba4475012103e2fe477e31365d784d98514c7c9294283620d4a9775f01da5d3ba52f4c7286f5feffffff34a2863f9781a7200330e700e684804bb2407d225c4e940c9cfb772f22fc0748010000006a473044022018901985d2c94492111a45ed51bac88e02f1bb4a8382eacf5f474d70878c19f4022046e309e548f95a64b05e8ef70fae0ff86bf83cbed3055591580e0b5f5597c3a2012103109325a92f9e6d31d2ebd0595d471275ae8d635db2a0c42358f387e1af69c14dfeffffff020f530f00000000001976a9145799a5df43d34b05cdf03347af9102b67a6d154a88ac00e1f505000000001976a91464d51a27c8b8434458bac0193039bae55ca023c388ac151c0900\"]

Result:

.. code:: json

   [
     {
       "txid": "06464b9c80413a49ab3c618f769a11647b6011f9ad15094eb423916ae5bc0c23",
       "allowed": false,
       "reject-reason": "18: txn-already-in-mempool"
     }
   ]

*See also*

-  `CombineRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#combinerawtransaction>`__:
   combine multiple partially signed transactions into one transaction.
-  `CreateRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#createrawtransaction>`__:
   creates an unsigned serialized transaction that spends a previous
   output to a new output with a P2PKH or P2SH address. The transaction
   is not stored in the wallet or transmitted to the network.
-  `DecodeRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#decoderawtransaction>`__:
   decodes a serialized transaction hex string into a JSON object
   describing the transaction.
-  `SendRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#sendrawtransaction>`__:
   validates a transaction and broadcasts it to the peer-to-peer
   network.
-  `SignRawTransactionWithKey <#signrawtransactionwithkey>`__: signs
   inputs for a transaction in the serialized transaction format using
   private keys provided in the call.

UTXOUpdatePSBT
==============

The ```utxoupdatepsbt``
RPC <core-api-ref-remote-procedure-calls-raw-transactions#utxoupdatepsbt>`__
updates a PSBT with UTXOs retrieved from the UTXO set or the mempool.

*Parameter #1—psbt*

==== ====== ======== =========================
Name Type   Presence Description
==== ====== ======== =========================
psbt string Required A base64 string of a PSBT
==== ====== ======== =========================

*Result—the raw transaction in base64*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | string          | R               | The resulting   |
|                 |                 | equired(Exactly | raw transaction |
|                 |                 | 1)              | (base64-encoded |
|                 |                 |                 | string)         |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

.. code:: bash

   dash-cli -testnet utxoupdatepsbt cHNidP8BAEICAAAAAXgRxzbShUlivVFKgoLyhk0RCCYLZKCYTl/tYRd+yGImAAAAAAD/////AQAAAAAAAAAABmoEAAECAwAAAAAAAAA=

Result:

::

   cHNidP8BAEICAAAAAXgRxzbShUlivVFKgoLyhk0RCCYLZKCYTl/tYRd+yGImAAAAAAD/////AQAAAAAAAAAABmoEAAECAwAAAAAAAAA=

*See also*

-  `CombinePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#combinepsbt>`__:
   combine multiple partially-signed Dash transactions into one
   transaction.
-  `ConvertToPSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#converttopsbt>`__:
   converts a network serialized transaction to a PSBT.
-  `DecodePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#decodepsbt>`__:
   returns a JSON object representing the serialized, base64-encoded
   partially signed Dash transaction.
-  `FinalizePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#finalizepsbt>`__:
   finalizes the inputs of a PSBT.
-  `WalletCreateFundedPSBT </docs/core-api-ref-remote-procedure-calls-wallet#walletcreatefundedpsbt>`__:
   creates and funds a transaction in the Partially Signed Transaction
   (PST) format.
-  `WalletProcessPSBT </docs/core-api-ref-remote-procedure-calls-wallet#walletprocesspsbt>`__:
   updates a PSBT with input information from a wallet and then allows
   the signing of inputs.
