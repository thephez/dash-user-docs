CreateMultiSig
==============

The ```createmultisig``
RPC <core-api-ref-remote-procedure-calls-util#createmultisig>`__ creates
a P2SH multi-signature address.

*Parameter #1—the number of signatures required*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Required        | number (int)    | R               | The minimum     |
|                 |                 | equired(exactly | (*m*) number of |
|                 |                 | 1)              | signatures      |
|                 |                 |                 | required to     |
|                 |                 |                 | spend this      |
|                 |                 |                 | m-of-n multisig |
|                 |                 |                 | script          |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the full public keys* [block:callout] { “type”: “danger”,
“body”: “As of Dash Core 0.17.0, using addresses with ``createmultisig``
is unsupported. Clients must use
```addmultisigaddress`` <core-api-ref-remote-procedure-calls-wallet#addmultisigaddress>`__
to create multisig addresses.”, “title”: “Deprecation Warning” }
[/block] Name \| Type \| Presence \| Description — \| — \| — \| — Keys
\| array \| Required(exactly 1) \| An array of strings with each string
being a public key →Key \| string \| Required(1 or more) \| A public key
against which signatures will be checked. There must be at least as many
keys as specified by the ``Required`` parameter, and there may be more
keys

*Result—P2SH address and hex-encoded redeem script*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An object       |
|                 |                 | equired(exactly | describing the  |
|                 |                 | 1)              | multisig        |
|                 |                 |                 | address         |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``address``  | string (base58) | R               | The P2SH        |
|                 |                 | equired(exactly | address for     |
|                 |                 | 1)              | this multisig   |
|                 |                 |                 | redeem script   |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | string (hex)    | R               | The multisig    |
| `redeemScript`` |                 | equired(exactly | redeem script   |
|                 |                 | 1)              | encoded as hex  |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.16.0*

Creating a 1-of-2 P2SH multisig address by combining two full public
keys:

.. code:: bash

   dash-cli -testnet createmultisig 1 '''
     [
       "03283a224c2c014d1d0ef82b00470b6b277d71e227c0e2394f9baade5d666e57d3",
       "02594523b004e82849a66b3da096b1e680bf2ed5f7d03a3443c027aa5777bb6223"
     ]
   '''

Result:

.. code:: json

   {
     "address": "8jYUv8hJcbSUPbwYmzp1XMPU6SXoic3hwi",
     "redeemScript": "512103283a224c2c014d1d0ef82b00470b6b277d71e227c0e2394f9baade5d666e57d32102594523b004e82849a66b3da096b1e680bf2ed5f7d03a3443c027aa5777bb622352ae"
   }

*See also*

-  `AddMultiSigAddress </docs/core-api-ref-remote-procedure-calls-wallet#addmultisigaddress>`__:
   adds a P2SH multisig address to the wallet.
-  `DecodeScript </docs/core-api-ref-remote-procedure-calls-raw-transactions#decodescript>`__:
   decodes a hex-encoded P2SH redeem script.

DeriveAddresses
===============

*Added in Dash Core 18.0.0*

The ```deriveaddresses``
RPC <core-api-ref-remote-procedure-calls-util#deriveaddresses>`__
derives one or more addresses corresponding to an output
`descriptor <https://github.com/dashpay/dash/blob/master/doc/descriptors.md>`__.

Examples of output descriptors are:

+-----------------------------------+-----------------------------------+
| Descriptor format                 | Description                       |
+===================================+===================================+
| ``pkh(<pubkey>)``                 | P2PKH outputs for the given       |
|                                   | pubkey                            |
+-----------------------------------+-----------------------------------+
| ``sh(mu                           | P2SH-multisig outputs for the     |
| lti(<n>,<pubkey>,<pubkey>,...))`` | given threshold and pubkeys       |
+-----------------------------------+-----------------------------------+
| ``raw(<hex script>)``             | Outputs whose scriptPubKey equals |
|                                   | the specified hex scripts         |
+-----------------------------------+-----------------------------------+

