Generate
========

[block:callout] { “type”: “warning”, “title”: “Limited Support”, “body”:
"Since Dash Core 0.14, this RPC is not available in the official
Windows/Mac binaries. The Linux binary and binaries self-compiled (with
the appropriate options) continue to support this feature. See `PR
#2778 <https://github.com/dashpay/dash/pull/2778>`__ for additional
details.:raw-latex:`\n`:raw-latex:`\n*`\*\ *Requires wallet support
(unavailable on masternodes).*\ \**" } [/block] The ```generate``
RPC <core-api-ref-remote-procedure-calls-generating#generate>`__ mines
blocks immediately (before the RPC call returns).

*Parameter #1—the number of blocks to generate*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``numblocks``   | number (int)    | R               | The number of   |
|                 |                 | equired(exactly | blocks to       |
|                 |                 | 1)              | generate. The   |
|                 |                 |                 | RPC call will   |
|                 |                 |                 | not return      |
|                 |                 |                 | until all       |
|                 |                 |                 | blocks have     |
|                 |                 |                 | been generated. |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the number of iterations*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``maxtries``    | number (int)    | R               | The number of   |
|                 |                 | equired(exactly | iterations to   |
|                 |                 | 1)              | try (default =  |
|                 |                 |                 | 1000000).       |
+-----------------+-----------------+-----------------+-----------------+

*Result—the generated block header hashes*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | An array        |
|                 |                 | equired(exactly | containing the  |
|                 |                 | 1)              | block header    |
|                 |                 |                 | hashes of the   |
|                 |                 |                 | generated       |
|                 |                 |                 | blocks (may be  |
|                 |                 |                 | empty if used   |
|                 |                 |                 | with            |
|                 |                 |                 | ``generate 0``) |
+-----------------+-----------------+-----------------+-----------------+
| →Header Hashes  | string (hex)    | Required(1 or   | The hashes of   |
|                 |                 | more)           | the headers of  |
|                 |                 |                 | the blocks      |
|                 |                 |                 | generated in    |
|                 |                 |                 | regtest mode,   |
|                 |                 |                 | as hex in RPC   |
|                 |                 |                 | byte order      |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Using regtest mode, generate 2 blocks:

.. code:: bash

   dash-cli -regtest generate 2

Result:

.. code:: json

   [
     "55a4c47da8151c0823eec22c41ebc6d690a0288302179625bae9eb6f36808266",
     "3f07b9aa4e3bcd5518610945c4a6b32699acac71b1762605ff79ba553111fc79"
   ]

*See also*

-  `GenerateToAddress </docs/core-api-ref-remote-procedure-calls-generating#generatetoaddress>`__:
   mines blocks immediately to a specified address.
-  `GetBlockTemplate </docs/core-api-ref-remote-procedure-calls-mining#getblocktemplate>`__:
   gets a block template or proposal for use with mining software.
-  `GetGenerate </docs/core-api-ref-remote-procedure-calls-removed#getgenerate>`__:
   was removed in Dash Core 0.12.3.
-  `GetMiningInfo </docs/core-api-ref-remote-procedure-calls-mining#getmininginfo>`__:
   returns various mining-related information.
-  `SetGenerate </docs/core-api-ref-remote-procedure-calls-removed#setgenerate>`__:
   was removed in Dash Core 0.12.3.

GenerateToAddress
=================

[block:callout] { “type”: “warning”, “title”: “Limited Support”, “body”:
“Since Dash Core 0.14, this RPC is not available in the official
Windows/Mac binaries. The Linux binary and binaries self-compiled (with
the appropriate options) continue to support this feature. See `PR
#2778 <https://github.com/dashpay/dash/pull/2778>`__ for additional
details.” } [/block]

*Added in Dash Core 0.12.3 / Bitcoin Core 0.13.0*

The ```generatetoaddress``
RPC <core-api-ref-remote-procedure-calls-generating#generatetoaddress>`__
mines blocks immediately to a specified address.

*Parameter #1—the number of blocks to generate*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Blocks          | number (int)    | R               | The number of   |
|                 |                 | equired(exactly | blocks to       |
|                 |                 | 1)              | generate. The   |
|                 |                 |                 | RPC call will   |
|                 |                 |                 | not return      |
|                 |                 |                 | until all       |
|                 |                 |                 | blocks have     |
|                 |                 |                 | been generated  |
|                 |                 |                 | or the maximum  |
|                 |                 |                 | number of       |
|                 |                 |                 | iterations has  |
|                 |                 |                 | been reached    |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—a transaction identifier (TXID)*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Address         | string (base58) | R               | The address     |
|                 |                 | equired(exactly | that will       |
|                 |                 | 1)              | receive the     |
|                 |                 |                 | newly generated |
|                 |                 |                 | Dash            |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—the maximum number of iterations to try*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Maxtries        | number (int)    | Optional(0 or   | The maximum     |
|                 |                 | 1)              | number of       |
|                 |                 |                 | iterations that |
|                 |                 |                 | are tried to    |
|                 |                 |                 | create the      |
|                 |                 |                 | requested       |
|                 |                 |                 | number of       |
|                 |                 |                 | blocks. Default |
|                 |                 |                 | is ``1000000``  |
+-----------------+-----------------+-----------------+-----------------+

*Result—the generated block header hashes*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | An array        |
|                 |                 | equired(exactly | containing the  |
|                 |                 | 1)              | block header    |
|                 |                 |                 | hashes of the   |
|                 |                 |                 | generated       |
|                 |                 |                 | blocks (may be  |
|                 |                 |                 | empty if used   |
|                 |                 |                 | with            |
|                 |                 |                 | ``generate 0``) |
+-----------------+-----------------+-----------------+-----------------+
| →Header Hashes  | string (hex)    | Required(1 or   | The hashes of   |
|                 |                 | more)           | the headers of  |
|                 |                 |                 | the blocks      |
|                 |                 |                 | generated, as   |
|                 |                 |                 | hex in RPC byte |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.3*

Using regtest mode, generate 2 blocks with maximal 500000 iterations:

.. code:: bash

   dash-cli -regtest generatetoaddress 2 "yaQzdWrDVYGncLKSKG4bHQ\
   ML9UdAe726QN" 500000

Result:

.. code:: json

   [
     "34726c518d1688a9c56b3399e892089d3a639b43de194517c07da2b168a3a89c",
     "1f030abe2bb323b8895542e3a85ed8386bd92c67af9d19fe9c163a4c5f5ef149"
   ]

*See also*

-  `Generate </docs/core-api-ref-remote-procedure-calls-generating#generate>`__:
   mines blocks immediately (before the RPC call returns).
-  `GetMiningInfo </docs/core-api-ref-remote-procedure-calls-mining#getmininginfo>`__:
   returns various mining-related information.
-  `GetBlockTemplate </docs/core-api-ref-remote-procedure-calls-mining#getblocktemplate>`__:
   gets a block template or proposal for use with mining software.