In the above, either refers to a fixed public key in hexadecimal
notation, or to an xpub/xprv optionally followed by one or more path
elements separated by “/”, where “h” represents a hardened child key.
For more information on output descriptors, see the documentation in the
`doc/descriptors.md <https://github.com/dashpay/dash/blob/master/doc/descriptors.md>`__
file.

*Parameter #1—the descriptor*

+----------------+--------+------------------+------------------+
| Name           | Type   | Presence         | Description      |
+================+========+==================+==================+
| ``descriptor`` | string | Required(exactly | The              |
|                |        | 1)               | `descriptor <ht  |
|                |        |                  | tps://github.com |
|                |        |                  | /dashpay/dash/bl |
|                |        |                  | ob/master/doc/de |
|                |        |                  | scriptors.md>`__ |
+----------------+--------+------------------+------------------+

*Parameter #2—beginning of range*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``begin``       | number          | Optional(0 or   | If a ranged     |
|                 |                 | 1)              | descriptor is   |
|                 |                 |                 | used, this      |
|                 |                 |                 | specifies the   |
|                 |                 |                 | beginning of    |
|                 |                 |                 | the range to    |
|                 |                 |                 | import          |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—end of range*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``end``         | number          | Optional(0 or   | If a ranged     |
|                 |                 | 1)              | descriptor is   |
|                 |                 |                 | used, this      |
|                 |                 |                 | specifies the   |
|                 |                 |                 | end of the      |
|                 |                 |                 | range to import |
+-----------------+-----------------+-----------------+-----------------+

*Result—the derived addresses*

========== ====== =================== ==========================
Name       Type   Presence            Description
========== ====== =================== ==========================
``result`` array  Required(exactly 1) Array of derived addresses
→Address   string Required(0 or more) The derived address(es)
========== ====== =================== ==========================

*Example from Dash Core 18.0.0*

Analyse a descriptor:

.. code:: bash

   dash-cli  deriveaddresses "pkh([8a54e0c5]0214889c34100d00aca6e7cbfe0fa72d83c28857585740bff5f3db6b37e51d9aaa)#wyvgzv2k"

Result:

.. code:: json

   [
     "yYvsn6vdnkeq9VG1JbkfqKbjv3gUmFmnny"
   ]

*See also*

-  `GetDescriptorInfo <#getdescriptorinfo>`__: analyses a descriptor.
-  `ScanTxOutset </docs/core-api-ref-remote-procedure-calls-wallet#scantxoutset>`__:
   signs a message with the private key of an address.

EstimateSmartFee
================

The ```estimatesmartfee``
RPC <core-api-ref-remote-procedure-calls-util#estimatesmartfee>`__
estimates the transaction fee per kilobyte that needs to be paid for a
transaction to begin confirmation within a certain number of blocks and
returns the number of blocks for which the estimate is valid.

*Parameter #1—how many confirmations the transaction may wait before
being included*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| conf_target     | number (int)    | R               | Confirmation    |
|                 |                 | equired(exactly | target in       |
|                 |                 | 1)              | blocks (1 -     |
|                 |                 |                 | 1008)           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—estimate mode*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| estimate_mode   | string          | Opti            | The fee         |
|                 |                 | onalDefault=\ ` | estimate mode.  |
|                 |                 | `CONSERVATIVE`` | Whether to      |
|                 |                 |                 | return a more   |
|                 |                 |                 | conservative    |
|                 |                 |                 | estimate which  |
|                 |                 |                 | also satisfies  |
|                 |                 |                 | a longer        |
|                 |                 |                 | history. A      |
|                 |                 |                 | conservative    |
|                 |                 |                 | estimate        |
|                 |                 |                 | potentially     |
|                 |                 |                 | returns a       |
|                 |                 |                 | higher feerate  |
|                 |                 |                 | and is more     |
|                 |                 |                 | likely to be    |
|                 |                 |                 | sufficient for  |
|                 |                 |                 | the desired     |
|                 |                 |                 | target, but is  |
|                 |                 |                 | not as          |
|                 |                 |                 | responsive to   |
|                 |                 |                 | short term      |
|                 |                 |                 | drops in the    |
|                 |                 |                 | prevailing fee  |
|                 |                 |                 | market. Must be |
|                 |                 |                 | one             |
|                 |                 |                 | of:\ ``UNSET``  |
|                 |                 |                 | (defaults to    |
|                 |                 |                 | ``CONSER        |
|                 |                 |                 | VATIVE``)\ ``EC |
|                 |                 |                 | ONOMICAL``\ \ ` |
|                 |                 |                 | `CONSERVATIVE`` |
+-----------------+-----------------+-----------------+-----------------+

*Result—the fee the transaction needs to pay per kilobyte*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | JSON Object     |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | estimate        |
|                 |                 |                 | information     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``feerate``  | number (Dash)   | Optional(0 or   | The estimated   |
|                 |                 | 1)              | fee the         |
|                 |                 |                 | transaction     |
|                 |                 |                 | should pay in   |
|                 |                 |                 | order to be     |
|                 |                 |                 | included within |
|                 |                 |                 | the specified   |
|                 |                 |                 | number of       |
|                 |                 |                 | blocks. If the  |
|                 |                 |                 | node doesn’t    |
|                 |                 |                 | have enough     |
|                 |                 |                 | information to  |
|                 |                 |                 | make an         |
|                 |                 |                 | estimate, this  |
|                 |                 |                 | field will not  |
|                 |                 |                 | be returned     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``error``    | JSON array      | Optional(0 or   | Errors          |
|                 | (strings)       | 1)              | encountered     |
|                 |                 |                 | during          |
|                 |                 |                 | processing      |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``blocks``   | number          | R               | Block number    |
|                 |                 | equired(exactly | where the       |
|                 |                 | 1)              | estimate was    |
|                 |                 |                 | found           |
+-----------------+-----------------+-----------------+-----------------+

*Examples from Dash Core 0.15.0*

.. code:: bash

   dash-cli estimatesmartfee 6

Result:

.. code:: json

   {
     "feerate": 0.00044345,
     "blocks": 6
   }

Requesting data the node can’t calculate (out of range):

.. code:: bash

   dash-cli estimatesmartfee 2

Result:

.. code:: json

   {
     "errors": [
       "Insufficient data or no feerate found"
     ],
     "blocks": 2
   }

*See also*

-  `SetTxFee </docs/core-api-ref-remote-procedure-calls-wallet#settxfee>`__:
   sets the transaction fee per kilobyte paid by transactions created by
   this wallet.

GetDescriptorInfo
=================

*Added in Dash Core 18.0.0*

The ```getdescriptorinfo``
RPC <core-api-ref-remote-procedure-calls-util#getdescriptorinfo>`__
analyses a
`descriptor <https://github.com/dashpay/dash/blob/master/doc/descriptors.md>`__.

*Parameter #1—the descriptor*

+----------------+--------+------------------+------------------+
| Name           | Type   | Presence         | Description      |
+================+========+==================+==================+
| ``descriptor`` | string | Required(exactly | The              |
|                |        | 1)               | `descriptor <ht  |
|                |        |                  | tps://github.com |
|                |        |                  | /dashpay/dash/bl |
|                |        |                  | ob/master/doc/de |
|                |        |                  | scriptors.md>`__ |
+----------------+--------+------------------+------------------+

*Result—the descriptor info*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | Information     |
|                 |                 | equired(exactly | about the       |
|                 |                 | 1)              | descriptor      |
+-----------------+-----------------+-----------------+-----------------+
| →\              | string          | R               | The descriptor  |
|  ``descriptor`` |                 | equired(exactly | in canonical    |
|                 |                 | 1)              | form, without   |
|                 |                 |                 | private keys    |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``checksum`` | string          | R               | The checksum    |
|                 |                 | equired(exactly | for the input   |
|                 |                 | 1)              | descriptor      |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``isrange``  | bool            | R               | Whether the     |
|                 |                 | equired(exactly | descriptor is   |
|                 |                 | 1)              | ranged          |
+-----------------+-----------------+-----------------+-----------------+
| →\              | bool            | R               | Whether the     |
|  ``issolvable`` |                 | equired(exactly | descriptor is   |
|                 |                 | 1)              | solvable        |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``h          | bool            | R               | Whether the     |
| asprivatekeys`` |                 | equired(exactly | input           |
|                 |                 | 1)              | descriptor      |
|                 |                 |                 | contained at    |
|                 |                 |                 | least one       |
|                 |                 |                 | private key     |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

Analyse a descriptor:

.. code:: bash

   dash-cli getdescriptorinfo "pkh([d34db33f/84h/0h/0h]0279be667ef9dcbbac55a06295Ce870b07029Bfcdb2dce28d959f2815b16f81798)"

Result:

.. code:: json

   {
     "descriptor": "pkh([d34db33f/84'/0'/0']0279be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798)#9ffuvyvv",
     "checksum": "yrc20h56",
     "isrange": false,
     "issolvable": true,
     "hasprivatekeys": false
   }

*See also*

-  `ScanTxOutset </docs/core-api-ref-remote-procedure-calls-wallet#scantxoutset>`__:
   signs a message with the private key of an address.

SignMessageWithPrivKey
======================

*Added in Dash Core 0.12.3 / Bitcoin Core 0.13.0*

The ```signmessagewithprivkey``
RPC <core-api-ref-remote-procedure-calls-util#signmessagewithprivkey>`__
signs a message with a given private key.

*Parameter #1—the private key to sign with*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Private Key     | string (base58) | R               | The private key |
|                 |                 | equired(exactly | to sign the     |
|                 |                 | 1)              | message with    |
|                 |                 |                 | encoded in      |
|                 |                 |                 | base58check     |
|                 |                 |                 | using wallet    |
|                 |                 |                 | import format   |
|                 |                 |                 | (WIF)           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the message to sign*

======= ====== =================== ===================
Name    Type   Presence            Description
======= ====== =================== ===================
Message string Required(exactly 1) The message to sign
======= ====== =================== ===================

*Result—the message signature*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | string (base64) | R               | The signature   |
|                 |                 | equired(exactly | of the message, |
|                 |                 | 1)              | encoded in      |
|                 |                 |                 | base64.         |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.3*

Sign a the message “Hello, World!” using the following private key:

.. code:: bash

   dash-cli signmessagewithprivkey cNKbZBqUCjuBRSnAJWwFWxKESJ5Lw\
   G4uxBSJ1UeBNBGVRupFKr6S "Hello, World!"

Result:

.. code:: text

   IBx8jxFjutPlcZcFdQPlA2n/B4yTrYhH43qYJURKRj7LWhSD0ERE/nnRLOnXi/gwULUcqfqOKqnqkSvuJjlgEvc=

*See also*

-  `SignMessage </docs/core-api-ref-remote-procedure-calls-wallet#signmessage>`__:
   signs a message with the private key of an address.
-  `VerifyMessage </docs/core-api-ref-remote-procedure-calls-util#verifymessage>`__:
   verifies a signed message.

ValidateAddress
===============

The ```validateaddress``
RPC <core-api-ref-remote-procedure-calls-util#validateaddress>`__
returns information about the given Dash address. [block:callout] {
“type”: “danger”, “body”: “Breaking change(s) in Dash Core 18.0. See
parameter and/or response information for details.” } [/block]
*Parameter #1—a P2PKH or P2SH address*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Address         | string (base58) | R               | The P2PKH or    |
|                 |                 | equired(exactly | P2SH address to |
|                 |                 | 1)              | validate        |
|                 |                 |                 | encoded in      |
|                 |                 |                 | base58check     |
|                 |                 |                 | format          |
+-----------------+-----------------+-----------------+-----------------+

| *Result—information about the address* [block:callout] { “type”:
  “warning”, “body”: “Parts of this command have been deprecated and
  moved to the `getaddressinfo
  RPC <core-api-ref-remote-procedure-calls-wallet#getaddressinfo>`__.
  Clients must transition to using getaddressinfo to access this
  information before upgrading to v18.0.:raw-latex:`\nThe `following
  deprecated fields have moved to ``getaddressinfo`` and will only be
  shown here with ``-deprecatedrpc=validateaddress``: ``ismine``,
  ``iswatchonly``,:raw-latex:`\n`\ ``script``, ``hex``, ``pubkeys``,
  ``sigsrequired``, ``pubkey``, ``addresses``, ``embedded``,
  ``iscompressed``, ``account``, ``timestamp``, ``hdkeypath``.”,
  “title”: “Dash Core 0.17.0 Deprecations” } [/block] Name \| Type \|
  Presence \| Description — \| — \| — \| — ``result`` \| object \|
  Required(exactly 1) \| Information about the address →\ ``isvalid`` \|
  bool \| Required(exactly 1) \| Set to ``true`` if the address is a
  valid P2PKH or P2SH address; set to ``false`` otherwise →\ ``address``
  \| string (base58) \| Optional(0 or 1) \| The Dash address given as
  parameter →\ ``scriptPubKey`` \| string (hex) \| Optional(0 or 1) \|
  The hex encoded scriptPubKey generated by the address →\ ``isscript``
  \| bool \| Optional(0 or 1) \| Set to ``true`` if a P2SH address;
  otherwise set to ``false``. Only returned if the address is in the
  wallet →\ [STRIKEOUT:``ismine``] \| [STRIKEOUT:bool] \|
  [STRIKEOUT:Optional(0 or 1)] \| **Removed in Dash Core
  0.17.0**\ \ [STRIKEOUT:Set to ``true`` if the address belongs to the
  wallet; set to false if it does not. Only returned if wallet support
  enabled] →\ [STRIKEOUT:``iswatchonly``] \| [STRIKEOUT:bool] \|
  [STRIKEOUT:Optional(0 or 1)] \| **Removed in Dash Core
  0.17.0**\ \ [STRIKEOUT:Set to ``true`` if the address is watch-only.
  Otherwise set to ``false``. Only returned if address is in the wallet]
  →\ [STRIKEOUT:``script``] \| [STRIKEOUT:string] \|
  [STRIKEOUT:Optional(0 or 1)] \| **Removed in Dash Core
  0.17.0**\ \ [STRIKEOUT:Only returned for P2SH addresses belonging to
  this wallet. This is the type of script:• ``pubkey`` for a P2PK script
  inside P2SH• ``pubkeyhash`` for a P2PKH script inside P2SH•
  ``multisig`` for a multisig script inside P2SH• ``nonstandard`` for
  unknown scripts] →\ [STRIKEOUT:``hex``] \| [STRIKEOUT:string (hex)] \|
  [STRIKEOUT:Optional(0 or 1)] \| **Removed in Dash Core
  0.17.0**\ \ [STRIKEOUT:Only returned for P2SH addresses belonging to
  this wallet. This is the redeem script encoded as hex]
  →\ [STRIKEOUT:``addresses``] \| [STRIKEOUT:array] \|
  [STRIKEOUT:Optional(0 or 1)] \| **Removed in Dash Core
  0.17.0**\ \ [STRIKEOUT:Only returned for P2SH addresses belonging to
  the wallet. A P2PKH addresses used in this script, or the computed
  P2PKH addresses of any pubkeys in this script. This array will be
  empty for ``nonstandard`` script types] → →\ [STRIKEOUT:Address] \|
  [STRIKEOUT:string] \| [STRIKEOUT:Optional(0 or more)] \| [STRIKEOUT:A
  P2PKH address] →\ [STRIKEOUT:``sigsrequired``] \| [STRIKEOUT:number
  (int)] \| [STRIKEOUT:Optional(0 or 1)] \| **Removed in Dash Core
  0.17.0**\ \ [STRIKEOUT:Only returned for multisig P2SH addresses
  belonging to the wallet. The number of signatures required by this
  script] →\ [STRIKEOUT:``pubkey``] \| [STRIKEOUT:string (hex)] \|
  [STRIKEOUT:Optional(0 or 1)] \| **Removed in Dash Core
  0.17.0**\ \ [STRIKEOUT:The public key corresponding to this address.
  Only returned if the address is a P2PKH address in the wallet]
  →\ [STRIKEOUT:``iscompressed``] \| [STRIKEOUT:bool] \|
  [STRIKEOUT:Optional(0 or 1)] \| **Removed in Dash Core
  0.17.0**\ \ [STRIKEOUT:Set to ``true`` if a compressed public key or
  set to ``false`` if an uncompressed public key. Only returned if the
  address is a P2PKH address in the wallet] →\ [STRIKEOUT:``account``]
  \| [STRIKEOUT:string] \| [STRIKEOUT:Optional(0 or 1)] \| **Removed in
  Dash Core 0.17.0**\ \ [STRIKEOUT:The account this address belong to.
  May be an empty string for the default account. Only returned if the
  address belongs to the wallet] →\ [STRIKEOUT:``timestamp``] \|
  [STRIKEOUT:number (int)] \| [STRIKEOUT:Optional(0 or 1)] \| **Removed
  in Dash Core 0.17.0**\ \ [STRIKEOUT:The creation time of the key if
  available in seconds since epoch (Jan 1 1970 GMT)]
  →\ [STRIKEOUT:``hdkeypath``] \| [STRIKEOUT:string] \|
  [STRIKEOUT:Optional(0 or 1)] \| **Removed in Dash Core
  0.17.0**\ \ [STRIKEOUT:The HD keypath if the key is HD and available]
| →\ [STRIKEOUT:``hdmasterkeyid``] \| [STRIKEOUT:string (hash160)] \|
  [STRIKEOUT:Optional(0 or 1)] \| **Removed in Dash Core
  0.17.0**\ \ [STRIKEOUT:The Hash160 of the HD master public key]

*Example from Dash Core 0.17.0*

Validate the following P2PKH address from the wallet:

.. code:: bash

   dash-cli validateaddress yNpezfFDfoikDuT1f4iK75AiLp2YLPsGAb

Result:

.. code:: json

   {
     "isvalid": true,
     "address": "yNpezfFDfoikDuT1f4iK75AiLp2YLPsGAb",
     "scriptPubKey": "76a9141b767409bd8717b56cfcb00747811432ab1aa8a788ac",
     "isscript": false
   }

Validate the following P2SH multisig address from the wallet:

.. code:: bash

   dash-cli -testnet validateaddress 8uJLxDxk2gEMbidF5vT8XLS2UCgQmVcroW

Result:

.. code:: json

   {
     "isvalid": true,
     "address": "8uJLxDxk2gEMbidF5vT8XLS2UCgQmVcroW",
     "scriptPubKey": "a914a33155e490d146e656a9bac2cbee9c625ef42f0a87",
     "isscript": true
   }

*See also*

-  `ImportAddress </docs/core-api-ref-remote-procedure-calls-wallet#importaddress>`__:
   adds an address or pubkey script to the wallet without the associated
   private key, allowing you to watch for transactions affecting that
   address or pubkey script without being able to spend any of its
   outputs.
-  `GetNewAddress </docs/core-api-ref-remote-procedure-calls-wallet#getnewaddress>`__:
   returns a new Dash address for receiving payments. If an account is
   specified, payments received with the address will be credited to
   that account.
-  `GetAddressInfo </docs/core-api-ref-remote-procedure-calls-wallet#getaddressinfo>`__:
   returns information about the given Dash address.

VerifyMessage
=============

The ```verifymessage``
RPC <core-api-ref-remote-procedure-calls-util#verifymessage>`__ verifies
a signed message.

*Parameter #1—the address corresponding to the signing key*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Address         | string (base58) | R               | The P2PKH       |
|                 |                 | equired(exactly | address         |
|                 |                 | 1)              | corresponding   |
|                 |                 |                 | to the private  |
|                 |                 |                 | key which made  |
|                 |                 |                 | the signature.  |
|                 |                 |                 | A P2PKH address |
|                 |                 |                 | is a hash of    |
|                 |                 |                 | the public key  |
|                 |                 |                 | corresponding   |
|                 |                 |                 | to the private  |
|                 |                 |                 | key which made  |
|                 |                 |                 | the signature.  |
|                 |                 |                 | When the ECDSA  |
|                 |                 |                 | signature is    |
|                 |                 |                 | checked, up to  |
|                 |                 |                 | four possible   |
|                 |                 |                 | ECDSA public    |
|                 |                 |                 | keys will be    |
|                 |                 |                 | reconstructed   |
|                 |                 |                 | from from the   |
|                 |                 |                 | signature; each |
|                 |                 |                 | key will be     |
|                 |                 |                 | hashed and      |
|                 |                 |                 | compared        |
|                 |                 |                 | against the     |
|                 |                 |                 | P2PKH address   |
|                 |                 |                 | provided to see |
|                 |                 |                 | if any of them  |
|                 |                 |                 | match. If there |
|                 |                 |                 | are no matches, |
|                 |                 |                 | signature       |
|                 |                 |                 | validation will |
|                 |                 |                 | fail            |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the signature*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Signature       | string (base64) | R               | The signature   |
|                 |                 | equired(exactly | created by the  |
|                 |                 | 1)              | signer encoded  |
|                 |                 |                 | as base-64 (the |
|                 |                 |                 | format output   |
|                 |                 |                 | by the          |
|                 |                 |                 | `               |
|                 |                 |                 | ``signmessage`` |
|                 |                 |                 | RPC             |
|                 |                 |                 | <core-api-ref-r |
|                 |                 |                 | emote-procedure |
|                 |                 |                 | -calls-wallet#s |
|                 |                 |                 | ignmessage>`__) |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—the message*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Message         | string          | R               | The message     |
|                 |                 | equired(exactly | exactly as it   |
|                 |                 | 1)              | was signed      |
|                 |                 |                 | (e.g. no extra  |
|                 |                 |                 | whitespace)     |
+-----------------+-----------------+-----------------+-----------------+

*Result: ``true``, ``false``, or an error*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | boolean         | R               | Set to ``true`` |
|                 |                 | equired(exactly | if the message  |
|                 |                 | 1)              | was signed by a |
|                 |                 |                 | key             |
|                 |                 |                 | corresponding   |
|                 |                 |                 | to the provided |
|                 |                 |                 | P2PKH address;  |
|                 |                 |                 | set to          |
|                 |                 |                 | ``false`` if it |
|                 |                 |                 | was not signed  |
|                 |                 |                 | by that key;    |
|                 |                 |                 | set to JSON     |
|                 |                 |                 | ``null`` if an  |
|                 |                 |                 | error occurred  |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Check the signature on the message created in the example for
``signmessage``:

.. code:: bash

   dash-cli -testnet verifymessage \
     yNpezfFDfoikDuT1f4iK75AiLp2YLPsGAb \
     H4XULzfHCf16In2ECk9Ta9QxQPq639zQto2JA3OLlo3JbUdrClvJ89+A1z+Z9POd6l8LJhn1jGpQYF8mX4jkQvE= \
     'Hello, World!'

Result:

.. code:: json

   true

*See also*

-  `SignMessage </docs/core-api-ref-remote-procedure-calls-wallet#signmessage>`__:
   signs a message with the private key of an address.
