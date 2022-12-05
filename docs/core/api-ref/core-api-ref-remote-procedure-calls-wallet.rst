[block:callout] { “type”: “danger”, “body”: “RPCs that require wallet
support are **not available on masternodes** for security reasons. Such
RPCs are designated with a "*Requires wallet support*" message.”,
“title”: “Wallet Support” } [/block] # AbandonTransaction

*Added in Bitcoin Core 0.12.0*

The ```abandontransaction``
RPC <core-api-ref-remote-procedure-calls-wallet#abandontransaction>`__
marks an in-wallet transaction and all its in-wallet descendants as
abandoned. This allows their inputs to be respent.

*Parameter #1—a transaction identifier (TXID)*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| TXID            | string (hex)    | R               | The TXID of the |
|                 |                 | equired(exactly | transaction     |
|                 |                 | 1)              | that you want   |
|                 |                 |                 | to abandon. The |
|                 |                 |                 | TXID must be    |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+

*Result—``null`` on success*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | null            | R               | JSON ``null``   |
|                 |                 | equired(exactly | when the        |
|                 |                 | 1)              | transaction and |
|                 |                 |                 | all descendants |
|                 |                 |                 | were abandoned  |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Abandons the transaction on your node.

.. code:: bash

   dash-cli abandontransaction fa3970c341c9f5de6ab13f128cbfec58d732e736a505fe32137ad551c799ecc4

Result (no output from ``dash-cli`` because result is set to ``null``).

*See also*

-  `SendRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#sendrawtransaction>`__:
   validates a transaction and broadcasts it to the peer-to-peer
   network.

AbortRescan
===========

The ```abortrescan``
RPC <core-api-ref-remote-procedure-calls-wallet#abortrescan>`__ Stops
current wallet rescan

Stops current wallet rescan triggered e.g. by an ```importprivkey``
RPC <core-api-ref-remote-procedure-calls-wallet#importprivkey>`__ call.

*Parameters: none*

*Result—``true`` on success*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | null            | R               | ``true`` when   |
|                 |                 | equired(exactly | the command was |
|                 |                 | 1)              | successful or   |
|                 |                 |                 | ``false`` if    |
|                 |                 |                 | not successful. |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.15.0*

Abort the running wallet rescan

.. code:: bash

   dash-cli -testnet abortrescan

Result:

.. code:: text

   true

*See also: none*

AddMultiSigAddress
==================

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**)” } [/block]

The ```addmultisigaddress``
RPC <core-api-ref-remote-procedure-calls-wallet#addmultisigaddress>`__
adds a P2SH multisig address to the wallet.

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

*Parameter #2—the full public keys, or addresses for known public keys*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Keys Or         | array           | R               | An array of     |
| Addresses       |                 | equired(exactly | strings with    |
|                 |                 | 1)              | each string     |
|                 |                 |                 | being a public  |
|                 |                 |                 | key or address  |
+-----------------+-----------------+-----------------+-----------------+
| →Key Or Address | string          | Required(1 or   | A public key    |
|                 |                 | more)           | against which   |
|                 |                 |                 | signatures will |
|                 |                 |                 | be checked.     |
|                 |                 |                 | Alternatively,  |
|                 |                 |                 | this may be a   |
|                 |                 |                 | P2PKH address   |
|                 |                 |                 | belonging to    |
|                 |                 |                 | the wallet—the  |
|                 |                 |                 | corresponding   |
|                 |                 |                 | public key will |
|                 |                 |                 | be substituted. |
|                 |                 |                 | There must be   |
|                 |                 |                 | at least as     |
|                 |                 |                 | many keys as    |
|                 |                 |                 | specified by    |
|                 |                 |                 | the Required    |
|                 |                 |                 | parameter, and  |
|                 |                 |                 | there may be    |
|                 |                 |                 | more keys       |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—label*

===== ====== ================ ===================================
Name  Type   Presence         Description
===== ====== ================ ===================================
Label string Optional(0 or 1) A label to assign the addresses to.
===== ====== ================ ===================================

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

*Example from Dash Core 0.17.0*

Adding a 1-of-2 P2SH multisig address with the label “test label” by
combining one P2PKH address and one full public key:

.. code:: bash

   dash-cli -testnet addmultisigaddress 1 '''
     [
       "ySxkBWzPwMrZLAY9ZPitMnSwf4NSUBPbiH",
       "02594523b004e82849a66b3da096b1e680bf2ed5f7d03a3443c027aa5777bb6223"
     ]
   ''' \
    'test label'

Result:

.. code:: json

   {
     "address": "8jYUv8hJcbSUPbwYmzp1XMPU6SXoic3hwi",
     "redeemScript": "512103283a224c2c014d1d0ef82b00470b6b277d71e227c0e2394f9baade5d666e57d32102594523b004e82849a66b3da096b1e680bf2ed5f7d03a3443c027aa5777bb622352ae"
   }

(New P2SH multisig address also stored in wallet.)

*See also*

-  `CreateMultiSig </docs/core-api-ref-remote-procedure-calls-util#createmultisig>`__:
   creates a P2SH multi-signature address.
-  `DecodeScript </docs/core-api-ref-remote-procedure-calls-raw-transactions#decodescript>`__:
   decodes a hex-encoded P2SH redeem script.

BackupWallet
============

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**)” } [/block]

The ```backupwallet``
RPC <core-api-ref-remote-procedure-calls-wallet#backupwallet>`__ safely
copies ``wallet.dat`` to the specified file, which can be a directory or
a path with filename.

*Parameter #1—destination directory or filename*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Destination     | string          | R               | A filename or   |
|                 |                 | equired(exactly | directory name. |
|                 |                 | 1)              | If a filename,  |
|                 |                 |                 | it will be      |
|                 |                 |                 | created or      |
|                 |                 |                 | overwritten. If |
|                 |                 |                 | a directory     |
|                 |                 |                 | name, the file  |
|                 |                 |                 | ``wallet.dat``  |
|                 |                 |                 | will be created |
|                 |                 |                 | or overwritten  |
|                 |                 |                 | within that     |
|                 |                 |                 | directory       |
+-----------------+-----------------+-----------------+-----------------+

*Result—``null`` or error*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | null            | R               | Always ``null`` |
|                 |                 | equired(exactly | whether success |
|                 |                 | 1)              | or failure. The |
|                 |                 |                 | JSON-RPC error  |
|                 |                 |                 | and message     |
|                 |                 |                 | fields will be  |
|                 |                 |                 | set if a        |
|                 |                 |                 | failure         |
|                 |                 |                 | occurred        |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet backupwallet /tmp/backup.dat

*See also*

-  `DumpWallet <core-api-ref-remote-procedure-calls-wallet#dumpwallet>`__:
   creates or overwrites a file with all wallet keys in a human-readable
   format.
-  `ImportWallet <core-api-ref-remote-procedure-calls-wallet#importwallet>`__:
   imports private keys from a file in wallet dump file format (see the
   ```dumpwallet``
   RPC <core-api-ref-remote-procedure-calls-wallet#dumpwallet>`__).
   These keys will be added to the keys currently in the wallet. This
   call may need to rescan all or parts of the block chain for
   transactions affecting the newly-added keys, which may take several
   minutes.

CreateWallet
============

[block:callout] { “type”: “success”, “body”: “Added in Dash Core 0.17.0”
} [/block]

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**)” } [/block] The ```createwallet``
RPC <core-api-ref-remote-procedure-calls-wallet#createwallet>`__ creates
and loads a new wallet.

*Parameter #1—wallet name*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``wallet_name`` | string          | R               | The name for    |
|                 |                 | equired(exactly | the new wallet. |
|                 |                 | 1)              | If this is a    |
|                 |                 |                 | path, the       |
|                 |                 |                 | wallet will be  |
|                 |                 |                 | created at the  |
|                 |                 |                 | path location.  |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—disable private keys*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``disable       | bool            | Optional(0 or   | Disable the     |
| _private_keys`` |                 | 1)              | possibility of  |
|                 |                 |                 | private keys.   |
|                 |                 |                 | Only watchonlys |
|                 |                 |                 | are possible in |
|                 |                 |                 | this mode.      |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—blank*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``blank``       | bool            | Optional(0 or   | Create a blank  |
|                 |                 | 1)              | wallet. A blank |
|                 |                 |                 | wallet has no   |
|                 |                 |                 | keys or HD      |
|                 |                 |                 | seed. Use       |
|                 |                 |                 | ```u            |
|                 |                 |                 | pgradetohd`` <# |
|                 |                 |                 | upgradetohd>`__ |
|                 |                 |                 | to add an HD    |
|                 |                 |                 | seed.           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #4—passphrase*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``passphrase``  | string          | Optional(0 or   | Encrypt the     |
|                 |                 | 1)              | wallet with     |
|                 |                 |                 | this            |
|                 |                 |                 | passphrase.     |
+-----------------+-----------------+-----------------+-----------------+

*Result—wallet name and any warnings*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An object       |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | information     |
|                 |                 |                 | about wallet    |
|                 |                 |                 | creation        |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``name``     | string          | R               | The wallet name |
|                 |                 | equired(exactly | if created      |
|                 |                 | 1)              | successfully.   |
|                 |                 |                 | If the wallet   |
|                 |                 |                 | was created     |
|                 |                 |                 | using a full    |
|                 |                 |                 | path, the       |
|                 |                 |                 | ``wallet_name`` |
|                 |                 |                 | will be the     |
|                 |                 |                 | full path       |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``warning``  | string          | R               | Warning message |
|                 |                 | equired(exactly | if wallet was   |
|                 |                 | 1)              | not loaded      |
|                 |                 |                 | cleanly.        |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

.. code:: bash

   dash-cli -testnet createwallet new-wallet

Result:

.. code:: json

   {
     "name": "new-wallet",
     "warning": ""
   }

[block:callout] { “type”: “info”, “body”: “In the example above, a new
directory named ``new-wallet`` was created in the current data directory
(``~/.dashcore/testnet3/``). This new directory contains the wallet.dat
file and other related wallet files for the new wallet.” } [/block] *See
also*

-  `LoadWallet <core-api-ref-remote-procedure-calls-wallet#loadwallet>`__:
   loads a wallet from a wallet file or directory.

DumpHDInfo
==========

The ```dumphdinfo``
RPC <core-api-ref-remote-procedure-calls-wallet#dumphdinfo>`__ returns
an object containing sensitive private info about this HD wallet

*Parameters: none*

*Result—HD wallet information*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | object          | R               | An object       |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | sensitive       |
|                 |                 |                 | private info    |
|                 |                 |                 | about this HD   |
|                 |                 |                 | wallet.         |
+-----------------+-----------------+-----------------+-----------------+
| → \ ``hdseed``  | string          | R               | The BIP-32 HD   |
|                 |                 | equired(exactly | seed (in hex)   |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | The BIP-39      |
| \ ``mnemonic``  |                 | equired(exactly | mnemonic for    |
|                 |                 | 1)              | this HD wallet  |
|                 |                 |                 | (English words) |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | The BIP-39      |
| \ ``mnemo       |                 | equired(exactly | mnemonic        |
| nicpassphrase`` |                 | 1)              | passphrase for  |
|                 |                 |                 | this HD wallet  |
|                 |                 |                 | (may be empty)  |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet dumphdinfo

Result (truncated for security reasons):

.. code:: json

   {
     "hdseed": "20c63c3fb298ebd52de3 ...",
     "mnemonic": "cost circle shiver ...",
     "mnemonicpassphrase": ""
   }

*See also: none*

DumpPrivKey
===========

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**). Requires an unlocked wallet or an
unencrypted wallet.” } [/block]

The ```dumpprivkey``
RPC <core-api-ref-remote-procedure-calls-wallet#dumpprivkey>`__ returns
the wallet-import-format (WIP) private key corresponding to an address.
(But does not remove it from the wallet.)

*Parameter #1—the address corresponding to the private key to get*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| P2PKH Address   | string (base58) | R               | The P2PKH       |
|                 |                 | equired(exactly | address         |
|                 |                 | 1)              | corresponding   |
|                 |                 |                 | to the private  |
|                 |                 |                 | key you want    |
|                 |                 |                 | returned. Must  |
|                 |                 |                 | be the address  |
|                 |                 |                 | corresponding   |
|                 |                 |                 | to a private    |
|                 |                 |                 | key in this     |
|                 |                 |                 | wallet          |
+-----------------+-----------------+-----------------+-----------------+

*Result—the private key*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | string (base58) | R               | The private key |
|                 |                 | equired(exactly | encoded as      |
|                 |                 | 1)              | base58check     |
|                 |                 |                 | using wallet    |
|                 |                 |                 | import format   |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet dumpprivkey ycBuREgSskHHkWLxDa9A5WppCki6PfFycL

Result:

.. code:: text

   cQZZ4awQvcXXyES3CmUJqSgeTobQm9t9nyUr337kvUtsWsnvvMyw

*See also*

-  `ImportPrivKey <core-api-ref-remote-procedure-calls-wallet#importprivkey>`__:
   adds a private key to your wallet. The key should be formatted in the
   wallet import format created by the ```dumpprivkey``
   RPC <core-api-ref-remote-procedure-calls-wallet#dumpprivkey>`__.
-  `DumpWallet <core-api-ref-remote-procedure-calls-wallet#dumpwallet>`__:
   creates or overwrites a file with all wallet keys in a human-readable
   format.

DumpWallet
==========

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**). Requires an unlocked wallet or an
unencrypted wallet.” } [/block]

The ```dumpwallet``
RPC <core-api-ref-remote-procedure-calls-wallet#dumpwallet>`__ creates
or overwrites a file with all wallet keys in a human-readable format.

*Parameter #1—a filename*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Filename        | string          | R               | The filename    |
|                 |                 | equired(exactly | with path       |
|                 |                 | 1)              | (either         |
|                 |                 |                 | absolute or     |
|                 |                 |                 | relative to     |
|                 |                 |                 | Dash Core) into |
|                 |                 |                 | which the       |
|                 |                 |                 | wallet dump     |
|                 |                 |                 | will be placed. |
|                 |                 |                 | An existing     |
|                 |                 |                 | file with that  |
|                 |                 |                 | name will be    |
|                 |                 |                 | overwritten.    |
+-----------------+-----------------+-----------------+-----------------+

*Result—information about exported wallet*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An object       |
|                 |                 | equired(exactly | describing      |
|                 |                 | 1)              | dumped wallet   |
|                 |                 |                 | file            |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``da         | string          | R               | Dash Core build |
| shcoreversion`` |                 | equired(exactly | details         |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``la         | int             | R               | Height of the   |
| stblockheight`` |                 | equired(exactly | most recent     |
|                 |                 | 1)              | block received  |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | string (hex)    | R               | Hash of the     |
| lastblockhash`` |                 | equired(exactly | most recent     |
|                 |                 | 1)              | block received  |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | string          | R               | Timestamp of    |
| lastblocktime`` |                 | equired(exactly | the most recent |
|                 |                 | 1)              | block received  |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``keys``     | int             | R               | Number of keys  |
|                 |                 | equired(exactly | dumped          |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``filename`` | string          | R               | Name of the     |
|                 |                 | equired(exactly | file the wallet |
|                 |                 | 1)              | was dumped to   |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``warning``  | string          | R               | Warning to not  |
|                 |                 | equired(exactly | share the file  |
|                 |                 | 1)              | due to it       |
|                 |                 |                 | containing the  |
|                 |                 |                 | private keys    |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.13.0*

Create a wallet dump and then print its first 10 lines.

.. code:: bash

   dash-cli -testnet dumpwallet /tmp/dump.txt
   head /tmp/dump.txt

Results:

.. code:: json

   {
     "dashcoreversion": "v0.17.0.0",
     "lastblockheight": 250186,
     "lastblockhash": "0000000000a82fb1890de5da4740d0671910a436fe6fc4503a3e553adef073b4",
     "lastblocktime": "2018-10-23T12:50:44Z",
     "keys": 8135,
     "file": "/tmp/dump.txt",
     "warning": "/tmp/dump.txt file contains all private keys from this wallet. Do not share it with anyone!"
   }

Results (the first 10 lines of the file):

.. code:: bash

   >>>>>>>># Wallet dump created by Dash Core v0.13.0.0
   >>>>>>>># * Created on 2020-12-09T18:40:52Z
   >>>>>>>># * Best block at time of backup was 405635 (000000b2304f57eefd42cdd943e7736d479468beb08049b8f88d11ebc7cf6f02),
   >>>>>>>>#   mined on 2020-12-09T18:40:23Z

   cQZZ4awQvcXXyES3CmUJqSgeTobQm9t9nyUr337kvUtsWsnvvMyw 2018-12-14T17:24:37Z change=1 # addr=ycBuREgSskHHkWLxDa9A5WppCki6PfFycL
   cTBRPnJoPjEMh67v1zes437v8Po5bFLDWKgEudTJMhVaLs1ZVGJe 2018-12-14T17:24:37Z change=1 # addr=yNsWkgPLN1u7p5dfWYnasYdgirU2J3tjUj
   cRkkwrFnQUrih3QiT87sNy1AxyfjzqVYSyVYuL3qnJcSiQfE4QJa 2018-12-14T17:24:37Z change=1 # addr=yRkHzRbRKn8gBp5826mbaBvxLuBBNDVQg3
   cQM7KoqQjHCCTrDhnfBEY1vpW9W65zRvaQeTb41UbFb6WX8Q8UkQ 2018-12-14T17:24:37Z change=1 # addr=yVEdefApUYiDLHApvvWCK5afTtJeQada8Y
   cTGSKYaQTQabnjNSwCqpjYXiucVujTXiwp9dzmJV9cNAiayAJusi 2018-12-14T17:24:37Z change=1 # addr=ybQYgp21ZyZK8JuMLb2CVwG4TaWrXVXD5M

*See also*

-  `BackupWallet <core-api-ref-remote-procedure-calls-wallet#backupwallet>`__:
   safely copies ``wallet.dat`` to the specified file, which can be a
   directory or a path with filename.
-  `ImportWallet <core-api-ref-remote-procedure-calls-wallet#importwallet>`__:
   imports private keys from a file in wallet dump file format (see the
   ```dumpwallet``
   RPC <core-api-ref-remote-procedure-calls-wallet#dumpwallet>`__).
   These keys will be added to the keys currently in the wallet. This
   call may need to rescan all or parts of the block chain for
   transactions affecting the newly-added keys, which may take several
   minutes.

EncryptWallet
=============

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block]

The ```encryptwallet``
RPC <core-api-ref-remote-procedure-calls-wallet#encryptwallet>`__
encrypts the wallet with a passphrase. This is only to enable encryption
for the first time. After encryption is enabled, you will need to enter
the passphrase to use private keys. [block:callout] { “type”: “warning”,
“body”: “**Warning:** if using this RPC on the command line, remember
that your shell probably saves your command lines (including the value
of the passphrase parameter). In addition, there is no RPC to completely
disable encryption. If you want to return to an unencrypted wallet, you
must create a new wallet and restore your data from a backup made with
the ```dumpwallet``
RPC <core-api-ref-remote-procedure-calls-wallet#dumpwallet>`__.” }
[/block] *Parameter #1—a passphrase*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Passphrase      | string          | R               | The passphrase  |
|                 |                 | equired(exactly | to use for the  |
|                 |                 | 1)              | encrypted       |
|                 |                 |                 | wallet. Must be |
|                 |                 |                 | at least one    |
|                 |                 |                 | character       |
+-----------------+-----------------+-----------------+-----------------+

*Result—a notice (with program shutdown)*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | string          | R               | A notice that   |
|                 |                 | equired(exactly | the server is   |
|                 |                 | 1)              | stopping and    |
|                 |                 |                 | that you need   |
|                 |                 |                 | to make a new   |
|                 |                 |                 | backup. The     |
|                 |                 |                 | wallet is now   |
|                 |                 |                 | encrypted       |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet encryptwallet "test"

Result:

.. code:: text

   Wallet encrypted; Dash Core server stopping, restart to run with encrypted wallet.
   The keypool has been flushed and a new HD seed was generated (if you are using
   HD). You need to make a new backup.

*See also*

-  `WalletPassphrase <core-api-ref-remote-procedure-calls-wallet#walletpassphrase>`__:
   stores the wallet decryption key in memory for the indicated number
   of seconds. Issuing the ``walletpassphrase`` command while the wallet
   is already unlocked will set a new unlock time that overrides the old
   one.
-  `WalletLock <core-api-ref-remote-procedure-calls-wallet#walletlock>`__:
   removes the wallet encryption key from memory, locking the wallet.
   After calling this method, you will need to call ``walletpassphrase``
   again before being able to call any methods which require the wallet
   to be unlocked.
-  `WalletPassphraseChange <core-api-ref-remote-procedure-calls-wallet#walletpassphrasechange>`__:
   changes the wallet passphrase from ‘old passphrase’ to ‘new
   passphrase’.

GetAddressInfo
==============

[block:callout] { “type”: “success”, “body”: “Added in Dash Core 0.17.0”
} [/block]

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block] The ```getaddressinfo``
RPC <core-api-ref-remote-procedure-calls-wallet#getaddressinfo>`__
returns information about the given Dash address. Note: Some information
requires the address to be in the wallet.

*Parameter #1—a P2PKH or P2SH address*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Address         | string (base58) | R               | The P2PKH or    |
|                 |                 | equired(exactly | P2SH address    |
|                 |                 | 1)              | encoded in      |
|                 |                 |                 | base58check     |
|                 |                 |                 | format          |
+-----------------+-----------------+-----------------+-----------------+

*Result—returns information about the address*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | Information     |
|                 |                 | equired(exactly | about the       |
|                 |                 | 1)              | address         |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``address``  | string (base58) | R               | The Dash        |
|                 |                 | equired(exactly | address given   |
|                 |                 | 1)              | as parameter    |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | string (hex)    | R               | The hex encoded |
| `scriptPubKey`` |                 | equired(exactly | scriptPubKey    |
|                 |                 | 1)              | generated by    |
|                 |                 |                 | the address     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``ismine``   | bool            | R               | Set to ``true`` |
|                 |                 | equired(exactly | if the address  |
|                 |                 | 1)              | belongs to the  |
|                 |                 |                 | wallet; set to  |
|                 |                 |                 | false if it     |
|                 |                 |                 | does not. Only  |
|                 |                 |                 | returned if     |
|                 |                 |                 | wallet support  |
|                 |                 |                 | enabled         |
+-----------------+-----------------+-----------------+-----------------+
| →\              | bool            | R               | Set to ``true`` |
| ``iswatchonly`` |                 | equired(exactly | if the address  |
|                 |                 | 1)              | is watch-only.  |
|                 |                 |                 | Otherwise set   |
|                 |                 |                 | to ``false``.   |
|                 |                 |                 | Only returned   |
|                 |                 |                 | if address is   |
|                 |                 |                 | in the wallet   |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``solvable`` | bool            | R               | Whether we know |
|                 |                 | equired(exactly | how to spend    |
|                 |                 | 1)              | coins sent to   |
|                 |                 |                 | this address,   |
|                 |                 |                 | ignoring the    |
|                 |                 |                 | possible lack   |
|                 |                 |                 | of private keys |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``desc``     | bool            | Optional(0 or   | A descriptor    |
|                 |                 | 1)              | for spending    |
|                 |                 |                 | coins sent to   |
|                 |                 |                 | this address    |
|                 |                 |                 | (only when      |
|                 |                 |                 | solvable)       |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``isscript`` | bool            | R               | Set to ``true`` |
|                 |                 | equired(exactly | if a P2SH       |
|                 |                 | 1)              | address;        |
|                 |                 |                 | otherwise set   |
|                 |                 |                 | to ``false``.   |
|                 |                 |                 | Only returned   |
|                 |                 |                 | if the address  |
|                 |                 |                 | is in the       |
|                 |                 |                 | wallet          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``ischange`` | bool            | R               | Set to ``true`` |
|                 |                 | equired(exactly | if the address  |
|                 |                 | 1)              | was used for    |
|                 |                 |                 | change output.  |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``script``   | string          | Optional(0 or   | Only returned   |
|                 |                 | 1)              | for P2SH        |
|                 |                 |                 | addresses       |
|                 |                 |                 | belonging to    |
|                 |                 |                 | this wallet.    |
|                 |                 |                 | This is the     |
|                 |                 |                 | type of         |
|                 |                 |                 | script:•        |
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
| →\ ``hex``      | string (hex)    | Optional(0 or   | Only returned   |
|                 |                 | 1)              | for P2SH        |
|                 |                 |                 | addresses       |
|                 |                 |                 | belonging to    |
|                 |                 |                 | this wallet.    |
|                 |                 |                 | This is the     |
|                 |                 |                 | redeem script   |
|                 |                 |                 | encoded as hex  |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``pubkeys``  | array           | Optional(0 or   | Array of        |
|                 |                 | 1)              | pubkeys         |
|                 |                 |                 | associated with |
|                 |                 |                 | the known       |
|                 |                 |                 | redeemscript    |
|                 |                 |                 | (only if        |
|                 |                 |                 | ``script`` is   |
|                 |                 |                 | “multisig”)     |
+-----------------+-----------------+-----------------+-----------------+
| → →Pubkey       | string          | Optional(0 or   | A public key    |
|                 |                 | more)           |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | number (int)    | Optional(0 or   | Only returned   |
| `sigsrequired`` |                 | 1)              | for multisig    |
|                 |                 |                 | P2SH addresses  |
|                 |                 |                 | belonging to    |
|                 |                 |                 | the wallet. The |
|                 |                 |                 | number of       |
|                 |                 |                 | signatures      |
|                 |                 |                 | required by     |
|                 |                 |                 | this script     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``pubkey``   | string (hex)    | Optional(0 or   | The public key  |
|                 |                 | 1)              | corresponding   |
|                 |                 |                 | to this         |
|                 |                 |                 | address. Only   |
|                 |                 |                 | returned if the |
|                 |                 |                 | address is a    |
|                 |                 |                 | P2PKH address   |
|                 |                 |                 | in the wallet   |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | bool            | Optional(0 or   | Set to ``true`` |
| `iscompressed`` |                 | 1)              | if a compressed |
|                 |                 |                 | public key or   |
|                 |                 |                 | set to          |
|                 |                 |                 | ``false`` if an |
|                 |                 |                 | uncompressed    |
|                 |                 |                 | public key.     |
|                 |                 |                 | Only returned   |
|                 |                 |                 | if the address  |
|                 |                 |                 | is a P2PKH      |
|                 |                 |                 | address in the  |
|                 |                 |                 | wallet          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``label``    | string          | Optional(0 or   | The label       |
|                 |                 | 1)              | associated with |
|                 |                 |                 | the address,    |
|                 |                 |                 | ``""`` is the   |
|                 |                 |                 | default account |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | Optional(0 or   | The creation    |
| \ ``timestamp`` |                 | 1)              | time of the key |
|                 |                 |                 | if available in |
|                 |                 |                 | seconds since   |
|                 |                 |                 | epoch (Jan 1    |
|                 |                 |                 | 1970 GMT)       |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | Optional(0 or   | The ID of the   |
| \ ``hdchainid`` | (hash160)       | 1)              | HD chain        |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | Optional(0 or   | The HD keypath  |
| \ ``hdkeypath`` |                 | 1)              | if the key is   |
|                 |                 |                 | HD and          |
|                 |                 |                 | available       |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``hdmast     | string          | Optional(0 or   | The fingerprint |
| erfingerprint`` |                 | 1)              | of the master   |
|                 |                 |                 | key             |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``labels``   | array           | Optional(0 or   | Array of labels |
|                 |                 | 1)              | associated with |
|                 |                 |                 | the address     |
+-----------------+-----------------+-----------------+-----------------+
| →→Label Data    | object          | Optional(0 or   | JSON object     |
|                 |                 | 1)              | containing      |
|                 |                 |                 | label data      |
+-----------------+-----------------+-----------------+-----------------+
| →→→\ ``name``   | string          | Optional(0 or   | The label       |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | Optional(0 or   | Purpose of      |
| →→\ ``purpose`` |                 | 1)              | address         |
|                 |                 |                 | (``send`` for   |
|                 |                 |                 | sending         |
|                 |                 |                 | address,        |
|                 |                 |                 | ``receive`` for |
|                 |                 |                 | receiving       |
|                 |                 |                 | address         |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

Get info for the following P2PKH address from the wallet:

.. code:: bash

   dash-cli getaddressinfo yYvsn6vdnkeq9VG1JbkfqKbjv3gUmFmnny

Result:

.. code:: json

   {
     "address": "yTJ2xuFyeH4C34gTYs3ApV8xaXxfTTQ1WM",
     "scriptPubKey": "76a9144c8486d8bde43d6dec760275ec1ca2e1c216dd2188ac",
     "ismine": true,
     "solvable": true,
     "desc": "pkh([792361f1/44'/1'/0'/0/402]03928f6313c0157ee1e0b0c882e1d53b81d6873d7fce528448b4d6298635ca82f5)#yhd8346g",
     "iswatchonly": false,
     "isscript": false,
     "pubkey": "03928f6313c0157ee1e0b0c882e1d53b81d6873d7fce528448b4d6298635ca82f5",
     "iscompressed": true,
     "label": "",
     "ischange": false,
     "timestamp": 1611610816,
     "hdchainid": "0a33f0f772532b643e440aa7e0347ee6b6f7fa5e0ebe145e56cc3f5709ac1650",
     "hdkeypath": "m/44'/1'/0'/0/402",
     "hdmasterfingerprint": "792361f1",
     "labels": [
       {
         "name": "",
         "purpose": "receive"
       }
     ]
   }

Get info for the following P2SH multisig address from the wallet:

.. code:: bash

   dash-cli -testnet getaddressinfo 8uJLxDxk2gEMbidF5vT8XLS2UCgQmVcroW

Result:

.. code:: json

   {
     "address": "8uJLxDxk2gEMbidF5vT8XLS2UCgQmVcroW",
     "scriptPubKey": "a914a33155e490d146e656a9bac2cbee9c625ef42f0a87",
     "ismine": false,
     "solvable": false,
     "iswatchonly": false,
     "isscript": true,
     "ischange": false,
     "labels": [
     ]
   }

*See also*

-  `ImportAddress <core-api-ref-remote-procedure-calls-wallet#importaddress>`__:
   adds an address or pubkey script to the wallet without the associated
   private key, allowing you to watch for transactions affecting that
   address or pubkey script without being able to spend any of its
   outputs.
-  `GetNewAddress <core-api-ref-remote-procedure-calls-wallet#getnewaddress>`__:
   returns a new Dash address for receiving payments. If an account is
   specified, payments received with the address will be credited to
   that account.
-  `ValidateAddress </docs/core-api-ref-remote-procedure-calls-util#validateaddress>`__:
   returns information about the given Dash address.

GetAddressesByLabel
===================

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**)” } [/block]

The ```getaddressesbylabel``
RPC <core-api-ref-remote-procedure-calls-wallet#getaddressesbylabel>`__
returns a list of every address assigned to a particular label.

*Parameter #1—the label name*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Label           | string          | R               | The name of the |
|                 |                 | equired(exactly | label           |
|                 |                 | 1)              | associated with |
|                 |                 |                 | the addresses   |
|                 |                 |                 | to get. To get  |
|                 |                 |                 | addresses from  |
|                 |                 |                 | the default     |
|                 |                 |                 | account, pass   |
|                 |                 |                 | an empty string |
|                 |                 |                 | (``""``).       |
+-----------------+-----------------+-----------------+-----------------+

*Result—a list of addresses*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | A JSON object   |
|                 |                 | equired(exactly | containing all  |
|                 |                 | 1)              | addresses       |
|                 |                 |                 | belonging to    |
|                 |                 |                 | the specified   |
|                 |                 |                 | label as keys.  |
+-----------------+-----------------+-----------------+-----------------+
| →Address        | object          | Optional(1 or   | A JSON object   |
|                 |                 | more)           | with            |
|                 |                 |                 | information     |
|                 |                 |                 | about a P2PKH   |
|                 |                 |                 | or P2SH address |
|                 |                 |                 | belonging to    |
|                 |                 |                 | the label       |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``purpose`` | string          | Optional(1 or   | Purpose of      |
|                 |                 | more)           | address         |
|                 |                 |                 | (``send`` for   |
|                 |                 |                 | sending         |
|                 |                 |                 | address,        |
|                 |                 |                 | ``receive`` for |
|                 |                 |                 | receiving       |
|                 |                 |                 | address)        |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

Get the addresses assigned to the label “doc test”:

.. code:: bash

   dash-cli -testnet getaddressesbylabel "doc test"

Result:

.. code:: json

   {
     "yacJKd6tRz2JSn8Wfp9GKgCbuowAEBivrA": {
       "purpose": "receive"
     }
   }

*See also*

-  `GetAccount </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#getaccount>`__:
   returns the name of the account associated with the given address.
-  `GetBalance <core-api-ref-remote-procedure-calls-wallet#getbalance>`__:
   gets the balance in decimal dash across all accounts or for a
   particular account.

GetBalance
==========

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block]

The ```getbalance``
RPC <core-api-ref-remote-procedure-calls-wallet#getbalance>`__ gets the
total *available balance* in Dash. The *available balance* is what the
wallet considers currently spendable, and is thus affected by options
which limit spendability such as ``-spendzeroconfchange``.

*Parameter #1—unused parameter*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Unused          | string          | Optional(0 or   | **Deprecated:   |
|                 |                 | 1)              | (previously     |
|                 |                 |                 | account) will   |
|                 |                 |                 | be removed in a |
|                 |                 |                 | later version   |
|                 |                 |                 | of Dash         |
|                 |                 |                 | Core**\ Remains |
|                 |                 |                 | for backward    |
|                 |                 |                 | compatibility.  |
|                 |                 |                 | Must be         |
|                 |                 |                 | excluded or set |
|                 |                 |                 | to ``"*"``.     |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the minimum number of confirmations*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Confirmations   | number (int)    | Optional(0 or   | The minimum     |
|                 |                 | 1)              | number of       |
|                 |                 |                 | confirmations   |
|                 |                 |                 | an              |
|                 |                 |                 | exter           |
|                 |                 |                 | nally-generated |
|                 |                 |                 | transaction     |
|                 |                 |                 | must have       |
|                 |                 |                 | before it is    |
|                 |                 |                 | counted towards |
|                 |                 |                 | the balance.    |
|                 |                 |                 | Transactions    |
|                 |                 |                 | generated by    |
|                 |                 |                 | this node are   |
|                 |                 |                 | counted         |
|                 |                 |                 | immediately.    |
|                 |                 |                 | Typically,      |
|                 |                 |                 | exter           |
|                 |                 |                 | nally-generated |
|                 |                 |                 | transactions    |
|                 |                 |                 | are payments to |
|                 |                 |                 | this wallet and |
|                 |                 |                 | transactions    |
|                 |                 |                 | generated by    |
|                 |                 |                 | this node are   |
|                 |                 |                 | payments to     |
|                 |                 |                 | other wallets.  |
|                 |                 |                 | Use ``0`` to    |
|                 |                 |                 | count           |
|                 |                 |                 | unconfirmed     |
|                 |                 |                 | transactions.   |
|                 |                 |                 | Default is      |
|                 |                 |                 | ``1``           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—whether to add the balance from transactions locked via
InstantSend*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| addlocked       | bool            | O               | Add the balance |
|                 |                 | ptional(exactly | from            |
|                 |                 | 1)              | InstantSend     |
|                 |                 |                 | locked          |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #4—whether to include watch-only addresses*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Include         | bool            | Optional(0 or   | If set to       |
| Watch-Only      |                 | 1)              | ``true``,       |
|                 |                 |                 | include         |
|                 |                 |                 | watch-only      |
|                 |                 |                 | addresses in    |
|                 |                 |                 | details and     |
|                 |                 |                 | calculations as |
|                 |                 |                 | if they were    |
|                 |                 |                 | regular         |
|                 |                 |                 | addresses       |
|                 |                 |                 | belonging to    |
|                 |                 |                 | the wallet. If  |
|                 |                 |                 | set to          |
|                 |                 |                 | ``false`` (the  |
|                 |                 |                 | default), treat |
|                 |                 |                 | watch-only      |
|                 |                 |                 | addresses as if |
|                 |                 |                 | they didn’t     |
|                 |                 |                 | belong to this  |
|                 |                 |                 | wallet          |
+-----------------+-----------------+-----------------+-----------------+

*Result—the balance in Dash*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | number (dash)   | R               | The balance of  |
|                 |                 | equired(exactly | the account (or |
|                 |                 | 1)              | all accounts)   |
|                 |                 |                 | in dash         |
+-----------------+-----------------+-----------------+-----------------+

*Examples from Dash Core 0.17.0*

Get the balance, including transactions with at least three
confirmations and those spent to watch-only addresses. Do not include
InstantSend locked transactions.

.. code:: bash

   dash-cli -testnet getbalance "*" 3 false true

Result:

.. code:: json

   0.00000000

Get the balance, including transactions with at least three
confirmations and those spent to watch-only addresses. Include the
balance from InstantSend locked transactions.

.. code:: bash

   dash-cli -testnet getbalance "" 3 true true

Result:

.. code:: json

   1.00000000

*See also*

-  `ListAccounts </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#listaccounts>`__:
   lists accounts and their balances.
-  `GetReceivedByAccount </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#getreceivedbyaccount>`__:
   returns the total amount received by addresses in a particular
   account from transactions with the specified number of confirmations.
   It does not count coinbase transactions.
-  `GetReceivedByAddress <core-api-ref-remote-procedure-calls-wallet#getreceivedbyaddress>`__:
   returns the total amount received by the specified address in
   transactions with the specified number of confirmations. It does not
   count coinbase transactions.

GetNewAddress
=============

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block]

The ```getnewaddress``
RPC <core-api-ref-remote-procedure-calls-wallet#getnewaddress>`__
returns a new Dash address for receiving payments. If ``label`` is
specified, the address is added to the address book so payments received
with the address will be associated with ``label``.

*Parameter #1—an account name*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``label``       | string          | Optional(0 or   | The label name  |
|                 |                 | 1)              | for the address |
|                 |                 |                 | to be linked    |
|                 |                 |                 | to. If not      |
|                 |                 |                 | provided, the   |
|                 |                 |                 | default label   |
|                 |                 |                 | ``""`` is used. |
|                 |                 |                 | It can also be  |
|                 |                 |                 | set to the      |
|                 |                 |                 | empty string    |
|                 |                 |                 | ``""`` to       |
|                 |                 |                 | represent the   |
|                 |                 |                 | default label.  |
|                 |                 |                 | The label does  |
|                 |                 |                 | not need to     |
|                 |                 |                 | exist, it will  |
|                 |                 |                 | be created if   |
|                 |                 |                 | there is no     |
|                 |                 |                 | label by the    |
|                 |                 |                 | given name.     |
+-----------------+-----------------+-----------------+-----------------+

*Result—a dash address never previously returned*

========== =============== =================== =====================
Name       Type            Presence            Description
========== =============== =================== =====================
``result`` string (base58) Required(exactly 1) The new Dash address.
========== =============== =================== =====================

*Example from Dash Core 0.17.0*

Create a new address in the “doc test” account:

.. code:: bash

   dash-cli -testnet getnewaddress "doc test"

Result:

.. code:: text

   yPuNTqCGzXtU3eEV5jHvhhJkzEPyJLmVkb

*See also*

-  `GetAccountAddress </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#getaccountaddress>`__:
   returns the current Dash address for receiving payments to this
   account. If the account doesn’t exist, it creates both the account
   and a new address for receiving payment. Once a payment has been
   received to an address, future calls to this RPC for the same account
   will return a different address.
-  `GetRawChangeAddress <core-api-ref-remote-procedure-calls-wallet#getrawchangeaddress>`__:
   returns a new Dash address for receiving change. This is for use with
   raw transactions, not normal use.
-  `GetBalance <core-api-ref-remote-procedure-calls-wallet#getbalance>`__:
   gets the balance in decimal dash across all accounts or for a
   particular account.

GetRawChangeAddress
===================

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block]

The ```getrawchangeaddress``
RPC <core-api-ref-remote-procedure-calls-wallet#getrawchangeaddress>`__
returns a new Dash address for receiving change. This is for use with
raw transactions, not normal use.

*Parameters: none*

*Result—a P2PKH address which can be used in raw transactions*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | string (base58) | R               | A P2PKH address |
|                 |                 | equired(exactly | which has not   |
|                 |                 | 1)              | previously been |
|                 |                 |                 | returned by     |
|                 |                 |                 | this RPC. The   |
|                 |                 |                 | address will be |
|                 |                 |                 | removed from    |
|                 |                 |                 | the keypool but |
|                 |                 |                 | not marked as a |
|                 |                 |                 | receiving       |
|                 |                 |                 | address, so     |
|                 |                 |                 | RPCs such as    |
|                 |                 |                 | the             |
|                 |                 |                 | ```dumpwallet`` |
|                 |                 |                 | RP              |
|                 |                 |                 | C <core-api-ref |
|                 |                 |                 | -remote-procedu |
|                 |                 |                 | re-calls-wallet |
|                 |                 |                 | #dumpwallet>`__ |
|                 |                 |                 | will show it as |
|                 |                 |                 | a change        |
|                 |                 |                 | address. The    |
|                 |                 |                 | address may     |
|                 |                 |                 | already have    |
|                 |                 |                 | been part of    |
|                 |                 |                 | the keypool, so |
|                 |                 |                 | other RPCs such |
|                 |                 |                 | as the          |
|                 |                 |                 | ```dumpwallet`` |
|                 |                 |                 | RP              |
|                 |                 |                 | C <core-api-ref |
|                 |                 |                 | -remote-procedu |
|                 |                 |                 | re-calls-wallet |
|                 |                 |                 | #dumpwallet>`__ |
|                 |                 |                 | may have        |
|                 |                 |                 | disclosed it    |
|                 |                 |                 | previously. If  |
|                 |                 |                 | the wallet is   |
|                 |                 |                 | unlocked, its   |
|                 |                 |                 | keypool will    |
|                 |                 |                 | also be filled  |
|                 |                 |                 | to its max (by  |
|                 |                 |                 | default, 100    |
|                 |                 |                 | unused keys).   |
|                 |                 |                 | If the wallet   |
|                 |                 |                 | is locked and   |
|                 |                 |                 | its keypool is  |
|                 |                 |                 | empty, this RPC |
|                 |                 |                 | will fail       |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet getrawchangeaddress

Result:

.. code:: text

   yXBr9BiJmugTzHPgByDmvjJMAkvhTmXVJ8

*See also*

-  `GetNewAddress <core-api-ref-remote-procedure-calls-wallet#getnewaddress>`__:
   returns a new Dash address for receiving payments. If an account is
   specified, payments received with the address will be credited to
   that account.
-  `GetAccountAddress </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#getaccountaddress>`__:
   returns the current Dash address for receiving payments to this
   account. If the account doesn’t exist, it creates both the account
   and a new address for receiving payment. Once a payment has been
   received to an address, future calls to this RPC for the same account
   will return a different address.

GetReceivedByAddress
====================

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block] |Warning icon| Note: This
RPC only returns a balance for addresses contained in the local wallet.

The ```getreceivedbyaddress``
RPC <core-api-ref-remote-procedure-calls-wallet#getreceivedbyaddress>`__
returns the total amount received by the specified address in
transactions with the specified number of confirmations. It does not
count coinbase transactions.

*Parameter #1—the address*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Address         | string          | R               | **Only works    |
|                 |                 | equired(exactly | for addresses   |
|                 |                 | 1)              | contained in    |
|                 |                 |                 | the local       |
|                 |                 |                 | wallet**\ The   |
|                 |                 |                 | address whose   |
|                 |                 |                 | transactions    |
|                 |                 |                 | should be       |
|                 |                 |                 | tallied         |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the minimum number of confirmations*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Confirmations   | number (int)    | Optional(0 or   | The minimum     |
|                 |                 | 1)              | number of       |
|                 |                 |                 | confirmations   |
|                 |                 |                 | an              |
|                 |                 |                 | exter           |
|                 |                 |                 | nally-generated |
|                 |                 |                 | transaction     |
|                 |                 |                 | must have       |
|                 |                 |                 | before it is    |
|                 |                 |                 | counted towards |
|                 |                 |                 | the balance.    |
|                 |                 |                 | Transactions    |
|                 |                 |                 | generated by    |
|                 |                 |                 | this node are   |
|                 |                 |                 | counted         |
|                 |                 |                 | immediately.    |
|                 |                 |                 | Typically,      |
|                 |                 |                 | exter           |
|                 |                 |                 | nally-generated |
|                 |                 |                 | transactions    |
|                 |                 |                 | are payments to |
|                 |                 |                 | this wallet and |
|                 |                 |                 | transactions    |
|                 |                 |                 | generated by    |
|                 |                 |                 | this node are   |
|                 |                 |                 | payments to     |
|                 |                 |                 | other wallets.  |
|                 |                 |                 | Use ``0`` to    |
|                 |                 |                 | count           |
|                 |                 |                 | unconfirmed     |
|                 |                 |                 | transactions.   |
|                 |                 |                 | Default is      |
|                 |                 |                 | ``1``           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—whether to include transactions locked via InstantSend*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| addlocked       | bool            | O               | Add the balance |
|                 |                 | ptional(exactly | from            |
|                 |                 | 1)              | InstantSend     |
|                 |                 |                 | locked          |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+

*Result—the amount of dash received*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | number (dash)   | R               | The amount of   |
|                 |                 | equired(exactly | dash received   |
|                 |                 | 1)              | by the address, |
|                 |                 |                 | excluding       |
|                 |                 |                 | coinbase        |
|                 |                 |                 | transactions.   |
|                 |                 |                 | May be ``0``    |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.13.0*

Get the dash received for a particular address, only counting
transactions with six or more confirmations (ignore InstantSend locked
transactions):

.. code:: bash

   dash-cli -testnet getreceivedbyaddress yYoCWcjbykWsQJ7MVJrTMeQd8TZe5N4Q7g 6

Result:

.. code:: json

   0.00000000

Get the dash received for a particular address, only counting
transactions with six or more confirmations (include InstantSend locked
transactions):

.. code:: bash

   dash-cli -testnet getreceivedbyaddress yYoCWcjbykWsQJ7MVJrTMeQd8TZe5N4Q7g 6 true

Result:

.. code:: json

   0.30000000

*See also*

-  `GetReceivedByAccount <core-api-ref-remote-procedure-calls-wallet-deprecated#getreceivedbyaccount>`__:
   returns the total amount received by addresses in a particular
   account from transactions with the specified number of confirmations.
   It does not count coinbase transactions.
-  `GetAddressesByAccount <core-api-ref-remote-procedure-calls-wallet-deprecated#getaddressesbyaccount>`__:
   returns a list of every address assigned to a particular account.
-  `ListAccounts <core-api-ref-remote-procedure-calls-wallet-deprecated#listaccounts>`__:
   lists accounts and their balances.

GetReceivedByLabel
==================

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**)” } [/block]

The ```getreceivedbylabel``
RPC <core-api-ref-remote-procedure-calls-wallet#getreceivedbylabel>`__
returns the total amount received by addresses with in transactions with
specified minimum number of confirmations.

*Parameter #1—the label name*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Label           | string          | R               | The selected    |
|                 |                 | equired(exactly | label, may be   |
|                 |                 | 1)              | the default     |
|                 |                 |                 | label using     |
|                 |                 |                 | ``""``.         |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the minimum number of confirmations*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Confirmations   | number (int)    | Optional(0 or   | The minimum     |
|                 |                 | 1)              | number of       |
|                 |                 |                 | confirmations a |
|                 |                 |                 | transaction     |
|                 |                 |                 | must have       |
|                 |                 |                 | before it is    |
|                 |                 |                 | counted towards |
|                 |                 |                 | the balance.    |
|                 |                 |                 | Use ``0`` to    |
|                 |                 |                 | count           |
|                 |                 |                 | unconfirmed     |
|                 |                 |                 | transactions.   |
|                 |                 |                 | Default is      |
|                 |                 |                 | ``1``           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—whether to include transactions locked via InstantSend*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| addlocked       | bool            | O               | Add the balance |
|                 |                 | ptional(exactly | from            |
|                 |                 | 1)              | InstantSend     |
|                 |                 |                 | locked          |
|                 |                 |                 | transactions    |
|                 |                 |                 | (default=false) |
+-----------------+-----------------+-----------------+-----------------+

*Result—the number of DASH received*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | number (dash)   | R               | The total       |
|                 |                 | equired(exactly | amount of DASH  |
|                 |                 | 1)              | received for    |
|                 |                 |                 | this label. May |
|                 |                 |                 | be ``0``        |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

Get the DASH received by the “doc test” label with six or more
confirmations:

.. code:: bash

   dash-cli -testnet getreceivedbylabel "doc test" 6

Result:

.. code:: json

   0.30000000

*See also*

-  `GetReceivedByAddress <core-api-ref-remote-procedure-calls-wallet#getreceivedbyaddress>`__:
   returns the total amount received by the specified address in
   transactions with the specified number of confirmations. It does not
   count coinbase transactions.
-  `GetAddressesByLabel <core-api-ref-remote-procedure-calls-wallet#getaddressesbylabel>`__:
   returns a list of every address assigned to a particular label.
-  `ListLabels <core-api-ref-remote-procedure-calls-wallet#listlabels>`__:
   lists labels.

GetTransaction
==============

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block]

The ```gettransaction``
RPC <core-api-ref-remote-procedure-calls-wallet#gettransaction>`__ gets
detailed information about an in-wallet transaction. [block:callout] {
“type”: “danger”, “body”: “Breaking change(s) in Dash Core 18.0. See
parameter and/or response information for details.” } [/block]
*Parameter #1—a transaction identifier (TXID)*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| TXID            | string (hex)    | R               | The TXID of the |
|                 |                 | equired(exactly | transaction to  |
|                 |                 | 1)              | get details     |
|                 |                 |                 | about. The TXID |
|                 |                 |                 | must be encoded |
|                 |                 |                 | as hex in RPC   |
|                 |                 |                 | byte order      |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—whether to include watch-only addresses in details and
calculations*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Include         | bool            | Optional(0 or   | If set to       |
| Watch-Only      |                 | 1)              | ``true``,       |
|                 |                 |                 | include         |
|                 |                 |                 | watch-only      |
|                 |                 |                 | addresses in    |
|                 |                 |                 | details and     |
|                 |                 |                 | calculations as |
|                 |                 |                 | if they were    |
|                 |                 |                 | regular         |
|                 |                 |                 | addresses       |
|                 |                 |                 | belonging to    |
|                 |                 |                 | the wallet. If  |
|                 |                 |                 | set to          |
|                 |                 |                 | ``false`` (the  |
|                 |                 |                 | default), treat |
|                 |                 |                 | watch-only      |
|                 |                 |                 | addresses as if |
|                 |                 |                 | they didn’t     |
|                 |                 |                 | belong to this  |
|                 |                 |                 | wallet          |
+-----------------+-----------------+-----------------+-----------------+

*Result—a description of the transaction*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An object       |
|                 |                 | equired(exactly | describing how  |
|                 |                 | 1)              | the transaction |
|                 |                 |                 | affects the     |
|                 |                 |                 | wallet          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``amount``   | number (dash)   | R               | A positive      |
|                 |                 | equired(exactly | number of dash  |
|                 |                 | 1)              | if this         |
|                 |                 |                 | transaction     |
|                 |                 |                 | increased the   |
|                 |                 |                 | total wallet    |
|                 |                 |                 | balance; a      |
|                 |                 |                 | negative number |
|                 |                 |                 | of dash if this |
|                 |                 |                 | transaction     |
|                 |                 |                 | decreased the   |
|                 |                 |                 | total wallet    |
|                 |                 |                 | balance, or     |
|                 |                 |                 | ``0`` if the    |
|                 |                 |                 | transaction had |
|                 |                 |                 | no net effect   |
|                 |                 |                 | on wallet       |
|                 |                 |                 | balance         |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``fee``      | number (dash)   | Optional(0 or   | If an outgoing  |
|                 |                 | 1)              | transaction,    |
|                 |                 |                 | this is the fee |
|                 |                 |                 | paid by the     |
|                 |                 |                 | transaction     |
|                 |                 |                 | reported as     |
|                 |                 |                 | negative dash   |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | The number of   |
| \ ``            |                 | equired(exactly | confirmations   |
| confirmations`` |                 | 1)              | the transaction |
|                 |                 |                 | has received.   |
|                 |                 |                 | Will be ``0``   |
|                 |                 |                 | for unconfirmed |
|                 |                 |                 | and ``-1`` for  |
|                 |                 |                 | conflicted      |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | R               | **Always        |
| \               |                 | equired(exactly | ``false``       |
| ``instantlock`` |                 | 1)              | if**\ `lite     |
|                 |                 |                 | mode            |
|                 |                 |                 | <core-guide-das |
|                 |                 |                 | h-features#lite |
|                 |                 |                 | -mode>`__\ **is |
|                 |                 |                 | ena             |
|                 |                 |                 | bled**\ Current |
|                 |                 |                 | transaction     |
|                 |                 |                 | lock state      |
|                 |                 |                 | (InstantSend    |
|                 |                 |                 | and/or          |
|                 |                 |                 | ChainLock)      |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | R               | **Always        |
| \ ``instant     |                 | equired(exactly | ``false``       |
| lock_internal`` |                 | 1)              | if**\ `lite     |
|                 |                 |                 | mode            |
|                 |                 |                 | <core-guide-das |
|                 |                 |                 | h-features#lite |
|                 |                 |                 | -mode>`__\ **is |
|                 |                 |                 | ena             |
|                 |                 |                 | bled**\ Current |
|                 |                 |                 | InstantSend     |
|                 |                 |                 | transaction     |
|                 |                 |                 | lock state      |
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
| →               | bool            | Optional(0 or   | Set to ``true`` |
| \ ``generated`` |                 | 1)              | if the          |
|                 |                 |                 | transaction is  |
|                 |                 |                 | a coinbase. Not |
|                 |                 |                 | returned for    |
|                 |                 |                 | regular         |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | Optional(0 or   | The hash of the |
| \ ``blockhash`` |                 | 1)              | block on the    |
|                 |                 |                 | local best      |
|                 |                 |                 | block chain     |
|                 |                 |                 | which includes  |
|                 |                 |                 | this            |
|                 |                 |                 | transaction,    |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order. Only     |
|                 |                 |                 | returned for    |
|                 |                 |                 | confirmed       |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | Optional(0 or   | The index of    |
| \               |                 | 1)              | the transaction |
|  ``blockindex`` |                 |                 | in the block    |
|                 |                 |                 | that includes   |
|                 |                 |                 | it. Only        |
|                 |                 |                 | returned for    |
|                 |                 |                 | confirmed       |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | Optional(0 or   | The block       |
| \ ``blocktime`` |                 | 1)              | header time     |
|                 |                 |                 | (Unix epoch     |
|                 |                 |                 | time) of the    |
|                 |                 |                 | block on the    |
|                 |                 |                 | local best      |
|                 |                 |                 | block chain     |
|                 |                 |                 | which includes  |
|                 |                 |                 | this            |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Only returned   |
|                 |                 |                 | for confirmed   |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+
| → \ ``txid``    | string (hex)    | R               | The TXID of the |
|                 |                 | equired(exactly | transaction,    |
|                 |                 | 1)              | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+
| →               | array           | R               | An array        |
| \ ``wa          |                 | equired(exactly | containing the  |
| lletconflicts`` |                 | 1)              | TXIDs of other  |
|                 |                 |                 | transactions    |
|                 |                 |                 | that spend the  |
|                 |                 |                 | same inputs     |
|                 |                 |                 | (UTXOs) as this |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Array may be    |
|                 |                 |                 | empty           |
+-----------------+-----------------+-----------------+-----------------+
| → →TXID         | string (hex)    | Optional(0 or   | The TXID of a   |
|                 |                 | more)           | conflicting     |
|                 |                 |                 | transaction,    |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+
| → \ ``time``    | number (int)    | R               | A Unix epoch    |
|                 |                 | equired(exactly | time when the   |
|                 |                 | 1)              | transaction was |
|                 |                 |                 | added to the    |
|                 |                 |                 | wallet          |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | A Unix epoch    |
| \ `             |                 | equired(exactly | time when the   |
| `timereceived`` |                 | 1)              | transaction was |
|                 |                 |                 | detected by the |
|                 |                 |                 | local node, or  |
|                 |                 |                 | the time of the |
|                 |                 |                 | block on the    |
|                 |                 |                 | local best      |
|                 |                 |                 | block chain     |
|                 |                 |                 | that included   |
|                 |                 |                 | the transaction |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | Optional(0 or   | ``true`` if the |
| \ ``abandoned`` |                 | 1)              | transaction has |
|                 |                 |                 | been abandoned  |
|                 |                 |                 | (inputs are     |
|                 |                 |                 | respendable).   |
|                 |                 |                 | Only available  |
|                 |                 |                 | for the ‘send’  |
|                 |                 |                 | category of     |
|                 |                 |                 | transactions.   |
+-----------------+-----------------+-----------------+-----------------+
| → \ ``comment`` | string          | Optional(0 or   | For transaction |
|                 |                 | 1)              | originating     |
|                 |                 |                 | with this       |
|                 |                 |                 | wallet, a       |
|                 |                 |                 | locally-stored  |
|                 |                 |                 | comment added   |
|                 |                 |                 | to the          |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Only returned   |
|                 |                 |                 | if a comment    |
|                 |                 |                 | was added       |
+-----------------+-----------------+-----------------+-----------------+
| → \ ``to``      | string          | Optional(0 or   | For transaction |
|                 |                 | 1)              | originating     |
|                 |                 |                 | with this       |
|                 |                 |                 | wallet, a       |
|                 |                 |                 | locally-stored  |
|                 |                 |                 | comment added   |
|                 |                 |                 | to the          |
|                 |                 |                 | transaction     |
|                 |                 |                 | identifying who |
|                 |                 |                 | the transaction |
|                 |                 |                 | was sent to.    |
|                 |                 |                 | Only returned   |
|                 |                 |                 | if a comment-to |
|                 |                 |                 | was added       |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``DS``       | bool            | Optional(0 or   | Set to 1 if a   |
|                 |                 | 1)              | CoinJoin        |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``details``  | array           | R               | An array        |
|                 |                 | equired(exactly | containing one  |
|                 |                 | 1)              | object for each |
|                 |                 |                 | input or output |
|                 |                 |                 | in the          |
|                 |                 |                 | transaction     |
|                 |                 |                 | which affected  |
|                 |                 |                 | the wallet      |
+-----------------+-----------------+-----------------+-----------------+
| → →             | bool            | Optional(0 or   | Set to ``true`` |
| \ ``invo        |                 | 1)              | if the input or |
| lvesWatchonly`` |                 |                 | output involves |
|                 |                 |                 | a watch-only    |
|                 |                 |                 | address.        |
|                 |                 |                 | Otherwise not   |
|                 |                 |                 | returned        |
+-----------------+-----------------+-----------------+-----------------+
| →               | [ST             | [STRIKEOUT:R    | **Removed in    |
| →\ [STRIKEO     | RIKEOUT:string] | equired(exactly | Dash Core       |
| UT:``account``] |                 | 1)]             | 18.0**.         |
|                 |                 |                 | [STRIKEOUT:To   |
|                 |                 |                 | see this        |
|                 |                 |                 | deprecated      |
|                 |                 |                 | field, start    |
|                 |                 |                 | dashd with      |
|                 |                 |                 | `               |
|                 |                 |                 | `-deprecatedrpc |
|                 |                 |                 | =accounts``.The |
|                 |                 |                 | account which   |
|                 |                 |                 | the payment was |
|                 |                 |                 | credited to or  |
|                 |                 |                 | debited from.   |
|                 |                 |                 | May be an empty |
|                 |                 |                 | string (\\“)    |
|                 |                 |                 | for the default |
|                 |                 |                 | account”]       |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (base58) | Optional(0 or   | If an output,   |
| →\ ``address``  |                 | 1)              | the address     |
|                 |                 |                 | paid (may be    |
|                 |                 |                 | someone else’s  |
|                 |                 |                 | address not     |
|                 |                 |                 | belonging to    |
|                 |                 |                 | this wallet).   |
|                 |                 |                 | If an input,    |
|                 |                 |                 | the address     |
|                 |                 |                 | paid in the     |
|                 |                 |                 | previous        |
|                 |                 |                 | output. May be  |
|                 |                 |                 | empty if the    |
|                 |                 |                 | address is      |
|                 |                 |                 | unknown, such   |
|                 |                 |                 | as when paying  |
|                 |                 |                 | to a            |
|                 |                 |                 | non-standard    |
|                 |                 |                 | pubkey script   |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | Set to one of   |
| →\ ``category`` |                 | equired(exactly | the following   |
|                 |                 | 1)              | values:•        |
|                 |                 |                 | ``send`` if     |
|                 |                 |                 | sending payment |
|                 |                 |                 | normally•       |
|                 |                 |                 | ``coinjoin`` if |
|                 |                 |                 | sending         |
|                 |                 |                 | CoinJoin        |
|                 |                 |                 | payment•        |
|                 |                 |                 | ``receive`` if  |
|                 |                 |                 | this wallet     |
|                 |                 |                 | received        |
|                 |                 |                 | payment in a    |
|                 |                 |                 | regular         |
|                 |                 |                 | transaction•    |
|                 |                 |                 | ``generate`` if |
|                 |                 |                 | a matured and   |
|                 |                 |                 | spendable       |
|                 |                 |                 | coinbase•       |
|                 |                 |                 | ``immature`` if |
|                 |                 |                 | a coinbase that |
|                 |                 |                 | is not          |
|                 |                 |                 | spendable yet•  |
|                 |                 |                 | ``orphan`` if a |
|                 |                 |                 | coinbase from a |
|                 |                 |                 | block that’s    |
|                 |                 |                 | not in the      |
|                 |                 |                 | local best      |
|                 |                 |                 | block chain     |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``amount`` | number (dash)   | R               | A negative dash |
|                 |                 | equired(exactly | amount if       |
|                 |                 | 1)              | sending         |
|                 |                 |                 | payment; a      |
|                 |                 |                 | positive dash   |
|                 |                 |                 | amount if       |
|                 |                 |                 | receiving       |
|                 |                 |                 | payment         |
|                 |                 |                 | (including      |
|                 |                 |                 | coinbases)      |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``label``  | string          | Optional(0 or   | An optional     |
|                 |                 | 1)              | comment for the |
|                 |                 |                 | addr            |
|                 |                 |                 | ess/transaction |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``vout``   | number (int)    | R               | For an output,  |
|                 |                 | equired(exactly | the output      |
|                 |                 | 1)              | index (vout)    |
|                 |                 |                 | for this output |
|                 |                 |                 | in this         |
|                 |                 |                 | transaction.    |
|                 |                 |                 | For an input,   |
|                 |                 |                 | the output      |
|                 |                 |                 | index for the   |
|                 |                 |                 | output being    |
|                 |                 |                 | spent in its    |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Because inputs  |
|                 |                 |                 | list the output |
|                 |                 |                 | indexes from    |
|                 |                 |                 | previous        |
|                 |                 |                 | transactions,   |
|                 |                 |                 | more than one   |
|                 |                 |                 | entry in the    |
|                 |                 |                 | details array   |
|                 |                 |                 | may have the    |
|                 |                 |                 | same output     |
|                 |                 |                 | index           |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``fee``    | number (dash)   | Optional(0 or   | If sending      |
|                 |                 | 1)              | payment, the    |
|                 |                 |                 | fee paid as a   |
|                 |                 |                 | negative dash   |
|                 |                 |                 | value. May be   |
|                 |                 |                 | ``0``. Not      |
|                 |                 |                 | returned if     |
|                 |                 |                 | receiving       |
|                 |                 |                 | payment         |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | Optional(0 or   | *Added in       |
| →               |                 | 1)              | Bitcoin Core    |
| \ ``abandoned`` |                 |                 | 0.1             |
|                 |                 |                 | 2.1*\ Indicates |
|                 |                 |                 | if a            |
|                 |                 |                 | transaction is  |
|                 |                 |                 | was abandoned:• |
|                 |                 |                 | ``true`` if it  |
|                 |                 |                 | was abandoned   |
|                 |                 |                 | (inputs are     |
|                 |                 |                 | respendable)•   |
|                 |                 |                 | ``false`` if it |
|                 |                 |                 | was not         |
|                 |                 |                 | abandonedOnly   |
|                 |                 |                 | returned by     |
|                 |                 |                 | *send* category |
|                 |                 |                 | payments        |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``hex``      | string (hex)    | R               | The transaction |
|                 |                 | equired(exactly | in serialized   |
|                 |                 | 1)              | transaction     |
|                 |                 |                 | format          |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

.. code:: bash

   dash-cli -testnet gettransaction \
     c099c882745ad150e9b2a55ef5818683c7ef597e1e5fc20856c67eabc3778ccc

Result:

.. code:: json

   {
     "amount": -50.00000000,
     "fee": -0.00030000,
     "confirmations": 359811,
     "instantlock": true,
     "instantlock_internal": false,
     "chainlock": true,
     "blockhash": "00000a01007be2912c3123085534b58d341cb5e5980b967e8dcc021089487a1e",
     "blockindex": 1,
     "blocktime": 1553290594,
     "txid": "c099c882745ad150e9b2a55ef5818683c7ef597e1e5fc20856c67eabc3778ccc",
     "walletconflicts": [
     ],
     "time": 1553290584,
     "timereceived": 1553290584,
     "details": [
       {
         "address": "ycCsAUKsjdmoP4qAXiS1cjYA4ixM48zJWe",
         "category": "send",
         "amount": -50.00000000,
         "label": "Electrum",
         "vout": 1,
         "fee": -0.00030000,
         "abandoned": false
       }
     ],
     "hex": "0200000003aac865dba0e98fe32533df6bc3eaac160d04bb02966584fb61fc8d7788e09537010000006a47304402202d537257f23ab42b3e14f2ab533f39bb4586aa1b29a1f833f718a59493c8a601022019c6c156c20e66ef256519592b3c977b64d417c94aea4dca20cf18522a138993012103c67d86944315838aea7ec80d390b5d09b91b62483370d4979da5ccf7a7df77a9feffffff47833a270d2e2bac47bc5dc0df576c3a68b01bedbc89692060ac4113a6f9cb67010000006a4730440220442c19a913b10edc533bf63310f5294d6d91eec0eb9c510a3c6b0f33333f27320220501d5093ecdf603b8af9734e21d5de4710c8500309bfa4acdda243a294442b2c012103c67d86944315838aea7ec80d390b5d09b91b62483370d4979da5ccf7a7df77a9feffffffdcfd2d0fb30d79ffeadab8832e65be2310b67043ff3d74deac9a9cb825acda67000000006b483045022100cae8c025d3bec82903f356a5ec38d78a141447b6562e3aceac901f5fcc6f8567022076407835937514d6690c81c0c3b97f92d2b0ae9749249affaf539ead825692f4012102d6be44ab930ff67f084fbaf47a38b539b8d5da65c010952a972c9e524b6009dffeffffff0204fe2b00000000001976a914e3b0093477c2f629430d0a7b5813fe8b0153b0fd88ac00f2052a010000001976a914ae4365dedb1836ba215b9149602e0787a23376d288ac42010100"
   }

*See also*

-  `GetRawTransaction <core-api-ref-remote-procedure-calls-raw-transactions#getrawtransaction>`__:
   gets a hex-encoded serialized transaction or a JSON object describing
   the transaction. By default, Dash Core only stores complete
   transaction data for UTXOs and your own transactions, so the RPC may
   fail on historic transactions unless you use the non-default
   ``txindex=1`` in your Dash Core startup settings.

GetUnconfirmedBalance
=====================

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block]

The ```getunconfirmedbalance``
RPC <core-api-ref-remote-procedure-calls-wallet#getunconfirmedbalance>`__
returns the wallet’s total unconfirmed balance.

*Parameters: none*

*Result—the balance of unconfirmed transactions paying this wallet*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | number (dash)   | R               | The total       |
|                 |                 | equired(exactly | number of dash  |
|                 |                 | 1)              | paid to this    |
|                 |                 |                 | wallet in       |
|                 |                 |                 | unconfirmed     |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet getunconfirmedbalance

Result (no unconfirmed incoming payments):

.. code:: json

   0.00000000

*See also*

-  `GetBalance <core-api-ref-remote-procedure-calls-wallet#getbalance>`__:
   gets the balance in decimal dash across all accounts or for a
   particular account.

GetWalletInfo
=============

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block]

The ```getwalletinfo``
RPC <core-api-ref-remote-procedure-calls-wallet#getwalletinfo>`__
provides information about the wallet.

*Parameters: none*

*Result—information about the wallet*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An object       |
|                 |                 | equired(exactly | describing the  |
|                 |                 | 1)              | wallet          |
+-----------------+-----------------+-----------------+-----------------+
| →\              | string          | R               | The name of the |
|  ``walletname`` |                 | equired(exactly | wallet          |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | number (int)    | R               | The version     |
| walletversion`` |                 | equired(exactly | number of the   |
|                 |                 | 1)              | wallet          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``balance``  | number (dash)   | R               | The total       |
|                 |                 | equired(exactly | confirmed       |
|                 |                 | 1)              | balance of the  |
|                 |                 |                 | wallet. The     |
|                 |                 |                 | same as         |
|                 |                 |                 | returned by the |
|                 |                 |                 | ```getbalance`` |
|                 |                 |                 | RP              |
|                 |                 |                 | C <core-api-ref |
|                 |                 |                 | -remote-procedu |
|                 |                 |                 | re-calls-wallet |
|                 |                 |                 | #getbalance>`__ |
|                 |                 |                 | with default    |
|                 |                 |                 | parameters      |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``coi        | number (dash)   | R               | *Added in Dash  |
| njoin_balance`` |                 | equired(exactly | Core            |
|                 |                 | 1)              | 0.12.3*\ The    |
|                 |                 |                 | total CoinJoin  |
|                 |                 |                 | balance of the  |
|                 |                 |                 | wallet          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``unconf     | number (dash)   | R               | The total       |
| irmed_balance`` |                 | equired(exactly | unconfirmed     |
|                 |                 | 1)              | balance of the  |
|                 |                 |                 | wallet. The     |
|                 |                 |                 | same as         |
|                 |                 |                 | returned by the |
|                 |                 |                 | ```getuncon     |
|                 |                 |                 | firmedbalance`` |
|                 |                 |                 | RPC <core-api   |
|                 |                 |                 | -ref-remote-pro |
|                 |                 |                 | cedure-calls-wa |
|                 |                 |                 | llet#getunconfi |
|                 |                 |                 | rmedbalance>`__ |
|                 |                 |                 | with default    |
|                 |                 |                 | parameters      |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``imm        | number (dash)   | R               | The total       |
| ature_balance`` |                 | equired(exactly | immature        |
|                 |                 | 1)              | balance of the  |
|                 |                 |                 | wallet. This    |
|                 |                 |                 | includes        |
|                 |                 |                 | mi              |
|                 |                 |                 | ning/masternode |
|                 |                 |                 | rewards that    |
|                 |                 |                 | cannot be spent |
|                 |                 |                 | yet             |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``txcount``  | number (int)    | R               | The total       |
|                 |                 | equired(exactly | number of       |
|                 |                 | 1)              | transactions in |
|                 |                 |                 | the wallet      |
|                 |                 |                 | (both spends    |
|                 |                 |                 | and receives)   |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | number (int)    | R               | **Added in Dash |
| `timefirstkey`` |                 | equired(exactly | Core            |
|                 |                 | 1)              | 0.17.0**\ The   |
|                 |                 |                 | timestamp       |
|                 |                 |                 | (seconds since  |
|                 |                 |                 | Unix epoch) of  |
|                 |                 |                 | the oldest      |
|                 |                 |                 | known key in    |
|                 |                 |                 | the wallet      |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | number (int)    | R               | The date as     |
| keypoololdest`` |                 | equired(exactly | Unix epoch time |
|                 |                 | 1)              | when the oldest |
|                 |                 |                 | key in the      |
|                 |                 |                 | wallet key pool |
|                 |                 |                 | was created;    |
|                 |                 |                 | useful for only |
|                 |                 |                 | scanning blocks |
|                 |                 |                 | created since   |
|                 |                 |                 | this date for   |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (int)    | R               | The number of   |
| ``keypoolsize`` |                 | equired(exactly | keys in the     |
|                 |                 | 1)              | wallet keypool  |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``keypoolsiz | number (int)    | Optional(0 or   | How many new    |
| e_hd_internal`` |                 | 1)              | keys are        |
|                 |                 |                 | pre-generated   |
|                 |                 |                 | for internal    |
|                 |                 |                 | use (used for   |
|                 |                 |                 | change outputs, |
|                 |                 |                 | only appears if |
|                 |                 |                 | the wallet is   |
|                 |                 |                 | using this      |
|                 |                 |                 | feature,        |
|                 |                 |                 | otherwise       |
|                 |                 |                 | external keys   |
|                 |                 |                 | are used)       |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | The number of   |
| \ ``keys_left`` |                 | equired(exactly | unused keys     |
|                 |                 | 1)              | left since the  |
|                 |                 |                 | last automatic  |
|                 |                 |                 | backup          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``u          | number (int)    | Optional(0 or   | Only returned   |
| nlocked_until`` |                 | 1)              | if the wallet   |
|                 |                 |                 | was encrypted   |
|                 |                 |                 | with the        |
|                 |                 |                 | ```             |
|                 |                 |                 | encryptwallet`` |
|                 |                 |                 | RPC <c          |
|                 |                 |                 | ore-api-ref-rem |
|                 |                 |                 | ote-procedure-c |
|                 |                 |                 | alls-wallet#enc |
|                 |                 |                 | ryptwallet>`__. |
|                 |                 |                 | A Unix epoch    |
|                 |                 |                 | date when the   |
|                 |                 |                 | wallet will be  |
|                 |                 |                 | locked, or      |
|                 |                 |                 | ``0`` if the    |
|                 |                 |                 | wallet is       |
|                 |                 |                 | currently       |
|                 |                 |                 | locked          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``paytxfee`` | number (int)    | R               | The transaction |
|                 |                 | equired(exactly | fee             |
|                 |                 | 1)              | configuration,  |
|                 |                 |                 | set in DASH/kB  |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hash)   | Optional(0 or   | The ID of the   |
| \ ``hdchainid`` |                 | 1)              | HD chain        |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``h          | number (int)    | Optional(0 or   | How many        |
| daccountcount`` |                 | 1)              | accounts of the |
|                 |                 |                 | HD chain are in |
|                 |                 |                 | this wallet     |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | Optional(0 or   | The index of    |
| →\ ``hdacco     |                 | 1)              | the account     |
| untcountindex`` |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | Optional(0 or   | Current         |
| →\ ``hdext      |                 | 1)              | external child  |
| ernalkeyindex`` |                 |                 | key index       |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | Optional(0 or   | Current         |
| →\ ``hdint      |                 | 1)              | internal child  |
| ernalkeyindex`` |                 |                 | key index       |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``scanning`` | object          | R               | \_Added in Dash |
|                 |                 | equired(exactly | Core            |
|                 |                 | 1)              | 0.16.1_\_JSON   |
|                 |                 |                 | object          |
|                 |                 |                 | containing      |
|                 |                 |                 | current         |
|                 |                 |                 | scanning        |
|                 |                 |                 | details (false  |
|                 |                 |                 | (0) if no scan  |
|                 |                 |                 | is in progress) |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | Optional(0 or   | Elapsed seconds |
| →\ ``duration`` |                 | 1)              | since scan      |
|                 |                 |                 | start           |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | Optional(0 or   | Scanning        |
| →\ ``progress`` |                 | 1)              | progress        |
|                 |                 |                 | percentage 0.0  |
|                 |                 |                 | to 1.0          |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

.. code:: bash

   dash-cli -testnet getwalletinfo

Result:

.. code:: json

   {
     "walletname": "",
     "walletversion": 61000,
     "balance": 188838.10331689,
     "coinjoin_balance": 2007.81107791,
     "unconfirmed_balance": 0.00000000,
     "immature_balance": 104.46428575,
     "txcount": 29137,
     "timefirstkey": 1544808277,
     "keypoololdest": 1601323587,
     "keypoolsize": 1000,
     "keys_left": 1000,
     "paytxfee": 0.00000000,
     "scanning": false
   }

*See also*

-  `ListTransactions <core-api-ref-remote-procedure-calls-wallet#listtransactions>`__:
   returns the most recent transactions that affect the wallet.

ImportAddress
=============

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block]

The ```importaddress``
RPC <core-api-ref-remote-procedure-calls-wallet#importaddress>`__ adds
an address or pubkey script to the wallet without the associated private
key, allowing you to watch for transactions affecting that address or
pubkey script without being able to spend any of its outputs.

*Parameter #1—the address or pubkey script to watch*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Address or      | string (base58  | R               | Either a P2PKH  |
| Script          | or hex)         | equired(exactly | or P2SH address |
|                 |                 | 1)              | encoded in      |
|                 |                 |                 | base58check, or |
|                 |                 |                 | a pubkey script |
|                 |                 |                 | encoded as hex  |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—The account into which to place the address or pubkey
script*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Label           | string          | Optional(0 or   | An optional     |
|                 |                 | 1)              | label. Default  |
|                 |                 |                 | is an empty     |
|                 |                 |                 | string(\\“)”    |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—whether to rescan the block chain*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Rescan          | bool            | Optional(0 or   | Set to ``true`` |
|                 |                 | 1)              | (the default)   |
|                 |                 |                 | to rescan the   |
|                 |                 |                 | entire local    |
|                 |                 |                 | block database  |
|                 |                 |                 | for             |
|                 |                 |                 | transactions    |
|                 |                 |                 | affecting any   |
|                 |                 |                 | address or      |
|                 |                 |                 | pubkey script   |
|                 |                 |                 | in the wallet   |
|                 |                 |                 | (including      |
|                 |                 |                 | transaction     |
|                 |                 |                 | affecting the   |
|                 |                 |                 | newly-added     |
|                 |                 |                 | address or      |
|                 |                 |                 | pubkey script). |
|                 |                 |                 | Set to          |
|                 |                 |                 | ``false`` to    |
|                 |                 |                 | not rescan the  |
|                 |                 |                 | block database  |
|                 |                 |                 | (rescanning can |
|                 |                 |                 | be performed at |
|                 |                 |                 | any time by     |
|                 |                 |                 | restarting Dash |
|                 |                 |                 | Core with the   |
|                 |                 |                 | ``-rescan``     |
|                 |                 |                 | command-line    |
|                 |                 |                 | argument).      |
|                 |                 |                 | Rescanning may  |
|                 |                 |                 | take several    |
|                 |                 |                 | minutes.        |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #4—whether to rescan the block chain*

==== ==== ================ ==========================================
Name Type Presence         Description
==== ==== ================ ==========================================
P2SH bool Optional(0 or 1) Add the P2SH version of the script as well
==== ==== ================ ==========================================

*Result—``null`` on success*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | null            | R               | If the address  |
|                 |                 | equired(exactly | or pubkey       |
|                 |                 | 1)              | script is added |
|                 |                 |                 | to the wallet   |
|                 |                 |                 | (or is already  |
|                 |                 |                 | part of the     |
|                 |                 |                 | wallet), JSON   |
|                 |                 |                 | ``null`` will   |
|                 |                 |                 | be returned     |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Add an address, rescanning the local block database for any transactions
matching it.

.. code:: bash

   dash-cli -testnet importaddress \
     yg89Yt5Tjzs9nRpX3wJCuvr7KuQvgkvmeC "watch-only test" true

Result:

(No output; success.)

Show that the address has been added:

.. code:: bash

   dash-cli -testnet getaccount yg89Yt5Tjzs9nRpX3wJCuvr7KuQvgkvmeC

Result:

.. code:: text

   watch-only test

*See also*

-  `ImportPrivKey <core-api-ref-remote-procedure-calls-wallet#importprivkey>`__:
   adds a private key to your wallet. The key should be formatted in the
   wallet import format created by the ```dumpprivkey``
   RPC <core-api-ref-remote-procedure-calls-wallet#dumpprivkey>`__.
-  `ListReceivedByAddress <core-api-ref-remote-procedure-calls-wallet#listreceivedbyaddress>`__:
   lists the total number of dash received by each address.

ImportElectrumWallet
====================

The ```importelectrumwallet``
RPC <core-api-ref-remote-procedure-calls-wallet#importelectrumwallet>`__
imports keys from an Electrum wallet export file (.csv or .json)

*Parameter #1—file name*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| File Name       | string          | R               | The Electrum    |
|                 |                 | equired(exactly | wallet export   |
|                 |                 | 1)              | file (should be |
|                 |                 |                 | in csv or json  |
|                 |                 |                 | format)         |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—index*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Index           | number (int)    | Optional(0 or   | Rescan the      |
|                 |                 | 1)              | wallet for      |
|                 |                 |                 | transactions    |
|                 |                 |                 | starting from   |
|                 |                 |                 | this block      |
|                 |                 |                 | index (default: |
|                 |                 |                 | 0)              |
+-----------------+-----------------+-----------------+-----------------+

*Result—``null`` on success*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | null            | R               | If the Electrum |
|                 |                 | equired(exactly | keys are        |
|                 |                 | 1)              | imported        |
|                 |                 |                 | successfully,   |
|                 |                 |                 | JSON ``null``   |
|                 |                 |                 | will be         |
|                 |                 |                 | returned        |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli importelectrumwallet /tmp/electrum-export.csv

(Success: no result displayed.)

*See also: none*

ImportMulti
===========

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**). Wallet must be unlocked.” } [/block]

*Added in Dash Core 0.12.3 / Bitcoin Core 0.14.0*

The ```importmulti``
RPC <core-api-ref-remote-procedure-calls-wallet#importmulti>`__ imports
addresses or scripts (with private keys, public keys, or P2SH redeem
scripts) and optionally performs the minimum necessary rescan for all
imports.

*Parameter #1—the addresses/scripts to import*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Imports         | array           | R               | An array of     |
|                 |                 | equired(exactly | JSON objects,   |
|                 |                 | 1)              | each one being  |
|                 |                 |                 | an address or   |
|                 |                 |                 | script to be    |
|                 |                 |                 | imported        |
+-----------------+-----------------+-----------------+-----------------+
| → Import        | object          | Required(1 or   | A JSON object   |
|                 |                 | more)           | describing a    |
|                 |                 |                 | particular      |
|                 |                 |                 | import          |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | Optional(0 or   | The script      |
| →\ `            |                 | 1)              | (string) to be  |
| `scriptPubKey`` |                 |                 | imported. Must  |
|                 |                 |                 | have either     |
|                 |                 |                 | this field or   |
|                 |                 |                 | ``address``     |
|                 |                 |                 | below           |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (base58) | Optional(0 or   | The P2PKH or    |
| →\ ``address``  |                 | 1)              | P2SH address to |
|                 |                 |                 | be imported.    |
|                 |                 |                 | Must have       |
|                 |                 |                 | either this     |
|                 |                 |                 | field or        |
|                 |                 |                 | `               |
|                 |                 |                 | `scriptPubKey`` |
|                 |                 |                 | above           |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int) /  | R               | The creation    |
| →               | string          | equired(exactly | time of the key |
| \ ``timestamp`` |                 | 1)              | in Unix epoch   |
|                 |                 |                 | time or the     |
|                 |                 |                 | string “now” to |
|                 |                 |                 | substitute the  |
|                 |                 |                 | current synced  |
|                 |                 |                 | block chain     |
|                 |                 |                 | time. The       |
|                 |                 |                 | timestamp of    |
|                 |                 |                 | the oldest key  |
|                 |                 |                 | will determine  |
|                 |                 |                 | how far back    |
|                 |                 |                 | block chain     |
|                 |                 |                 | rescans need to |
|                 |                 |                 | begin. Specify  |
|                 |                 |                 | ``now`` to      |
|                 |                 |                 | bypass scanning |
|                 |                 |                 | for keys which  |
|                 |                 |                 | are known to    |
|                 |                 |                 | never have been |
|                 |                 |                 | used. Specify   |
|                 |                 |                 | ``0`` to scan   |
|                 |                 |                 | the entire      |
|                 |                 |                 | block chain.    |
|                 |                 |                 | Blocks up to 2  |
|                 |                 |                 | hours before    |
|                 |                 |                 | the earliest    |
|                 |                 |                 | key creation    |
|                 |                 |                 | time will be    |
|                 |                 |                 | scanned         |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | Optional(0 or   | A redeem        |
| →\ `            |                 | 1)              | script. Only    |
| `redeemscript`` |                 |                 | allowed if      |
|                 |                 |                 | either the      |
|                 |                 |                 | ``address``     |
|                 |                 |                 | field is a P2SH |
|                 |                 |                 | address or the  |
|                 |                 |                 | `               |
|                 |                 |                 | `scriptPubKey`` |
|                 |                 |                 | field is a P2SH |
|                 |                 |                 | scriptPubKey    |
+-----------------+-----------------+-----------------+-----------------+
| →               | array           | Optional(0 or   | Array of        |
| →\ ``pubkeys``  |                 | 1)              | strings giving  |
|                 |                 |                 | pubkeys that    |
|                 |                 |                 | must occur in   |
|                 |                 |                 | the             |
|                 |                 |                 | scriptPubKey or |
|                 |                 |                 | redeemscript    |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``keys``   | array           | Optional(0 or   | Array of        |
|                 |                 | 1)              | strings giving  |
|                 |                 |                 | private keys    |
|                 |                 |                 | whose           |
|                 |                 |                 | corresponding   |
|                 |                 |                 | public keys     |
|                 |                 |                 | must occur in   |
|                 |                 |                 | the             |
|                 |                 |                 | scriptPubKey or |
|                 |                 |                 | redeemscript    |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | Optional(0 or   | Stating whether |
| →\ ``internal`` |                 | 1)              | matching        |
|                 |                 |                 | outputs should  |
|                 |                 |                 | be treated as   |
|                 |                 |                 | change rather   |
|                 |                 |                 | than incoming   |
|                 |                 |                 | payments. The   |
|                 |                 |                 | default is      |
|                 |                 |                 | ``false``       |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | Optional(0 or   | Stating whether |
| →               |                 | 1)              | matching        |
| \ ``watchonly`` |                 |                 | outputs should  |
|                 |                 |                 | be considered   |
|                 |                 |                 | watched even    |
|                 |                 |                 | when they’re    |
|                 |                 |                 | not spendable.  |
|                 |                 |                 | This is only    |
|                 |                 |                 | allowed if keys |
|                 |                 |                 | are empty. The  |
|                 |                 |                 | default is      |
|                 |                 |                 | ``false``       |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``label``  | string          | Optional(0 or   | Label to assign |
|                 |                 | 1)              | to the address, |
|                 |                 |                 | only allowed    |
|                 |                 |                 | with            |
|                 |                 |                 | ``internal``    |
|                 |                 |                 | set to          |
|                 |                 |                 | ``false``. The  |
|                 |                 |                 | default is an   |
|                 |                 |                 | empty string    |
|                 |                 |                 | (“”)            |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—options regarding the import*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Option          | object          | Optional(0 or   | JSON object     |
|                 |                 | 1)              | with options    |
|                 |                 |                 | regarding the   |
|                 |                 |                 | import          |
+-----------------+-----------------+-----------------+-----------------+
| → \ ``rescan``  | bool            | Optional(0 or   | Set to ``true`` |
|                 |                 | 1)              | (the default)   |
|                 |                 |                 | to rescan the   |
|                 |                 |                 | entire local    |
|                 |                 |                 | block chain for |
|                 |                 |                 | transactions    |
|                 |                 |                 | affecting any   |
|                 |                 |                 | imported        |
|                 |                 |                 | address or      |
|                 |                 |                 | script. Set to  |
|                 |                 |                 | ``false`` to    |
|                 |                 |                 | not rescan      |
|                 |                 |                 | after the       |
|                 |                 |                 | import.         |
|                 |                 |                 | Rescanning may  |
|                 |                 |                 | take a          |
|                 |                 |                 | considerable    |
|                 |                 |                 | amount of time  |
|                 |                 |                 | and may require |
|                 |                 |                 | re-downloading  |
|                 |                 |                 | blocks if using |
|                 |                 |                 | block chain     |
|                 |                 |                 | pruning         |
+-----------------+-----------------+-----------------+-----------------+

*Result—execution result*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | An array of     |
|                 |                 | equired(exactly | JSON objects,   |
|                 |                 | 1)              | with each       |
|                 |                 |                 | object          |
|                 |                 |                 | describing the  |
|                 |                 |                 | execution       |
|                 |                 |                 | result of each  |
|                 |                 |                 | import          |
+-----------------+-----------------+-----------------+-----------------+
| → Result        | object          | Required(1 or   | A JSON object   |
|                 |                 | more)           | describing the  |
|                 |                 |                 | execution       |
|                 |                 |                 | result of an    |
|                 |                 |                 | imported        |
|                 |                 |                 | address or      |
|                 |                 |                 | script          |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | R               | Displays        |
| \ ``success``   |                 | equired(exactly | ``true`` if the |
|                 |                 | 1)              | import has been |
|                 |                 |                 | successful or   |
|                 |                 |                 | ``false`` if it |
|                 |                 |                 | failed          |
+-----------------+-----------------+-----------------+-----------------+
| → → \ ``error`` | string : object | Optional(0 or   | A JSON object   |
|                 |                 | 1)              | containing      |
|                 |                 |                 | details about   |
|                 |                 |                 | the error. Only |
|                 |                 |                 | displayed if    |
|                 |                 |                 | the import      |
|                 |                 |                 | fails           |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | number (int)    | Optional(0 or   | The error code  |
| \ ``code``      |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string          | Optional(0 or   | The error       |
| \ ``message``   |                 | 1)              | message         |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.3*

Import the address ``ycCsAUKsjdmoP4qAXiS1cjYA4ixM48zJWe`` (giving it a
label and scanning the entire block chain) and the scriptPubKey
``76a9146cf5870411edc31ba5630d61c7cddff55b884fda88ac`` (giving a
specific timestamp and label):

.. code:: bash

   dash-cli importmulti '
     [
       {
         "scriptPubKey" : { "address": "ycCsAUKsjdmoP4qAXiS1cjYA4ixM48zJWe" },
         "timestamp" : 0,
         "label" : "Personal"
       },
       {
         "scriptPubKey" : "76a9146cf5870411edc31ba5630d61c7cddff55b884fda88ac",
         "timestamp" : 1493912405,
         "label" : "TestFailure"
       }
     ]' '{ "rescan": true }'

Result (scriptPubKey import failed because ``internal`` was not set to
``true``):

.. code:: json

   [
     {
       "success": true
     },
     {
       "success": false,
       "error": {
         "code": -8,
         "message": "Internal must be set for hex scriptPubKey"
       }
     }
   ]

*See also*

-  `ImportPrivKey <core-api-ref-remote-procedure-calls-wallet#importprivkey>`__:
   adds a private key to your wallet. The key should be formatted in the
   wallet import format created by the ```dumpprivkey``
   RPC <core-api-ref-remote-procedure-calls-wallet#dumpprivkey>`__.
-  `ImportAddress <core-api-ref-remote-procedure-calls-wallet#importaddress>`__:
   adds an address or pubkey script to the wallet without the associated
   private key, allowing you to watch for transactions affecting that
   address or pubkey script without being able to spend any of its
   outputs.
-  `ImportWallet <core-api-ref-remote-procedure-calls-wallet#importwallet>`__:
   imports private keys from a file in wallet dump file format (see the
   ```dumpwallet``
   RPC <core-api-ref-remote-procedure-calls-wallet#dumpwallet>`__).
   These keys will be added to the keys currently in the wallet. This
   call may need to rescan all or parts of the block chain for
   transactions affecting the newly-added keys, which may take several
   minutes.

ImportPrivKey
=============

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**). Wallet must be unlocked.” } [/block]

The ```importprivkey``
RPC <core-api-ref-remote-procedure-calls-wallet#importprivkey>`__ adds a
private key to your wallet. The key should be formatted in the wallet
import format created by the ```dumpprivkey``
RPC <core-api-ref-remote-procedure-calls-wallet#dumpprivkey>`__.

*Parameter #1—the private key to import*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Private Key     | string (base58) | R               | The private key |
|                 |                 | equired(exactly | to import into  |
|                 |                 | 1)              | the wallet      |
|                 |                 |                 | encoded in      |
|                 |                 |                 | base58check     |
|                 |                 |                 | using wallet    |
|                 |                 |                 | import format   |
|                 |                 |                 | (WIF)           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the account into which the key should be placed*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Account         | string          | Optional(0 or   | The name of an  |
|                 |                 | 1)              | account to      |
|                 |                 |                 | which           |
|                 |                 |                 | transactions    |
|                 |                 |                 | involving the   |
|                 |                 |                 | key should be   |
|                 |                 |                 | assigned. The   |
|                 |                 |                 | default is the  |
|                 |                 |                 | default         |
|                 |                 |                 | account, an     |
|                 |                 |                 | empty string    |
|                 |                 |                 | (\\“)”          |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—whether to rescan the block chain*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Rescan          | bool            | Optional(0 or   | Set to ``true`` |
|                 |                 | 1)              | (the default)   |
|                 |                 |                 | to rescan the   |
|                 |                 |                 | entire local    |
|                 |                 |                 | block database  |
|                 |                 |                 | for             |
|                 |                 |                 | transactions    |
|                 |                 |                 | affecting any   |
|                 |                 |                 | address or      |
|                 |                 |                 | pubkey script   |
|                 |                 |                 | in the wallet   |
|                 |                 |                 | (including      |
|                 |                 |                 | transaction     |
|                 |                 |                 | affecting the   |
|                 |                 |                 | newly-added     |
|                 |                 |                 | address for     |
|                 |                 |                 | this private    |
|                 |                 |                 | key). Set to    |
|                 |                 |                 | ``false`` to    |
|                 |                 |                 | not rescan the  |
|                 |                 |                 | block database  |
|                 |                 |                 | (rescanning can |
|                 |                 |                 | be performed at |
|                 |                 |                 | any time by     |
|                 |                 |                 | restarting Dash |
|                 |                 |                 | Core with the   |
|                 |                 |                 | ``-rescan``     |
|                 |                 |                 | command-line    |
|                 |                 |                 | argument).      |
|                 |                 |                 | Rescanning may  |
|                 |                 |                 | take several    |
|                 |                 |                 | minutes. Notes: |
|                 |                 |                 | if the address  |
|                 |                 |                 | for this key is |
|                 |                 |                 | already in the  |
|                 |                 |                 | wallet, the     |
|                 |                 |                 | block database  |
|                 |                 |                 | will not be     |
|                 |                 |                 | rescanned even  |
|                 |                 |                 | if this         |
|                 |                 |                 | parameter is    |
|                 |                 |                 | set             |
+-----------------+-----------------+-----------------+-----------------+

*Result—``null`` on success*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | null            | R               | If the private  |
|                 |                 | equired(exactly | key is added to |
|                 |                 | 1)              | the wallet (or  |
|                 |                 |                 | is already part |
|                 |                 |                 | of the wallet), |
|                 |                 |                 | JSON ``null``   |
|                 |                 |                 | will be         |
|                 |                 |                 | returned        |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Import the private key for the address
ycBuREgSskHHkWLxDa9A5WppCki6PfFycL, giving it a label and scanning the
entire block chain:

.. code:: bash

   dash-cli -testnet importprivkey \
                 cQZZ4awQvcXXyES3CmUJqSgeTobQm9t9nyUr337kvUtsWsnvvMyw \
                 "test label" \
                 true

(Success: no result displayed.)

*See also*

-  `DumpPrivKey <core-api-ref-remote-procedure-calls-wallet#dumpprivkey>`__:
   returns the wallet-import-format (WIP) private key corresponding to
   an address. (But does not remove it from the wallet.)
-  `ImportAddress <core-api-ref-remote-procedure-calls-wallet#importaddress>`__:
   adds an address or pubkey script to the wallet without the associated
   private key, allowing you to watch for transactions affecting that
   address or pubkey script without being able to spend any of its
   outputs.
-  `ImportPubKey <core-api-ref-remote-procedure-calls-wallet#importpubkey>`__:
   imports a public key (in hex) that can be watched as if it were in
   your wallet but cannot be used to spend
-  `ImportWallet <core-api-ref-remote-procedure-calls-wallet#importwallet>`__:
   imports private keys from a file in wallet dump file format (see the
   ```dumpwallet``
   RPC <core-api-ref-remote-procedure-calls-wallet#dumpwallet>`__).
   These keys will be added to the keys currently in the wallet. This
   call may need to rescan all or parts of the block chain for
   transactions affecting the newly-added keys, which may take several
   minutes.

ImportPrunedFunds
=================

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block]

*Added in Dash Core 0.12.3 / Bitcoin Core 0.13.0*

The ```importprunedfunds``
RPC <core-api-ref-remote-procedure-calls-wallet#importprunedfunds>`__
imports funds without the need of a rescan. Meant for use with pruned
wallets. Corresponding address or script must previously be included in
wallet. The end-user is responsible to import additional transactions
that subsequently spend the imported outputs or rescan after the point
in the blockchain the transaction is included.

*Parameter #1—the raw transaction to import*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Raw Transaction | string(hex)     | R               | A raw           |
|                 |                 | equired(exactly | transaction in  |
|                 |                 | 1)              | hex funding an  |
|                 |                 |                 | a               |
|                 |                 |                 | lready-existing |
|                 |                 |                 | address in      |
|                 |                 |                 | wallet          |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the tx out proof that cointains the transaction*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| TX Out Proof    | string(hex)     | R               | The hex output  |
|                 |                 | equired(exactly | from            |
|                 |                 | 1)              | gettxoutproof   |
|                 |                 |                 | that contains   |
|                 |                 |                 | the transaction |
+-----------------+-----------------+-----------------+-----------------+

*Result—``null`` on success*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | null            | R               | If the funds    |
|                 |                 | equired(exactly | are added to    |
|                 |                 | 1)              | wallet, JSON    |
|                 |                 |                 | ``null`` will   |
|                 |                 |                 | be returned     |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.3*

.. code:: bash

   bitcoin-cli importprunedfunds "txhex" "txoutproof"

(Success: no result displayed.)

*See also*

-  `ImportPrivKey <core-api-ref-remote-procedure-calls-wallet#importprivkey>`__:
   adds a private key to your wallet. The key should be formatted in the
   wallet import format created by the ```dumpprivkey``
   RPC <core-api-ref-remote-procedure-calls-wallet#dumpprivkey>`__.
-  `RemovePrunedFunds <core-api-ref-remote-procedure-calls-wallet#removeprunedfunds>`__:
   deletes the specified transaction from the wallet. Meant for use with
   pruned wallets and as a companion to importprunedfunds.

ImportPubKey
============

The ```importpubkey``
RPC <core-api-ref-remote-procedure-calls-wallet#importpubkey>`__ imports
a public key (in hex) that can be watched as if it were in your wallet
but cannot be used to spend

*Parameter #1—the public key to import*

========== ============ =================== ========================
Name       Type         Presence            Description
========== ============ =================== ========================
Public Key string (hex) Required(exactly 1) The public key to import
========== ============ =================== ========================

*Parameter #2—the account into which the key should be placed*

===== ====== ================ ====================================
Name  Type   Presence         Description
===== ====== ================ ====================================
Label string Optional(0 or 1) The label the key should be assigned
===== ====== ================ ====================================

*Parameter #3—whether to rescan the block chain*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Rescan          | bool            | Optional(0 or   | Set to ``true`` |
|                 |                 | 1)              | (the default)   |
|                 |                 |                 | to rescan the   |
|                 |                 |                 | entire local    |
|                 |                 |                 | block database  |
|                 |                 |                 | for             |
|                 |                 |                 | transactions    |
|                 |                 |                 | affecting any   |
|                 |                 |                 | address or      |
|                 |                 |                 | pubkey script   |
|                 |                 |                 | in the wallet.  |
|                 |                 |                 | Set to          |
|                 |                 |                 | ``false`` to    |
|                 |                 |                 | not rescan the  |
|                 |                 |                 | block database  |
|                 |                 |                 | (rescanning can |
|                 |                 |                 | be performed at |
|                 |                 |                 | any time by     |
|                 |                 |                 | restarting Dash |
|                 |                 |                 | Core with the   |
|                 |                 |                 | ``-rescan``     |
|                 |                 |                 | command-line    |
|                 |                 |                 | argument).      |
|                 |                 |                 | Rescanning may  |
|                 |                 |                 | take several    |
|                 |                 |                 | minutes. Notes: |
|                 |                 |                 | if the address  |
|                 |                 |                 | for this key is |
|                 |                 |                 | already in the  |
|                 |                 |                 | wallet, the     |
|                 |                 |                 | block database  |
|                 |                 |                 | will not be     |
|                 |                 |                 | rescanned even  |
|                 |                 |                 | if this         |
|                 |                 |                 | parameter is    |
|                 |                 |                 | set             |
+-----------------+-----------------+-----------------+-----------------+

*Result—``null`` on success*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | null            | R               | If the public   |
|                 |                 | equired(exactly | key is added to |
|                 |                 | 1)              | the wallet (or  |
|                 |                 |                 | is already part |
|                 |                 |                 | of the wallet), |
|                 |                 |                 | JSON ``null``   |
|                 |                 |                 | will be         |
|                 |                 |                 | returned        |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Import the public key for the address, giving it a label and scanning
the entire block chain:

.. code:: bash

   dash-cli -testnet importpubkey \
       0210c1349657c1253d3d64d1b31d3500b09335bf12b8df061666e216f550a43249 \
       "test label" \
       true

(Success: no result displayed.)

*See also:*

-  `ImportAddress <core-api-ref-remote-procedure-calls-wallet#importaddress>`__:
   adds an address or pubkey script to the wallet without the associated
   private key, allowing you to watch for transactions affecting that
   address or pubkey script without being able to spend any of its
   outputs.
-  `ImportPrivKey <core-api-ref-remote-procedure-calls-wallet#importprivkey>`__:
   adds a private key to your wallet. The key should be formatted in the
   wallet import format created by the ```dumpprivkey``
   RPC <core-api-ref-remote-procedure-calls-wallet#dumpprivkey>`__.
-  `ImportWallet <core-api-ref-remote-procedure-calls-wallet#importwallet>`__:
   imports private keys from a file in wallet dump file format (see the
   ```dumpwallet``
   RPC <core-api-ref-remote-procedure-calls-wallet#dumpwallet>`__).
   These keys will be added to the keys currently in the wallet. This
   call may need to rescan all or parts of the block chain for
   transactions affecting the newly-added keys, which may take several
   minutes.

ImportWallet
============

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**). Requires an unlocked wallet or an
unencrypted wallet.” } [/block]

The ```importwallet``
RPC <core-api-ref-remote-procedure-calls-wallet#importwallet>`__ imports
private keys from a file in wallet dump file format (see the
```dumpwallet``
RPC <core-api-ref-remote-procedure-calls-wallet#dumpwallet>`__). These
keys will be added to the keys currently in the wallet. This call may
need to rescan all or parts of the block chain for transactions
affecting the newly-added keys, which may take several minutes.

*Parameter #1—the file to import*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Filename        | string          | R               | The file to     |
|                 |                 | equired(exactly | import. The     |
|                 |                 | 1)              | path is         |
|                 |                 |                 | relative to     |
|                 |                 |                 | Dash Core’s     |
|                 |                 |                 | working         |
|                 |                 |                 | directory       |
+-----------------+-----------------+-----------------+-----------------+

*Result—``null`` on success*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | null            | R               | If all the keys |
|                 |                 | equired(exactly | in the file are |
|                 |                 | 1)              | added to the    |
|                 |                 |                 | wallet (or are  |
|                 |                 |                 | already part of |
|                 |                 |                 | the wallet),    |
|                 |                 |                 | JSON ``null``   |
|                 |                 |                 | will be         |
|                 |                 |                 | returned        |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Import the file shown in the example subsection of the ```dumpwallet``
RPC <core-api-ref-remote-procedure-calls-wallet#dumpwallet>`__.

.. code:: bash

   dash-cli -testnet importwallet /tmp/dump.txt

(Success: no result displayed.)

*See also*

-  `DumpWallet <core-api-ref-remote-procedure-calls-wallet#dumpwallet>`__:
   creates or overwrites a file with all wallet keys in a human-readable
   format.
-  `ImportPrivKey <core-api-ref-remote-procedure-calls-wallet#importprivkey>`__:
   adds a private key to your wallet. The key should be formatted in the
   wallet import format created by the ```dumpprivkey``
   RPC <core-api-ref-remote-procedure-calls-wallet#dumpprivkey>`__.

KeyPoolRefill
=============

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**). Requires an unlocked wallet or an
unencrypted wallet.” } [/block]

The ```keypoolrefill``
RPC <core-api-ref-remote-procedure-calls-wallet#keypoolrefill>`__ fills
the cache of unused pre-generated keys (the keypool).

*Parameter #1—the new keypool size*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Key Pool Size   | number (int)    | Optional(0 or   | The new size of |
|                 |                 | 1)              | the keypool; if |
|                 |                 |                 | the number of   |
|                 |                 |                 | keys in the     |
|                 |                 |                 | keypool is less |
|                 |                 |                 | than this       |
|                 |                 |                 | number, new     |
|                 |                 |                 | keys will be    |
|                 |                 |                 | generated.      |
|                 |                 |                 | Default is      |
|                 |                 |                 | ``1000``. The   |
|                 |                 |                 | value ``0``     |
|                 |                 |                 | also equals the |
|                 |                 |                 | default. The    |
|                 |                 |                 | value specified |
|                 |                 |                 | is for this     |
|                 |                 |                 | call only—the   |
|                 |                 |                 | default keypool |
|                 |                 |                 | size is not     |
|                 |                 |                 | changed         |
+-----------------+-----------------+-----------------+-----------------+

*Result—``null`` on success*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | null            | R               | If the keypool  |
|                 |                 | equired(exactly | is successfully |
|                 |                 | 1)              | filled, JSON    |
|                 |                 |                 | ``null`` will   |
|                 |                 |                 | be returned     |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Generate one extra key than the default:

.. code:: bash

   dash-cli -testnet keypoolrefill 1001

(No result shown: success.)

*See also*

-  `GetNewAddress <core-api-ref-remote-procedure-calls-wallet#getnewaddress>`__:
   returns a new Dash address for receiving payments. If an account is
   specified, payments received with the address will be credited to
   that account.
-  `GetAccountAddress <core-api-ref-remote-procedure-calls-wallet-deprecated#getaccountaddress>`__:
   returns the current Dash address for receiving payments to this
   account. If the account doesn’t exist, it creates both the account
   and a new address for receiving payment. Once a payment has been
   received to an address, future calls to this RPC for the same account
   will return a different address.
-  `GetWalletInfo <core-api-ref-remote-procedure-calls-wallet#getwalletinfo>`__:
   provides information about the wallet.

ListAddressBalances
===================

The ```listaddressbalances``
RPC <core-api-ref-remote-procedure-calls-wallet#listaddressbalances>`__
lists addresses of this wallet and their balances

*Parameter #1—Minimum Amount*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Minimum Amount  | numeric (int)   | Optional(0 or   | Minimum balance |
|                 |                 | 1)              | in DASH an      |
|                 |                 |                 | address should  |
|                 |                 |                 | have to be      |
|                 |                 |                 | shown in the    |
|                 |                 |                 | list            |
|                 |                 |                 | (default=0)     |
+-----------------+-----------------+-----------------+-----------------+

*Result—an object containing the addresses and their balances*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An object       |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | key/value pairs |
|                 |                 |                 | corresponding   |
|                 |                 |                 | to the          |
|                 |                 |                 | addresses with  |
|                 |                 |                 | balances > the  |
|                 |                 |                 | minimum amount. |
|                 |                 |                 | May be empty    |
+-----------------+-----------------+-----------------+-----------------+
| →Address/Amount | string          | Optional(1 or   | A key/value     |
|                 | (base58):number | more)           | pair with a     |
|                 | (DASH)          |                 | base            |
|                 |                 |                 | 58check-encoded |
|                 |                 |                 | string          |
|                 |                 |                 | containing the  |
|                 |                 |                 | address as the  |
|                 |                 |                 | key, and an     |
|                 |                 |                 | amount of DASH  |
|                 |                 |                 | as the value    |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.3*

.. code:: bash

   dash-cli -testnet listaddressbalances 25

Result:

.. code:: json

   {
     "yMQtQkcMBXrAZyqTGZeg7tQHzmbypGEP4w": 299.99990000,
     "yRyfgrHm4f5A8GGvqpqTFvbCrCQHJm1L4V": 99.13570000,
     "ybePwhPzUbiWzFhkgxPgP6iHnTLTyFH6sU": 123.45600000,
     "ycCdPQnjNEVRgrQY8j6mxEx9h7oaQpo5Ge": 500.00000000
   }

*See also:*

-  `ListAddressGroupings <core-api-ref-remote-procedure-calls-wallet#listaddressgroupings>`__:
   lists groups of addresses that may have had their common ownership
   made public by common use as inputs in the same transaction or from
   being used as change from a previous transaction.

ListAddressGroupings
====================

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block]

The ```listaddressgroupings``
RPC <core-api-ref-remote-procedure-calls-wallet#listaddressgroupings>`__
lists groups of addresses that may have had their common ownership made
public by common use as inputs in the same transaction or from being
used as change from a previous transaction.

*Parameters: none*

*Result—an array of arrays describing the groupings*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | An array        |
|                 |                 | equired(exactly | containing the  |
|                 |                 | 1)              | groupings. May  |
|                 |                 |                 | be empty        |
+-----------------+-----------------+-----------------+-----------------+
| →Groupings      | array           | Optional(0 or   | An array        |
|                 |                 | more)           | containing      |
|                 |                 |                 | arrays of       |
|                 |                 |                 | addresses which |
|                 |                 |                 | can be          |
|                 |                 |                 | associated with |
|                 |                 |                 | each other      |
+-----------------+-----------------+-----------------+-----------------+
| → →Address      | array           | Required(1 or   | An array        |
| Details         |                 | more)           | containing      |
|                 |                 |                 | information     |
|                 |                 |                 | about a         |
|                 |                 |                 | particular      |
|                 |                 |                 | address         |
+-----------------+-----------------+-----------------+-----------------+
| → → →Address    | string (base58) | R               | The address in  |
|                 |                 | equired(exactly | base58check     |
|                 |                 | 1)              | format          |
+-----------------+-----------------+-----------------+-----------------+
| → → →Amount     | number          | R               | The amount in   |
|                 | (bitcoins)      | equired(exactly | DASH            |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → → →Label      | string          | Optional(0 or   | *Replaced       |
|                 |                 | 1)              | “Account” in    |
|                 |                 |                 | Dash Core       |
|                 |                 |                 | 0.17.0*\ The    |
|                 |                 |                 | label the       |
|                 |                 |                 | address belongs |
|                 |                 |                 | to, if any.     |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

.. code:: bash

   dash-cli -testnet listaddressgroupings

Result (edited to only three results):

.. code:: json

   [
     [
       [
         "yacJKd6tRz2JSn8Wfp9GKgCbuowAEBivrA",
         10.00000000,
         "Doc test"
       ]
     ],
     [
       [
         "ye5XTjKqXyrVizEzky255NXUsaNSPC2W7k",
         5.00000000,
         ""
       ]
     ]
   ]

*See also*

-  `GetAddressesByAccount </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#getaddressesbyaccount>`__:
   returns a list of every address assigned to a particular account.
-  `GetTransaction <core-api-ref-remote-procedure-calls-wallet#gettransaction>`__:
   gets detailed information about an in-wallet transaction.
-  `ListAddressBalances <core-api-ref-remote-procedure-calls-wallet#listaddressbalances>`__:
   lists addresses of this wallet and their balances

ListLabels
==========

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**)” } [/block]

The ```listlabels``
RPC <core-api-ref-remote-procedure-calls-wallet#listlabels>`__ returns
the list of all labels, or labels that are assigned to addresses with a
specific purpose.

*Parameter #1—purpose*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Purpose         | string          | Optional(0 or   | Address purpose |
|                 |                 | 1)              | to list labels  |
|                 |                 |                 | for (``send``,  |
|                 |                 |                 | ``receive``).   |
|                 |                 |                 | An empty string |
|                 |                 |                 | is the same as  |
|                 |                 |                 | not providing   |
|                 |                 |                 | this argument.  |
+-----------------+-----------------+-----------------+-----------------+

*Result—a list of labels*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | A JSON array    |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | label names.    |
|                 |                 |                 | Must include,   |
|                 |                 |                 | at the very     |
|                 |                 |                 | least, the      |
|                 |                 |                 | default account |
|                 |                 |                 | (``""``).       |
+-----------------+-----------------+-----------------+-----------------+
| →Label          | string          | Required(1 or   | The name of a   |
|                 |                 | more)           | label.          |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

Display labels used for receiving.

.. code:: bash

   dash-cli -testnet listlabels "receive"

Result:

.. code:: json

   [
     "",
     "Doc test"
   ]

*See also*

-  `GetAddressesByLabel <core-api-ref-remote-procedure-calls-wallet#getaddressesbylabel>`__:
   returns the list of addresses assigned the specified label.
-  `ListReceivedByLabel <core-api-ref-remote-procedure-calls-wallet#listreceivedbylabel>`__:
   lists the total number of Dash received by each label.

ListLockUnspent
===============

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block]

The ```listlockunspent``
RPC <core-api-ref-remote-procedure-calls-wallet#listlockunspent>`__
returns a list of temporarily unspendable (locked) outputs.

*Parameters: none*

*Result—an array of locked outputs*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | An array        |
|                 |                 | equired(exactly | containing all  |
|                 |                 | 1)              | locked outputs. |
|                 |                 |                 | May be empty    |
+-----------------+-----------------+-----------------+-----------------+
| →Output         | object          | Optional(1 or   | An object       |
|                 |                 | more)           | describing a    |
|                 |                 |                 | particular      |
|                 |                 |                 | locked output   |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``txid``   | string (hex)    | R               | The TXID of the |
|                 |                 | equired(exactly | transaction     |
|                 |                 | 1)              | containing the  |
|                 |                 |                 | locked output,  |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``vout``   | number (int)    | R               | The output      |
|                 |                 | equired(exactly | index number    |
|                 |                 | 1)              | (vout) of the   |
|                 |                 |                 | locked output   |
|                 |                 |                 | within the      |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Output index    |
|                 |                 |                 | ``0`` is the    |
|                 |                 |                 | first output    |
|                 |                 |                 | within the      |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet listlockunspent

Result:

.. code:: json

   [
     {
       "txid": "d3d57ec5e4168b7145e911d019e9713563c1f2db5b2d6885739ea887feca4c87",
       "vout": 0
     }
   ]

*See also*

-  `LockUnspent <core-api-ref-remote-procedure-calls-wallet#lockunspent>`__:
   temporarily locks or unlocks specified transaction outputs. A locked
   transaction output will not be chosen by automatic coin selection
   when spending dash. Locks are stored in memory only, so nodes start
   with zero locked outputs and the locked output list is always cleared
   when a node stops or fails.

ListReceivedByAddress
=====================

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block]

The ```listreceivedbyaddress``
RPC <core-api-ref-remote-procedure-calls-wallet#listreceivedbyaddress>`__
lists the total number of dash received by each address.

*Parameter #1—the minimum number of confirmations a transaction must
have to be counted*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Confirmations   | number (int)    | Optional(0 or   | The minimum     |
|                 |                 | 1)              | number of       |
|                 |                 |                 | confirmations   |
|                 |                 |                 | an              |
|                 |                 |                 | exter           |
|                 |                 |                 | nally-generated |
|                 |                 |                 | transaction     |
|                 |                 |                 | must have       |
|                 |                 |                 | before it is    |
|                 |                 |                 | counted towards |
|                 |                 |                 | the balance.    |
|                 |                 |                 | Transactions    |
|                 |                 |                 | generated by    |
|                 |                 |                 | this node are   |
|                 |                 |                 | counted         |
|                 |                 |                 | immediately.    |
|                 |                 |                 | Typically,      |
|                 |                 |                 | exter           |
|                 |                 |                 | nally-generated |
|                 |                 |                 | transactions    |
|                 |                 |                 | are payments to |
|                 |                 |                 | this wallet and |
|                 |                 |                 | transactions    |
|                 |                 |                 | generated by    |
|                 |                 |                 | this node are   |
|                 |                 |                 | payments to     |
|                 |                 |                 | other wallets.  |
|                 |                 |                 | Use ``0`` to    |
|                 |                 |                 | count           |
|                 |                 |                 | unconfirmed     |
|                 |                 |                 | transactions.   |
|                 |                 |                 | Default is      |
|                 |                 |                 | ``1``           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—whether to include transactions locked via InstantSend*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| addlocked       | bool            | O               | Add the balance |
|                 |                 | ptional(exactly | from            |
|                 |                 | 1)              | InstantSend     |
|                 |                 |                 | locked          |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—whether to include empty accounts*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Include Empty   | bool            | Optional(0 or   | Set to ``true`` |
|                 |                 | 1)              | to display      |
|                 |                 |                 | accounts which  |
|                 |                 |                 | have never      |
|                 |                 |                 | received a      |
|                 |                 |                 | payment. Set to |
|                 |                 |                 | ``false`` (the  |
|                 |                 |                 | default) to     |
|                 |                 |                 | only include    |
|                 |                 |                 | accounts which  |
|                 |                 |                 | have received a |
|                 |                 |                 | payment. Any    |
|                 |                 |                 | account which   |
|                 |                 |                 | has received a  |
|                 |                 |                 | payment will be |
|                 |                 |                 | displayed even  |
|                 |                 |                 | if its current  |
|                 |                 |                 | balance is      |
|                 |                 |                 | ``0``           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #4—whether to include watch-only addresses in results*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Include         | bool            | Optional(0 or   | If set to       |
| Watch-Only      |                 | 1)              | ``true``,       |
|                 |                 |                 | include         |
|                 |                 |                 | watch-only      |
|                 |                 |                 | addresses in    |
|                 |                 |                 | details and     |
|                 |                 |                 | calculations as |
|                 |                 |                 | if they were    |
|                 |                 |                 | regular         |
|                 |                 |                 | addresses       |
|                 |                 |                 | belonging to    |
|                 |                 |                 | the wallet. If  |
|                 |                 |                 | set to          |
|                 |                 |                 | ``false`` (the  |
|                 |                 |                 | default), treat |
|                 |                 |                 | watch-only      |
|                 |                 |                 | addresses as if |
|                 |                 |                 | they didn’t     |
|                 |                 |                 | belong to this  |
|                 |                 |                 | wallet          |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #5—limit returned information to a specific address*

**Added in Dash Core 0.17.0**

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Address Filter  | string          | Optional(0 or   | If present,     |
|                 |                 | 1)              | only return     |
|                 |                 |                 | information for |
|                 |                 |                 | this address    |
+-----------------+-----------------+-----------------+-----------------+

*Result—addresses, account names, balances, and minimum confirmations*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | An array        |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | objects each    |
|                 |                 |                 | describing a    |
|                 |                 |                 | particular      |
|                 |                 |                 | address         |
+-----------------+-----------------+-----------------+-----------------+
| →Address        | object          | Optional(0 or   | An object       |
|                 |                 | more)           | describing an   |
|                 |                 |                 | address         |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | Optional(0 or   | Set to ``true`` |
| →\ ``invo       |                 | 1)              | if this address |
| lvesWatchonly`` |                 |                 | is a watch-only |
|                 |                 |                 | address which   |
|                 |                 |                 | has received a  |
|                 |                 |                 | spendable       |
|                 |                 |                 | payment (that   |
|                 |                 |                 | is, a payment   |
|                 |                 |                 | with at least   |
|                 |                 |                 | the specified   |
|                 |                 |                 | number of       |
|                 |                 |                 | confirmations   |
|                 |                 |                 | and which is    |
|                 |                 |                 | not an immature |
|                 |                 |                 | coinbase).      |
|                 |                 |                 | Otherwise not   |
|                 |                 |                 | returned        |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (base58) | R               | The address     |
| →\ ``address``  |                 | equired(exactly | being described |
|                 |                 | 1)              | encoded in      |
|                 |                 |                 | base58check     |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | *Deprecated:    |
| →\ ``account``  |                 | equired(exactly | will be removed |
|                 |                 | 1)              | in a later      |
|                 |                 |                 | version of Dash |
|                 |                 |                 | Core*\ The      |
|                 |                 |                 | account the     |
|                 |                 |                 | address belongs |
|                 |                 |                 | to. May be the  |
|                 |                 |                 | default         |
|                 |                 |                 | account, an     |
|                 |                 |                 | empty string    |
|                 |                 |                 | (\\“)”          |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``amount`` | number (dash)   | R               | The total       |
|                 |                 | equired(exactly | amount the      |
|                 |                 | 1)              | address has     |
|                 |                 |                 | received in     |
|                 |                 |                 | dash            |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | The number of   |
| →\ ``           |                 | equired(exactly | confirmations   |
| confirmations`` |                 | 1)              | of the latest   |
|                 |                 |                 | transaction to  |
|                 |                 |                 | the address.    |
|                 |                 |                 | May be ``0``    |
|                 |                 |                 | for unconfirmed |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``label``  | string          | R               | The account the |
|                 |                 | equired(exactly | address belongs |
|                 |                 | 1)              | to. May be the  |
|                 |                 |                 | default         |
|                 |                 |                 | account, an     |
|                 |                 |                 | empty string    |
|                 |                 |                 | (\\“)”          |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``txids``  | array           | R               | An array of     |
|                 |                 | equired(exactly | TXIDs belonging |
|                 |                 | 1)              | to transactions |
|                 |                 |                 | that pay the    |
|                 |                 |                 | address         |
+-----------------+-----------------+-----------------+-----------------+
| → → →TXID       | string          | Optional(0 or   | The TXID of a   |
|                 |                 | more)           | transaction     |
|                 |                 |                 | paying the      |
|                 |                 |                 | address,        |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.13.0*

List addresses with balances confirmed by at least six blocks, including
watch-only addresses. Also include the balance from InstantSend locked
transactions:

.. code:: bash

   dash-cli -testnet listreceivedbyaddress 6 true false true

Result (edit to show only two entries):

.. code:: json

   [
     {
       "address": "yV3ZTfwyfUmpspncMSitiwzh7EvqSGrqZA",
       "account": "",
       "amount": 1000.00000000,
       "confirmations": 26779,
       "label": "",
       "txids": [
         "0456aaf51a8df21dd47c2a06ede046a5bf7403bcb95d14d1d71b178c189fb933"
       ]
     },
     {
       "involvesWatchonly" : true,
       "address": "yfoR9uM3rcDfUc7AEfUNm5BjVYGFw7uQ9w",
       "account": "Watching",
       "amount": 1877.78476068,
       "confirmations": 26876,
       "label": "Watching",
       "txids": [
         "cd64114c803a2a243cb6ce4eb5c98e60cd2c688be8e900b3b957fe520cf42601",
         "83d3f7f31926908962e336341b1895d5f734f9d7149bdb35f0381cc78019bd83"
       ]
     }
   ]

*See also*

-  `ListReceivedByAccount </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#listreceivedbyaccount>`__:
   lists the total number of dash received by each account.
-  `GetReceivedByAddress <core-api-ref-remote-procedure-calls-wallet#getreceivedbyaddress>`__:
   returns the total amount received by the specified address in
   transactions with the specified number of confirmations. It does not
   count coinbase transactions.
-  `GetReceivedByAccount </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#getreceivedbyaccount>`__:
   returns the total amount received by addresses in a particular
   account from transactions with the specified number of confirmations.
   It does not count coinbase transactions.

ListReceivedByLabel
===================

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**)” } [/block] The
```listreceivedbylabel``
RPC <core-api-ref-remote-procedure-calls-wallet#listreceivedbylabel>`__
lists the total number of Dash received by each label.

*Parameter #1—the minimum number of confirmations a transaction must
have to be counted*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Confirmations   | number (int)    | Optional(0 or   | The minimum     |
|                 |                 | 1)              | number of       |
|                 |                 |                 | confirmations a |
|                 |                 |                 | transaction     |
|                 |                 |                 | must have       |
|                 |                 |                 | before it is    |
|                 |                 |                 | counted towards |
|                 |                 |                 | the balance.    |
|                 |                 |                 | Use ``0`` to    |
|                 |                 |                 | count           |
|                 |                 |                 | unconfirmed     |
|                 |                 |                 | transactions.   |
|                 |                 |                 | Default is      |
|                 |                 |                 | ``1``           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—whether to include transactions locked via InstantSend*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| addlocked       | bool            | O               | Add the balance |
|                 |                 | ptional(exactly | from            |
|                 |                 | 1)              | InstantSend     |
|                 |                 |                 | locked          |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—whether to include empty accounts*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Include Empty   | bool            | Optional(0 or   | Set to ``true`` |
|                 |                 | 1)              | to display      |
|                 |                 |                 | accounts which  |
|                 |                 |                 | have never      |
|                 |                 |                 | received a      |
|                 |                 |                 | payment. Set to |
|                 |                 |                 | ``false`` (the  |
|                 |                 |                 | default) to     |
|                 |                 |                 | only include    |
|                 |                 |                 | accounts which  |
|                 |                 |                 | have received a |
|                 |                 |                 | payment. Any    |
|                 |                 |                 | account which   |
|                 |                 |                 | has received a  |
|                 |                 |                 | payment will be |
|                 |                 |                 | displayed even  |
|                 |                 |                 | if its current  |
|                 |                 |                 | balance is      |
|                 |                 |                 | ``0``           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #4—whether to include watch-only addresses in results*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Include         | bool            | Optional(0 or   | If set to       |
| Watch-Only      |                 | 1)              | ``true``,       |
|                 |                 |                 | include         |
|                 |                 |                 | watch-only      |
|                 |                 |                 | addresses in    |
|                 |                 |                 | details and     |
|                 |                 |                 | calculations as |
|                 |                 |                 | if they were    |
|                 |                 |                 | regular         |
|                 |                 |                 | addresses       |
|                 |                 |                 | belonging to    |
|                 |                 |                 | the wallet. If  |
|                 |                 |                 | set to          |
|                 |                 |                 | ``false`` (the  |
|                 |                 |                 | default), treat |
|                 |                 |                 | watch-only      |
|                 |                 |                 | addresses as if |
|                 |                 |                 | they didn’t     |
|                 |                 |                 | belong to this  |
|                 |                 |                 | wallet          |
+-----------------+-----------------+-----------------+-----------------+

*Result—account names, balances, and minimum confirmations*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | An array        |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | objects each    |
|                 |                 |                 | describing an   |
|                 |                 |                 | account. At the |
|                 |                 |                 | very least, the |
|                 |                 |                 | default account |
|                 |                 |                 | (\\“) will be   |
|                 |                 |                 | included”       |
+-----------------+-----------------+-----------------+-----------------+
| →Label          | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing a    |
|                 |                 |                 | label           |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | Optional(0 or   | Set to ``true`` |
| →\ ``invo       |                 | 1)              | if the balance  |
| lvesWatchonly`` |                 |                 | of this account |
|                 |                 |                 | includes a      |
|                 |                 |                 | watch-only      |
|                 |                 |                 | address which   |
|                 |                 |                 | has received a  |
|                 |                 |                 | spendable       |
|                 |                 |                 | payment (that   |
|                 |                 |                 | is, a payment   |
|                 |                 |                 | with at least   |
|                 |                 |                 | the specified   |
|                 |                 |                 | number of       |
|                 |                 |                 | confirmations   |
|                 |                 |                 | and which is    |
|                 |                 |                 | not an immature |
|                 |                 |                 | coinbase).      |
|                 |                 |                 | Otherwise not   |
|                 |                 |                 | returned        |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | *Depreca        |
| →\ ``account``  |                 | equired(exactly | ted*\ Backwards |
|                 |                 | 1)              | compatible      |
|                 |                 |                 | alias for label |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``amount`` | number (dash)   | R               | The total       |
|                 |                 | equired(exactly | amount received |
|                 |                 | 1)              | by this account |
|                 |                 |                 | in dash         |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | The number of   |
| →\ ``           |                 | equired(exactly | confirmations   |
| confirmations`` |                 | 1)              | received by the |
|                 |                 |                 | last            |
|                 |                 |                 | transaction     |
|                 |                 |                 | received by     |
|                 |                 |                 | this account.   |
|                 |                 |                 | May be ``0``    |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``label``  | string          | Optional(0 or   | The label of    |
|                 |                 | 1)              | the receiving   |
|                 |                 |                 | address. The    |
|                 |                 |                 | default label   |
|                 |                 |                 | is ``""``.      |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

Get the balances for all non-empty accounts, including transactions
which have been confirmed at least six times and InstantSend locked
transactions:

.. code:: bash

   dash-cli -testnet listreceivedbylabel 6 true false true

Result:

.. code:: json

   [
     {
       "account": "",
       "amount": 5.00000000,
       "confirmations": 33,
       "label": ""
     },
     {
       "account": "Doc test",
       "amount": 10.00000000,
       "confirmations": 47,
       "label": "Doc test"
     }
   ]

*See also*

-  `ListReceivedByAddress <core-api-ref-remote-procedure-calls-wallet#listreceivedbyaddress>`__:
   lists the total number of dash received by each address.
-  `GetReceivedByAccount </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#getreceivedbyaccount>`__:
   returns the total amount received by addresses in a particular
   account from transactions with the specified number of confirmations.
   It does not count coinbase transactions.
-  `GetReceivedByAddress <core-api-ref-remote-procedure-calls-wallet#getreceivedbyaddress>`__:
   returns the total amount received by the specified address in
   transactions with the specified number of confirmations. It does not
   count coinbase transactions.

ListSinceBlock
==============

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block]

The ```listsinceblock``
RPC <core-api-ref-remote-procedure-calls-wallet#listsinceblock>`__ gets
all transactions affecting the wallet which have occurred since a
particular block, plus the header hash of a block at a particular depth.
[block:callout] { “type”: “danger”, “body”: “Breaking change(s) in Dash
Core 18.0. See parameter and/or response information for details.” }
[/block] *Parameter #1—a block header hash*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Header Hash     | string (hex)    | Optional(0 or   | The hash of a   |
|                 |                 | 1)              | block header    |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order. All      |
|                 |                 |                 | transactions    |
|                 |                 |                 | affecting the   |
|                 |                 |                 | wallet which    |
|                 |                 |                 | are not in that |
|                 |                 |                 | block or any    |
|                 |                 |                 | earlier block   |
|                 |                 |                 | will be         |
|                 |                 |                 | returned,       |
|                 |                 |                 | including       |
|                 |                 |                 | unconfirmed     |
|                 |                 |                 | transactions.   |
|                 |                 |                 | Default is the  |
|                 |                 |                 | hash of the     |
|                 |                 |                 | genesis block,  |
|                 |                 |                 | so all          |
|                 |                 |                 | transactions    |
|                 |                 |                 | affecting the   |
|                 |                 |                 | wallet are      |
|                 |                 |                 | returned by     |
|                 |                 |                 | default         |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the target confirmations for the lastblock field*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Target          | number (int)    | Optional(0 or   | Sets the        |
| Confirmations   |                 | 1)              | lastblock field |
|                 |                 |                 | of the results  |
|                 |                 |                 | to the header   |
|                 |                 |                 | hash of a block |
|                 |                 |                 | with this many  |
|                 |                 |                 | confirmations.  |
|                 |                 |                 | This does not   |
|                 |                 |                 | affect which    |
|                 |                 |                 | transactions    |
|                 |                 |                 | are returned.   |
|                 |                 |                 | Default is      |
|                 |                 |                 | ``1``, so the   |
|                 |                 |                 | hash of the     |
|                 |                 |                 | most recent     |
|                 |                 |                 | block on the    |
|                 |                 |                 | local best      |
|                 |                 |                 | block chain is  |
|                 |                 |                 | returned        |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—whether to include watch-only addresses in details and
calculations*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Include         | bool            | Optional(0 or   | If set to       |
| Watch-Only      |                 | 1)              | ``true``,       |
|                 |                 |                 | include         |
|                 |                 |                 | watch-only      |
|                 |                 |                 | addresses in    |
|                 |                 |                 | details and     |
|                 |                 |                 | calculations as |
|                 |                 |                 | if they were    |
|                 |                 |                 | regular         |
|                 |                 |                 | addresses       |
|                 |                 |                 | belonging to    |
|                 |                 |                 | the wallet. If  |
|                 |                 |                 | set to          |
|                 |                 |                 | ``false`` (the  |
|                 |                 |                 | default), treat |
|                 |                 |                 | watch-only      |
|                 |                 |                 | addresses as if |
|                 |                 |                 | they didn’t     |
|                 |                 |                 | belong to this  |
|                 |                 |                 | wallet          |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #4—include_removed*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| include_removed | bool            | OptionalDef     | Show            |
|                 |                 | ault=\ ``true`` | transactions    |
|                 |                 |                 | that were       |
|                 |                 |                 | removed due to  |
|                 |                 |                 | a reorg in the  |
|                 |                 |                 | :raw-la         |
|                 |                 |                 | tex:`\removed`" |
|                 |                 |                 | array (not      |
|                 |                 |                 | guaranteed to   |
|                 |                 |                 | work on pruned  |
|                 |                 |                 | nodes)"         |
+-----------------+-----------------+-----------------+-----------------+

**Result**

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An object       |
|                 |                 | equired(exactly | containing an   |
|                 |                 | 1)              | array of        |
|                 |                 |                 | transactions    |
|                 |                 |                 | and the         |
|                 |                 |                 | lastblock field |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | array           | R               | An array of     |
| `transactions`` |                 | equired(exactly | objects each    |
|                 |                 | 1)              | describing a    |
|                 |                 |                 | particular      |
|                 |                 |                 | **payment** to  |
|                 |                 |                 | or from this    |
|                 |                 |                 | wallet. The     |
|                 |                 |                 | objects in this |
|                 |                 |                 | array do not    |
|                 |                 |                 | describe an     |
|                 |                 |                 | actual          |
|                 |                 |                 | transactions,   |
|                 |                 |                 | so more than    |
|                 |                 |                 | one object in   |
|                 |                 |                 | this array may  |
|                 |                 |                 | come from the   |
|                 |                 |                 | same            |
|                 |                 |                 | transaction.    |
|                 |                 |                 | This array may  |
|                 |                 |                 | be empty        |
+-----------------+-----------------+-----------------+-----------------+
| → →Payment      | object          | Optional(0 or   | An payment      |
|                 |                 | more)           | which did not   |
|                 |                 |                 | appear in the   |
|                 |                 |                 | specified block |
|                 |                 |                 | or an earlier   |
|                 |                 |                 | block           |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | Optional(0 or   | Set to ``true`` |
| \ ``invo        |                 | 1)              | if the payment  |
| lvesWatchonly`` |                 |                 | involves a      |
|                 |                 |                 | watch-only      |
|                 |                 |                 | address.        |
|                 |                 |                 | Otherwise not   |
|                 |                 |                 | returned        |
+-----------------+-----------------+-----------------+-----------------+
| →               | [ST             | [STRIKEOUT:R    | **Removed in    |
| \ [STRIKEO      | RIKEOUT:string] | equired(exactly | Dash Core       |
| UT:``account``] |                 | 1)]             | 18.0**.         |
|                 |                 |                 | \ [STRIKEOUT:To |
|                 |                 |                 | see this        |
|                 |                 |                 | deprecated      |
|                 |                 |                 | field, start    |
|                 |                 |                 | dashd with      |
|                 |                 |                 | `               |
|                 |                 |                 | `-deprecatedrpc |
|                 |                 |                 | =accounts``.The |
|                 |                 |                 | account which   |
|                 |                 |                 | the payment was |
|                 |                 |                 | credited to or  |
|                 |                 |                 | debited from.   |
|                 |                 |                 | May be an empty |
|                 |                 |                 | string (\\“)    |
|                 |                 |                 | for the default |
|                 |                 |                 | account”]       |
+-----------------+-----------------+-----------------+-----------------+
| → \ ``address`` | string (base58) | Optional(0 or   | The address     |
|                 |                 | 1)              | paid in this    |
|                 |                 |                 | payment, which  |
|                 |                 |                 | may be someone  |
|                 |                 |                 | else’s address  |
|                 |                 |                 | not belonging   |
|                 |                 |                 | to this wallet. |
|                 |                 |                 | May be empty if |
|                 |                 |                 | the address is  |
|                 |                 |                 | unknown, such   |
|                 |                 |                 | as when paying  |
|                 |                 |                 | to a            |
|                 |                 |                 | non-standard    |
|                 |                 |                 | pubkey script   |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | Set to one of   |
| \ ``category``  |                 | equired(exactly | the following   |
|                 |                 | 1)              | values:•        |
|                 |                 |                 | ``send`` if     |
|                 |                 |                 | sending payment |
|                 |                 |                 | normally•       |
|                 |                 |                 | ``coinjoin`` if |
|                 |                 |                 | sending         |
|                 |                 |                 | CoinJoin        |
|                 |                 |                 | payment•        |
|                 |                 |                 | ``receive`` if  |
|                 |                 |                 | this wallet     |
|                 |                 |                 | received        |
|                 |                 |                 | payment in a    |
|                 |                 |                 | regular         |
|                 |                 |                 | transaction•    |
|                 |                 |                 | ``generate`` if |
|                 |                 |                 | a matured and   |
|                 |                 |                 | spendable       |
|                 |                 |                 | coinbase•       |
|                 |                 |                 | ``immature`` if |
|                 |                 |                 | a coinbase that |
|                 |                 |                 | is not          |
|                 |                 |                 | spendable yet•  |
|                 |                 |                 | ``orphan`` if a |
|                 |                 |                 | coinbase from a |
|                 |                 |                 | block that’s    |
|                 |                 |                 | not in the      |
|                 |                 |                 | local best      |
|                 |                 |                 | block chain     |
+-----------------+-----------------+-----------------+-----------------+
| → \ ``amount``  | number (dash)   | R               | A negative dash |
|                 |                 | equired(exactly | amount if       |
|                 |                 | 1)              | sending         |
|                 |                 |                 | payment; a      |
|                 |                 |                 | positive dash   |
|                 |                 |                 | amount if       |
|                 |                 |                 | receiving       |
|                 |                 |                 | payment         |
|                 |                 |                 | (including      |
|                 |                 |                 | coinbases)      |
+-----------------+-----------------+-----------------+-----------------+
| → \ ``vout``    | number (int)    | R               | For an output,  |
|                 |                 | equired(exactly | the output      |
|                 |                 | 1)              | index (vout)    |
|                 |                 |                 | for this output |
|                 |                 |                 | in this         |
|                 |                 |                 | transaction.    |
|                 |                 |                 | For an input,   |
|                 |                 |                 | the output      |
|                 |                 |                 | index for the   |
|                 |                 |                 | output being    |
|                 |                 |                 | spent in its    |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Because inputs  |
|                 |                 |                 | list the output |
|                 |                 |                 | indexes from    |
|                 |                 |                 | previous        |
|                 |                 |                 | transactions,   |
|                 |                 |                 | more than one   |
|                 |                 |                 | entry in the    |
|                 |                 |                 | details array   |
|                 |                 |                 | may have the    |
|                 |                 |                 | same output     |
|                 |                 |                 | index           |
+-----------------+-----------------+-----------------+-----------------+
| → \ ``fee``     | number (dash)   | Optional(0 or   | If sending      |
|                 |                 | 1)              | payment, the    |
|                 |                 |                 | fee paid as a   |
|                 |                 |                 | negative dash   |
|                 |                 |                 | value. May be   |
|                 |                 |                 | ``0``. Not      |
|                 |                 |                 | returned if     |
|                 |                 |                 | receiving       |
|                 |                 |                 | payment         |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | The number of   |
| \ ``            |                 | equired(exactly | confirmations   |
| confirmations`` |                 | 1)              | the transaction |
|                 |                 |                 | has received.   |
|                 |                 |                 | Will be ``0``   |
|                 |                 |                 | for unconfirmed |
|                 |                 |                 | and ``-1`` for  |
|                 |                 |                 | conflicted      |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | R               | **Always        |
| \               |                 | equired(exactly | ``false``       |
| ``instantlock`` |                 | 1)              | if**\ `lite     |
|                 |                 |                 | mode            |
|                 |                 |                 | <core-guide-das |
|                 |                 |                 | h-features#lite |
|                 |                 |                 | -mode>`__\ **is |
|                 |                 |                 | ena             |
|                 |                 |                 | bled**\ Current |
|                 |                 |                 | transaction     |
|                 |                 |                 | lock state      |
|                 |                 |                 | (InstantSend    |
|                 |                 |                 | and/or          |
|                 |                 |                 | ChainLock)      |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | R               | **Always        |
| \ ``instant     |                 | equired(exactly | ``false``       |
| lock_internal`` |                 | 1)              | if**\ `lite     |
|                 |                 |                 | mode            |
|                 |                 |                 | <core-guide-das |
|                 |                 |                 | h-features#lite |
|                 |                 |                 | -mode>`__\ **is |
|                 |                 |                 | ena             |
|                 |                 |                 | bled**\ Current |
|                 |                 |                 | InstantSend     |
|                 |                 |                 | transaction     |
|                 |                 |                 | lock state      |
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
| →               | bool            | Optional(0 or   | Set to ``true`` |
| \ ``generated`` |                 | 1)              | if the          |
|                 |                 |                 | transaction is  |
|                 |                 |                 | a coinbase. Not |
|                 |                 |                 | returned for    |
|                 |                 |                 | regular         |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | Optional(0 or   | The hash of the |
| \ ``blockhash`` |                 | 1)              | block on the    |
|                 |                 |                 | local best      |
|                 |                 |                 | block chain     |
|                 |                 |                 | which includes  |
|                 |                 |                 | this            |
|                 |                 |                 | transaction,    |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order. Only     |
|                 |                 |                 | returned for    |
|                 |                 |                 | confirmed       |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | Optional(0 or   | The index of    |
| \               |                 | 1)              | the transaction |
|  ``blockindex`` |                 |                 | in the block    |
|                 |                 |                 | that includes   |
|                 |                 |                 | it. Only        |
|                 |                 |                 | returned for    |
|                 |                 |                 | confirmed       |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | Optional(0 or   | The block       |
| \ ``blocktime`` |                 | 1)              | header time     |
|                 |                 |                 | (Unix epoch     |
|                 |                 |                 | time) of the    |
|                 |                 |                 | block on the    |
|                 |                 |                 | local best      |
|                 |                 |                 | block chain     |
|                 |                 |                 | which includes  |
|                 |                 |                 | this            |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Only returned   |
|                 |                 |                 | for confirmed   |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+
| → \ ``txid``    | string (hex)    | R               | The TXID of the |
|                 |                 | equired(exactly | transaction,    |
|                 |                 | 1)              | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+
| →               | array           | R               | An array        |
| \ ``wa          |                 | equired(exactly | containing the  |
| lletconflicts`` |                 | 1)              | TXIDs of other  |
|                 |                 |                 | transactions    |
|                 |                 |                 | that spend the  |
|                 |                 |                 | same inputs     |
|                 |                 |                 | (UTXOs) as this |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Array may be    |
|                 |                 |                 | empty           |
+-----------------+-----------------+-----------------+-----------------+
| → →TXID         | string (hex)    | Optional(0 or   | The TXID of a   |
|                 |                 | more)           | conflicting     |
|                 |                 |                 | transaction,    |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+
| → \ ``time``    | number (int)    | R               | A Unix epoch    |
|                 |                 | equired(exactly | time when the   |
|                 |                 | 1)              | transaction was |
|                 |                 |                 | added to the    |
|                 |                 |                 | wallet          |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | A Unix epoch    |
| \ `             |                 | equired(exactly | time when the   |
| `timereceived`` |                 | 1)              | transaction was |
|                 |                 |                 | detected by the |
|                 |                 |                 | local node, or  |
|                 |                 |                 | the time of the |
|                 |                 |                 | block on the    |
|                 |                 |                 | local best      |
|                 |                 |                 | block chain     |
|                 |                 |                 | that included   |
|                 |                 |                 | the transaction |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | Optional(0 or   | ``true`` if the |
| \ ``abandoned`` |                 | 1)              | transaction has |
|                 |                 |                 | been abandoned  |
|                 |                 |                 | (inputs are     |
|                 |                 |                 | respendable).   |
|                 |                 |                 | Only available  |
|                 |                 |                 | for the ‘send’  |
|                 |                 |                 | category of     |
|                 |                 |                 | transactions.   |
+-----------------+-----------------+-----------------+-----------------+
| → \ ``comment`` | string          | Optional(0 or   | For transaction |
|                 |                 | 1)              | originating     |
|                 |                 |                 | with this       |
|                 |                 |                 | wallet, a       |
|                 |                 |                 | locally-stored  |
|                 |                 |                 | comment added   |
|                 |                 |                 | to the          |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Only returned   |
|                 |                 |                 | if a comment    |
|                 |                 |                 | was added       |
+-----------------+-----------------+-----------------+-----------------+
| → \ ``to``      | string          | Optional(0 or   | For transaction |
|                 |                 | 1)              | originating     |
|                 |                 |                 | with this       |
|                 |                 |                 | wallet, a       |
|                 |                 |                 | locally-stored  |
|                 |                 |                 | comment added   |
|                 |                 |                 | to the          |
|                 |                 |                 | transaction     |
|                 |                 |                 | identifying who |
|                 |                 |                 | the transaction |
|                 |                 |                 | was sent to.    |
|                 |                 |                 | Only returned   |
|                 |                 |                 | if a comment-to |
|                 |                 |                 | was added       |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``removed``  | array           | Optional(0 or   | Structure is    |
|                 |                 | 1)              | the same as     |
|                 |                 |                 | ``              |
|                 |                 |                 | transactions``. |
|                 |                 |                 | Only present if |
|                 |                 |                 | ``in            |
|                 |                 |                 | clude_removed`` |
|                 |                 |                 | is              |
|                 |                 |                 | ``t             |
|                 |                 |                 | rue``.\ *Note*: |
|                 |                 |                 | transactions    |
|                 |                 |                 | that were       |
|                 |                 |                 | re-added in the |
|                 |                 |                 | active chain    |
|                 |                 |                 | will appear     |
|                 |                 |                 | as-is in this   |
|                 |                 |                 | array, and may  |
|                 |                 |                 | thus have a     |
|                 |                 |                 | positive        |
|                 |                 |                 | confirmation    |
|                 |                 |                 | count.          |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | The header hash |
| \ ``lastblock`` |                 | equired(exactly | of the block    |
|                 |                 | 1)              | with the number |
|                 |                 |                 | of              |
|                 |                 |                 | confirmations   |
|                 |                 |                 | specified in    |
|                 |                 |                 | the *target     |
|                 |                 |                 | confirmations*  |
|                 |                 |                 | parameter,      |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

Get all transactions since a particular block (including watch-only
transactions) and the header hash of the sixth most recent block.

.. code:: bash

   dash-cli -testnet listsinceblock \
                 0000000001fc119ea77e0c67783227fb9d55386125179ea5597109d311af2337 \
                 6 true true

Result (edited to show only two payments):

.. code:: json

   {
     "transactions": [
       {
         "address": "yYYFByVqsqCNfJ6J8i7rWZuW7a6paphxTM",
         "category": "generate",
         "amount": 11.25000784,
         "label": "Mining",
         "vout": 0,
         "confirmations": 217129,
         "instantlock": true,
         "instantlock_internal": false,
         "chainlock": true,
         "generated": true,
         "blockhash": "00000d6fab6ee232096d3c33c813684e249e6a23e5e42b25122fd3a60249fec4",
         "blockindex": 0,
         "blocktime": 1573452255,
         "txid": "f1ebc584d6aa9c3750ed3bff8e794c190f7046ac86386b6e61c05886c3bd0200",
         "walletconflicts": [
         ],
         "time": 1573452255,
         "timereceived": 1573478830
       },
       {
         "address": "yPAaweTvCYXaoUwxMFJ31sTdKiARUBZYhd",
         "category": "send",
         "amount": -10.00010000,
         "vout": 0,
         "fee": 10.00010000,
         "confirmations": 36635,
         "instantlock": true,
         "instantlock_internal": false,
         "chainlock": true,
         "blockhash": "0000068eee543783408586f3895afe45839ed1bf6f586566cd56f0449fd1f5ce",
         "blockindex": 11,
         "blocktime": 1601325843,
         "txid": "3b8d8ff1d539391c8dfb176bda2c012c08924ac0fbbc098c890412e22af80800",
         "walletconflicts": [
         ],
         "time": 1601325735,
         "timereceived": 1601325735,
         "abandoned": false
       }
     ],
     "lastblock": "000001f419feac4ce2ec47190b5d380ce137f35f3a3e13b322ff89428fe75f2c"
   }

*See also*

-  `ListReceivedByAccount </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#listreceivedbyaccount>`__:
   lists the total number of dash received by each account.
-  `ListReceivedByAddress <core-api-ref-remote-procedure-calls-wallet#listreceivedbyaddress>`__:
   lists the total number of dash received by each address.

ListTransactions
================

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block]

The ```listtransactions``
RPC <core-api-ref-remote-procedure-calls-wallet#listtransactions>`__
returns the most recent transactions that affect the wallet. If a label
name is provided, this will return only incoming transactions paying to
addresses with the specified label.

*Parameter #1—a label name*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Label           | string          | Optional(0 or   | If set, should  |
|                 |                 | 1)              | be a valid      |
|                 |                 |                 | label name to   |
|                 |                 |                 | return only     |
|                 |                 |                 | incoming        |
|                 |                 |                 | transactions    |
|                 |                 |                 | with the        |
|                 |                 |                 | specified       |
|                 |                 |                 | label, or       |
|                 |                 |                 | ``"*"`` to      |
|                 |                 |                 | disable         |
|                 |                 |                 | filtering and   |
|                 |                 |                 | return all      |
|                 |                 |                 | transactions.   |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the number of transactions to get*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Count           | number (int)    | Optional(0 or   | The number of   |
|                 |                 | 1)              | the most recent |
|                 |                 |                 | transactions to |
|                 |                 |                 | list. Default   |
|                 |                 |                 | is ``10``       |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—the number of transactions to skip*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Skip            | number (int)    | Optional(0 or   | The number of   |
|                 |                 | 1)              | the most recent |
|                 |                 |                 | transactions    |
|                 |                 |                 | which should    |
|                 |                 |                 | not be          |
|                 |                 |                 | returned.       |
|                 |                 |                 | Allows for      |
|                 |                 |                 | pagination of   |
|                 |                 |                 | results.        |
|                 |                 |                 | Default is      |
|                 |                 |                 | ``0``           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #4—whether to include watch-only addresses in details and
calculations*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Include         | bool            | Optional(0 or   | If set to       |
| Watch-Only      |                 | 1)              | ``true``,       |
|                 |                 |                 | include         |
|                 |                 |                 | watch-only      |
|                 |                 |                 | addresses in    |
|                 |                 |                 | details and     |
|                 |                 |                 | calculations as |
|                 |                 |                 | if they were    |
|                 |                 |                 | regular         |
|                 |                 |                 | addresses       |
|                 |                 |                 | belonging to    |
|                 |                 |                 | the wallet. If  |
|                 |                 |                 | set to          |
|                 |                 |                 | ``false`` (the  |
|                 |                 |                 | default), treat |
|                 |                 |                 | watch-only      |
|                 |                 |                 | addresses as if |
|                 |                 |                 | they didn’t     |
|                 |                 |                 | belong to this  |
|                 |                 |                 | wallet          |
+-----------------+-----------------+-----------------+-----------------+

*Result—payment details*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | An array        |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | objects, with   |
|                 |                 |                 | each object     |
|                 |                 |                 | describing a    |
|                 |                 |                 | **payment** or  |
|                 |                 |                 | internal        |
|                 |                 |                 | accounting      |
|                 |                 |                 | entry (not a    |
|                 |                 |                 | transaction).   |
|                 |                 |                 | More than one   |
|                 |                 |                 | object in this  |
|                 |                 |                 | array may come  |
|                 |                 |                 | from a single   |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Array may be    |
|                 |                 |                 | empty           |
+-----------------+-----------------+-----------------+-----------------+
| →Payment        | object          | Optional(0 or   | A payment or    |
|                 |                 | more)           | internal        |
|                 |                 |                 | accounting      |
|                 |                 |                 | entry           |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (base58) | Optional(0 or   | The address     |
| →\ ``address``  |                 | 1)              | paid in this    |
|                 |                 |                 | payment, which  |
|                 |                 |                 | may be someone  |
|                 |                 |                 | else’s address  |
|                 |                 |                 | not belonging   |
|                 |                 |                 | to this wallet. |
|                 |                 |                 | May be empty if |
|                 |                 |                 | the address is  |
|                 |                 |                 | unknown, such   |
|                 |                 |                 | as when paying  |
|                 |                 |                 | to a            |
|                 |                 |                 | non-standard    |
|                 |                 |                 | pubkey script   |
|                 |                 |                 | or if this is   |
|                 |                 |                 | in the *move*   |
|                 |                 |                 | category        |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | Set to one of   |
| →\ ``category`` |                 | equired(exactly | the following   |
|                 |                 | 1)              | values:•        |
|                 |                 |                 | ``send`` if     |
|                 |                 |                 | sending         |
|                 |                 |                 | payment•        |
|                 |                 |                 | ``receive`` if  |
|                 |                 |                 | this wallet     |
|                 |                 |                 | received        |
|                 |                 |                 | payment in a    |
|                 |                 |                 | regular         |
|                 |                 |                 | transaction•    |
|                 |                 |                 | ``generate`` if |
|                 |                 |                 | a matured and   |
|                 |                 |                 | spendable       |
|                 |                 |                 | coinbase•       |
|                 |                 |                 | ``immature`` if |
|                 |                 |                 | a coinbase that |
|                 |                 |                 | is not          |
|                 |                 |                 | spendable yet•  |
|                 |                 |                 | ``orphan`` if a |
|                 |                 |                 | coinbase from a |
|                 |                 |                 | block that’s    |
|                 |                 |                 | not in the      |
|                 |                 |                 | local best      |
|                 |                 |                 | block chain•    |
|                 |                 |                 | ``move`` if an  |
|                 |                 |                 | off-block-chain |
|                 |                 |                 | move made with  |
|                 |                 |                 | the ```move``   |
|                 |                 |                 | RPC <co         |
|                 |                 |                 | re-api-ref-remo |
|                 |                 |                 | te-procedure-ca |
|                 |                 |                 | lls-wallet-depr |
|                 |                 |                 | ecated#move>`__ |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``amount`` | number (dash)   | R               | A negative dash |
|                 |                 | equired(exactly | amount if       |
|                 |                 | 1)              | sending         |
|                 |                 |                 | payment; a      |
|                 |                 |                 | positive dash   |
|                 |                 |                 | amount if       |
|                 |                 |                 | receiving       |
|                 |                 |                 | payment         |
|                 |                 |                 | (including      |
|                 |                 |                 | coinbases)      |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``label``  | string          | Optional(0 or   | A comment for   |
|                 |                 | 1)              | the             |
|                 |                 |                 | addr            |
|                 |                 |                 | ess/transaction |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``vout``   | number (int)    | Optional(0 or   | For an output,  |
|                 |                 | 1)              | the output      |
|                 |                 |                 | index (vout)    |
|                 |                 |                 | for this output |
|                 |                 |                 | in this         |
|                 |                 |                 | transaction.    |
|                 |                 |                 | For an input,   |
|                 |                 |                 | the output      |
|                 |                 |                 | index for the   |
|                 |                 |                 | output being    |
|                 |                 |                 | spent in its    |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Because inputs  |
|                 |                 |                 | list the output |
|                 |                 |                 | indexes from    |
|                 |                 |                 | previous        |
|                 |                 |                 | transactions,   |
|                 |                 |                 | more than one   |
|                 |                 |                 | entry in the    |
|                 |                 |                 | details array   |
|                 |                 |                 | may have the    |
|                 |                 |                 | same output     |
|                 |                 |                 | index. Not      |
|                 |                 |                 | returned for    |
|                 |                 |                 | *move* category |
|                 |                 |                 | payments        |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``fee``    | number (dash)   | Optional(0 or   | If sending      |
|                 |                 | 1)              | payment, the    |
|                 |                 |                 | fee paid as a   |
|                 |                 |                 | negative dash   |
|                 |                 |                 | value. May be   |
|                 |                 |                 | ``0``. Not      |
|                 |                 |                 | returned if     |
|                 |                 |                 | receiving       |
|                 |                 |                 | payment or for  |
|                 |                 |                 | *move* category |
|                 |                 |                 | payments        |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | Optional(0 or   | The number of   |
| →\ ``           |                 | 1)              | confirmations   |
| confirmations`` |                 |                 | the transaction |
|                 |                 |                 | has received.   |
|                 |                 |                 | Will be ``0``   |
|                 |                 |                 | for unconfirmed |
|                 |                 |                 | and ``-1`` for  |
|                 |                 |                 | conflicted. Not |
|                 |                 |                 | returned for    |
|                 |                 |                 | *move* category |
|                 |                 |                 | payments        |
+-----------------+-----------------+-----------------+-----------------+
| →\              | bool            | R               | **Always        |
| ``instantlock`` |                 | equired(exactly | ``false``       |
|                 |                 | 1)              | if**\ `lite     |
|                 |                 |                 | mode            |
|                 |                 |                 | <core-guide-das |
|                 |                 |                 | h-features#lite |
|                 |                 |                 | -mode>`__\ **is |
|                 |                 |                 | ena             |
|                 |                 |                 | bled**\ Current |
|                 |                 |                 | transaction     |
|                 |                 |                 | lock state      |
|                 |                 |                 | (InstantSend    |
|                 |                 |                 | and/or          |
|                 |                 |                 | ChainLock)      |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``instant    | bool            | R               | **Always        |
| lock_internal`` |                 | equired(exactly | ``false``       |
|                 |                 | 1)              | if**\ `lite     |
|                 |                 |                 | mode            |
|                 |                 |                 | <core-guide-das |
|                 |                 |                 | h-features#lite |
|                 |                 |                 | -mode>`__\ **is |
|                 |                 |                 | ena             |
|                 |                 |                 | bled**\ Current |
|                 |                 |                 | InstantSend     |
|                 |                 |                 | transaction     |
|                 |                 |                 | lock state      |
+-----------------+-----------------+-----------------+-----------------+
| \ ``chainlock`` | bool            | R               | *Added in Dash  |
|                 |                 | equired(exactly | Core            |
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
| →               | bool            | Optional(0 or   | Set to ``true`` |
| →               |                 | 1)              | if the          |
| \ ``generated`` |                 |                 | transaction is  |
|                 |                 |                 | a coinbase. Not |
|                 |                 |                 | returned for    |
|                 |                 |                 | regular         |
|                 |                 |                 | transactions or |
|                 |                 |                 | *move* category |
|                 |                 |                 | payments        |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | Optional(0 or   | Indicates       |
| →\ ``trusted``  |                 | 1)              | whether we      |
|                 |                 |                 | consider the    |
|                 |                 |                 | outputs of this |
|                 |                 |                 | unconfirmed     |
|                 |                 |                 | transaction     |
|                 |                 |                 | safe to spend.  |
|                 |                 |                 | Only returned   |
|                 |                 |                 | for unconfirmed |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | Optional(0 or   | The hash of the |
| →               |                 | 1)              | block on the    |
| \ ``blockhash`` |                 |                 | local best      |
|                 |                 |                 | block chain     |
|                 |                 |                 | which includes  |
|                 |                 |                 | this            |
|                 |                 |                 | transaction,    |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order. Only     |
|                 |                 |                 | returned for    |
|                 |                 |                 | confirmed       |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | Optional(0 or   | The index of    |
| →\              |                 | 1)              | the transaction |
|  ``blockindex`` |                 |                 | in the block    |
|                 |                 |                 | that includes   |
|                 |                 |                 | it. Only        |
|                 |                 |                 | returned for    |
|                 |                 |                 | confirmed       |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | Optional(0 or   | The block       |
| →               |                 | 1)              | header time     |
| \ ``blocktime`` |                 |                 | (Unix epoch     |
|                 |                 |                 | time) of the    |
|                 |                 |                 | block on the    |
|                 |                 |                 | local best      |
|                 |                 |                 | block chain     |
|                 |                 |                 | which includes  |
|                 |                 |                 | this            |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Only returned   |
|                 |                 |                 | for confirmed   |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``txid``   | string (hex)    | Optional(0 or   | The TXID of the |
|                 |                 | 1)              | transaction,    |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order. Not      |
|                 |                 |                 | returned for    |
|                 |                 |                 | *move* category |
|                 |                 |                 | payments        |
+-----------------+-----------------+-----------------+-----------------+
| →               | array           | Optional(0 or   | An array        |
| →\ ``wa         |                 | 1)              | containing the  |
| lletconflicts`` |                 |                 | TXIDs of other  |
|                 |                 |                 | transactions    |
|                 |                 |                 | that spend the  |
|                 |                 |                 | same inputs     |
|                 |                 |                 | (UTXOs) as this |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Array may be    |
|                 |                 |                 | empty. Not      |
|                 |                 |                 | returned for    |
|                 |                 |                 | *move* category |
|                 |                 |                 | payments        |
+-----------------+-----------------+-----------------+-----------------+
| → → →TXID       | string (hex)    | Optional(0 or   | The TXID of a   |
|                 |                 | more)           | conflicting     |
|                 |                 |                 | transaction,    |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``time``   | number (int)    | R               | A Unix epoch    |
|                 |                 | equired(exactly | time when the   |
|                 |                 | 1)              | transaction was |
|                 |                 |                 | added to the    |
|                 |                 |                 | wallet          |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | Optional(0 or   | A Unix epoch    |
| →\ `            |                 | 1)              | time when the   |
| `timereceived`` |                 |                 | transaction was |
|                 |                 |                 | detected by the |
|                 |                 |                 | local node, or  |
|                 |                 |                 | the time of the |
|                 |                 |                 | block on the    |
|                 |                 |                 | local best      |
|                 |                 |                 | block chain     |
|                 |                 |                 | that included   |
|                 |                 |                 | the             |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Not returned    |
|                 |                 |                 | for *move*      |
|                 |                 |                 | category        |
|                 |                 |                 | payments        |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | Optional(0 or   | For transaction |
| →\ ``comment``  |                 | 1)              | originating     |
|                 |                 |                 | with this       |
|                 |                 |                 | wallet, a       |
|                 |                 |                 | locally-stored  |
|                 |                 |                 | comment added   |
|                 |                 |                 | to the          |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Only returned   |
|                 |                 |                 | in regular      |
|                 |                 |                 | payments if a   |
|                 |                 |                 | comment was     |
|                 |                 |                 | added. Always   |
|                 |                 |                 | returned in     |
|                 |                 |                 | *move* category |
|                 |                 |                 | payments. May   |
|                 |                 |                 | be an empty     |
|                 |                 |                 | string          |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``to``     | string          | Optional(0 or   | For transaction |
|                 |                 | 1)              | originating     |
|                 |                 |                 | with this       |
|                 |                 |                 | wallet, a       |
|                 |                 |                 | locally-stored  |
|                 |                 |                 | comment added   |
|                 |                 |                 | to the          |
|                 |                 |                 | transaction     |
|                 |                 |                 | identifying who |
|                 |                 |                 | the transaction |
|                 |                 |                 | was sent to.    |
|                 |                 |                 | Only returned   |
|                 |                 |                 | if a comment-to |
|                 |                 |                 | was added.      |
|                 |                 |                 | Never returned  |
|                 |                 |                 | by *move*       |
|                 |                 |                 | category        |
|                 |                 |                 | payments. May   |
|                 |                 |                 | be an empty     |
|                 |                 |                 | string          |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | Optional(0 or   | This is the     |
| →\ `            |                 | 1)              | account the     |
| `otheraccount`` |                 |                 | dash were moved |
|                 |                 |                 | from or moved   |
|                 |                 |                 | to, as          |
|                 |                 |                 | indicated by a  |
|                 |                 |                 | negative or     |
|                 |                 |                 | positive        |
|                 |                 |                 | *amount* field  |
|                 |                 |                 | in this         |
|                 |                 |                 | payment. Only   |
|                 |                 |                 | returned by     |
|                 |                 |                 | *move* category |
|                 |                 |                 | payments        |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | Optional(0 or   | *Added in       |
| →               |                 | 1)              | Bitcoin Core    |
| \ ``abandoned`` |                 |                 | 0.1             |
|                 |                 |                 | 2.1*\ Indicates |
|                 |                 |                 | if a            |
|                 |                 |                 | transaction is  |
|                 |                 |                 | was abandoned:• |
|                 |                 |                 | ``true`` if it  |
|                 |                 |                 | was abandoned   |
|                 |                 |                 | (inputs are     |
|                 |                 |                 | respendable)•   |
|                 |                 |                 | ``false`` if it |
|                 |                 |                 | was not         |
|                 |                 |                 | abandonedOnly   |
|                 |                 |                 | returned by     |
|                 |                 |                 | *send* category |
|                 |                 |                 | payments        |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

List the most recent transaction including watch-only addresses.

.. code:: bash

   dash-cli listtransactions "*" 1 0 true

Result:

.. code:: json

   [
     {
       "address": "ySjAeJ7CmHZrkXaxv54X9ZnPZqAgTSabhK",
       "category": "send",
       "amount": -0.50000000,
       "label": "",
       "vout": 0,
       "fee": -0.00000226,
       "confirmations": 14,
       "instantlock": true,
       "instantlock_internal": false,
       "chainlock": true,
       "blockhash": "000000a37134cb52e7310f651131a6c168e7c0ef87f84260b7811c202e011f0f",
       "blockindex": 2,
       "blocktime": 1610645212,
       "txid": "06697c9f9c713473ba00b3d96118546b88d1da89adaae89ea6b760fea23ebad0",
       "walletconflicts": [
       ],
       "time": 1610645190,
       "timereceived": 1610645190,
       "abandoned": false
     }
   ]

*See also*

-  `GetTransaction <core-api-ref-remote-procedure-calls-wallet#gettransaction>`__:
   gets detailed information about an in-wallet transaction.
-  `ListSinceBlock <core-api-ref-remote-procedure-calls-wallet#listsinceblock>`__:
   gets all transactions affecting the wallet which have occurred since
   a particular block, plus the header hash of a block at a particular
   depth.

ListUnspent
===========

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block]

The ```listunspent``
RPC <core-api-ref-remote-procedure-calls-wallet#listunspent>`__ returns
an array of unspent transaction outputs belonging to this wallet.
**Note:** as of Bitcoin Core 0.10.0, outputs affecting watch-only
addresses will be returned; see the *spendable* field in the results
described below. [block:callout] { “type”: “danger”, “body”: “Breaking
change(s) in Dash Core 18.0. See parameter and/or response information
for details.” } [/block] *Parameter #1—the minimum number of
confirmations an output must have*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Minimum         | number (int)    | Optional(0 or   | The minimum     |
| Confirmations   |                 | 1)              | number of       |
|                 |                 |                 | confirmations   |
|                 |                 |                 | the transaction |
|                 |                 |                 | containing an   |
|                 |                 |                 | output must     |
|                 |                 |                 | have in order   |
|                 |                 |                 | to be returned. |
|                 |                 |                 | Use ``0`` to    |
|                 |                 |                 | return outputs  |
|                 |                 |                 | from            |
|                 |                 |                 | unconfirmed     |
|                 |                 |                 | transactions.   |
|                 |                 |                 | Default is      |
|                 |                 |                 | ``1``           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the maximum number of confirmations an output may have*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Maximum         | number (int)    | Optional(0 or   | The maximum     |
| Confirmations   |                 | 1)              | number of       |
|                 |                 |                 | confirmations   |
|                 |                 |                 | the transaction |
|                 |                 |                 | containing an   |
|                 |                 |                 | output may have |
|                 |                 |                 | in order to be  |
|                 |                 |                 | returned.       |
|                 |                 |                 | Default is      |
|                 |                 |                 | ``9999999``     |
|                 |                 |                 | (~10 million)   |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—the addresses an output must pay*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Addresses       | array           | Optional(0 or   | If present,     |
|                 |                 | 1)              | only outputs    |
|                 |                 |                 | which pay an    |
|                 |                 |                 | address in this |
|                 |                 |                 | array will be   |
|                 |                 |                 | returned        |
+-----------------+-----------------+-----------------+-----------------+
| →Address        | string (base58) | Required(1 or   | A P2PKH or P2SH |
|                 |                 | more)           | address         |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #4—include unsafe outputs*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Include Unsafe  | bool            | Optional(false  | Include outputs |
|                 |                 | or true)        | that are not    |
|                 |                 |                 | safe to spend . |
|                 |                 |                 | See description |
|                 |                 |                 | of ``safe``     |
|                 |                 |                 | attribute       |
|                 |                 |                 | below. Default  |
|                 |                 |                 | is ``true``     |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #5—query options*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Query Options   | json            | Optional        | JSON with query |
|                 |                 |                 | options.        |
|                 |                 |                 | Available       |
|                 |                 |                 | options: -      |
|                 |                 |                 | ``m             |
|                 |                 |                 | inimumAmount``: |
|                 |                 |                 | Minimum value   |
|                 |                 |                 | of each UTXO in |
|                 |                 |                 | DASH -          |
|                 |                 |                 | ``m             |
|                 |                 |                 | aximumAmount``: |
|                 |                 |                 | Maximum value   |
|                 |                 |                 | of each UTXO in |
|                 |                 |                 | DASH -          |
|                 |                 |                 | ``              |
|                 |                 |                 | maximumCount``: |
|                 |                 |                 | Maximum number  |
|                 |                 |                 | of UTXOs -      |
|                 |                 |                 | ``mini          |
|                 |                 |                 | mumSumAmount``: |
|                 |                 |                 | Minimum sum     |
|                 |                 |                 | value of all    |
|                 |                 |                 | UTXOs in DASH - |
|                 |                 |                 | ``cointType``:  |
|                 |                 |                 | Filter          |
|                 |                 |                 | coinTypes as    |
|                 |                 |                 | follows:0 =     |
|                 |                 |                 | ``ALL_COINS``,  |
|                 |                 |                 | 1 =             |
|                 |                 |                 | ``ONLY          |
|                 |                 |                 | _FULLY_MIXED``, |
|                 |                 |                 | 2 =             |
|                 |                 |                 | ``ONLY_         |
|                 |                 |                 | READY_TO_MIX``, |
|                 |                 |                 | 3 =             |
|                 |                 |                 | ``ONLY_NO       |
|                 |                 |                 | NDENOMINATED``, |
|                 |                 |                 | 4 =             |
|                 |                 |                 | `               |
|                 |                 |                 | `ONLY_MASTERNOD |
|                 |                 |                 | E_COLLATERAL``, |
|                 |                 |                 | 5 =             |
|                 |                 |                 | ``ONLY_COINJO   |
|                 |                 |                 | IN_COLLATERAL`` |
+-----------------+-----------------+-----------------+-----------------+

*Result—the list of unspent outputs*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | An array of     |
|                 |                 | equired(exactly | objects each    |
|                 |                 | 1)              | describing an   |
|                 |                 |                 | unspent output. |
|                 |                 |                 | May be empty    |
+-----------------+-----------------+-----------------+-----------------+
| →Unspent Output | object          | Optional(0 or   | An object       |
|                 |                 | more)           | describing a    |
|                 |                 |                 | particular      |
|                 |                 |                 | unspent output  |
|                 |                 |                 | belonging to    |
|                 |                 |                 | this wallet     |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``txid``   | string (hex)    | R               | The TXID of the |
|                 |                 | equired(exactly | transaction     |
|                 |                 | 1)              | containing the  |
|                 |                 |                 | output, encoded |
|                 |                 |                 | as hex in RPC   |
|                 |                 |                 | byte order      |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``vout``   | number (int)    | R               | The output      |
|                 |                 | equired(exactly | index number    |
|                 |                 | 1)              | (vout) of the   |
|                 |                 |                 | output within   |
|                 |                 |                 | its containing  |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (base58) | Optional(0 or   | The P2PKH or    |
| →\ ``address``  |                 | 1)              | P2SH address    |
|                 |                 |                 | the output      |
|                 |                 |                 | paid. Only      |
|                 |                 |                 | returned for    |
|                 |                 |                 | P2PKH or P2SH   |
|                 |                 |                 | output scripts  |
+-----------------+-----------------+-----------------+-----------------+
| →               | [ST             | [STRIK          | **Removed in    |
| →\ [STRIKEO     | RIKEOUT:string] | EOUT:Optional(0 | Dash Core       |
| UT:``account``] |                 | or 1)]          | 18.0**\ \       |
|                 |                 |                 | [STRIKEOUT:This |
|                 |                 |                 | field will be   |
|                 |                 |                 | removed in      |
|                 |                 |                 | V18.0. To see   |
|                 |                 |                 | this deprecated |
|                 |                 |                 | field, start    |
|                 |                 |                 | dashd with      |
|                 |                 |                 | ``-deprecatedrp |
|                 |                 |                 | c=accounts``.If |
|                 |                 |                 | the address     |
|                 |                 |                 | returned        |
|                 |                 |                 | belongs to an   |
|                 |                 |                 | account, this   |
|                 |                 |                 | is the account. |
|                 |                 |                 | Otherwise not   |
|                 |                 |                 | returned]       |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | The output      |
| →\ `            |                 | equired(exactly | script paid,    |
| `scriptPubKey`` |                 | 1)              | encoded as hex  |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | Optional(0 or   | If the output   |
| →\ `            |                 | 1)              | is a P2SH whose |
| `redeemScript`` |                 |                 | script belongs  |
|                 |                 |                 | to this wallet, |
|                 |                 |                 | this is the     |
|                 |                 |                 | redeem script   |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``amount`` | number (int)    | R               | The amount paid |
|                 |                 | equired(exactly | to the output   |
|                 |                 | 1)              | in dash         |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | The number of   |
| →\ ``           |                 | equired(exactly | confirmations   |
| confirmations`` |                 | 1)              | received for    |
|                 |                 |                 | the transaction |
|                 |                 |                 | containing this |
|                 |                 |                 | output          |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | R               | Set to ``true`` |
| →               |                 | equired(exactly | if the private  |
| \ ``spendable`` |                 | 1)              | key or keys     |
|                 |                 |                 | needed to spend |
|                 |                 |                 | this output are |
|                 |                 |                 | part of the     |
|                 |                 |                 | wallet. Set to  |
|                 |                 |                 | ``false`` if    |
|                 |                 |                 | not (such as    |
|                 |                 |                 | for watch-only  |
|                 |                 |                 | addresses)      |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | R               | *Added in       |
| →\ ``solvable`` |                 | equired(exactly | Bitcoin Core    |
|                 |                 | 1)              | 0.13.0*\ Set to |
|                 |                 |                 | ``true`` if the |
|                 |                 |                 | wallet knows    |
|                 |                 |                 | how to spend    |
|                 |                 |                 | this output.    |
|                 |                 |                 | Set to          |
|                 |                 |                 | ``false`` if    |
|                 |                 |                 | the wallet does |
|                 |                 |                 | not know how to |
|                 |                 |                 | spend the       |
|                 |                 |                 | output. It is   |
|                 |                 |                 | ignored if the  |
|                 |                 |                 | private keys    |
|                 |                 |                 | are available   |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``desc``   | string          | Optional(0 or   | A descriptor    |
|                 |                 | 1)              | for spending    |
|                 |                 |                 | this output     |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | The number of   |
| →\ ``co         |                 | equired(exactly | rounds          |
| injoin_rounds`` |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``safe``   | bool            | R               | *Added in       |
|                 |                 | equired(exactly | Bitcoin Core    |
|                 |                 | 1)              | 0               |
|                 |                 |                 | .15.0*\ Whether |
|                 |                 |                 | this output is  |
|                 |                 |                 | considered safe |
|                 |                 |                 | to spend.       |
|                 |                 |                 | Unconfirmed     |
|                 |                 |                 | transactions    |
|                 |                 |                 | from outside    |
|                 |                 |                 | keys are        |
|                 |                 |                 | considered      |
|                 |                 |                 | unsafe and are  |
|                 |                 |                 | not eligible    |
|                 |                 |                 | for spending by |
|                 |                 |                 | ``fundr         |
|                 |                 |                 | awtransaction`` |
|                 |                 |                 | and             |
|                 |                 |                 | ``s             |
|                 |                 |                 | endtoaddress``. |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

Get all outputs confirmed at least 6 times for a particular address:

.. code:: bash

   dash-cli -testnet listunspent 6 99999999 '''
     [
       "yYvsn6vdnkeq9VG1JbkfqKbjv3gUmFmnny"
     ]
   '''

Result:

.. code:: json

   [
     {
       "txid": "8181ac201ef2ff896f666589e98924f7cbbc885f1c42c766629f677e37cafc47",
       "vout": 0,
       "address": "yYvsn6vdnkeq9VG1JbkfqKbjv3gUmFmnny",
       "scriptPubKey": "76a9148a54e0c51084f0e5819a66bb1c4d01191f5caa3888ac",
       "amount": 0.01274051,
       "confirmations": 16007,
       "spendable": true,
       "solvable": true,
       "desc": "pkh([8a54e0c5]0214889c34100d00aca6e7cbfe0fa72d83c28857585740bff5f3db6b37e51d9aaa)#wyvgzv2k",
       "safe": true,
       "coinjoin_rounds": -2
     }
   ]

Get all outputs for a particular address that have at least 1
confirmation and a maximum value of 10:

.. code:: shell

   dash-cli -testnet listunspent 1 9999999 '''
     [
       "yYvsn6vdnkeq9VG1JbkfqKbjv3gUmFmnny"
     ]
     ''' true '''
     {
       "maximumAmount": "10"
     }
     '''

Result:

.. code:: json

   [
     {
       "txid": "8181ac201ef2ff896f666589e98924f7cbbc885f1c42c766629f677e37cafc47",
       "vout": 0,
       "address": "yYvsn6vdnkeq9VG1JbkfqKbjv3gUmFmnny",
       "scriptPubKey": "76a9148a54e0c51084f0e5819a66bb1c4d01191f5caa3888ac",
       "amount": 0.01274051,
       "confirmations": 16008,
       "spendable": true,
       "solvable": true,
       "desc": "pkh([8a54e0c5]0214889c34100d00aca6e7cbfe0fa72d83c28857585740bff5f3db6b37e51d9aaa)#wyvgzv2k",
       "safe": true,
       "coinjoin_rounds": -2
     }
   ]

*See also*

-  `ListTransactions <core-api-ref-remote-procedure-calls-wallet#listtransactions>`__:
   returns the most recent transactions that affect the wallet.
-  `LockUnspent <core-api-ref-remote-procedure-calls-wallet#lockunspent>`__:
   temporarily locks or unlocks specified transaction outputs. A locked
   transaction output will not be chosen by automatic coin selection
   when spending dash. Locks are stored in memory only, so nodes start
   with zero locked outputs and the locked output list is always cleared
   when a node stops or fails.

ListWallets
===========

The ```listwallets``
RPC <core-api-ref-remote-procedure-calls-wallet#listwallets>`__ returns
a list of currently loaded wallets.

For full information on the wallet, use the ```getwalletinfo``
RPC <core-api-ref-remote-procedure-calls-wallet#getwalletinfo>`__.

*Parameters: none*

*Result*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | An array of     |
|                 |                 | equired(exactly | strings         |
|                 |                 | 1)              | containing a    |
|                 |                 |                 | list of         |
|                 |                 |                 | currently       |
|                 |                 |                 | loaded wallet   |
|                 |                 |                 | files           |
+-----------------+-----------------+-----------------+-----------------+
| →Wallet         | string          | Required(0 or   | The name of a   |
|                 |                 | more)           | wallet file     |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.15.0*

.. code:: bash

   dash-cli -testnet listwallets

Result:

.. code:: json

   [
     "wallet.dat"
   ]

*See also: none*

ListWalletDir
=============

The ```listwalletdir``
RPC <core-api-ref-remote-procedure-calls-wallet#listwalletdir>`__
returns a list of wallets in the wallet directory.

For full information on the wallet, use the ```getwalletinfo``
RPC <core-api-ref-remote-procedure-calls-wallet#getwalletinfo>`__.

*Parameters: none*

*Result*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | A JSON array of |
|                 |                 | equired(exactly | objects         |
|                 |                 | 1)              | containing a    |
|                 |                 |                 | list of wallets |
|                 |                 |                 | in the wallet   |
|                 |                 |                 | directory.      |
+-----------------+-----------------+-----------------+-----------------+
| →name           | string          | Required(0 or   | The wallet name |
|                 |                 | more)           |                 |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

.. code:: bash

   dash-cli -testnet listwalletdir

Result:

.. code:: json

   {
     "wallets": [
       {
         "name": "demo"
       }
     ]
   }

*See also*

-  `GetWalletInfo <core-api-ref-remote-procedure-calls-wallet#getwalletinfo>`__:
   provides information about the wallet.

LoadWallet
==========

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block] The ```loadwallet``
RPC <core-api-ref-remote-procedure-calls-wallet#loadwallet>`__ loads a
wallet from a wallet file or directory. Note that all wallet
command-line options used when starting dashd will be applied to the new
wallet (eg -zapwallettxes, upgradewallet, rescan, etc).

*Parameter #1—wallet name*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Filename        | string          | R               | The wallet      |
|                 |                 | equired(exactly | directory or    |
|                 |                 | 1)              | .dat file. The  |
|                 |                 |                 | wallet can be   |
|                 |                 |                 | specified as    |
|                 |                 |                 | file/directory  |
|                 |                 |                 | basename (which |
|                 |                 |                 | must be located |
|                 |                 |                 | in the          |
|                 |                 |                 | ``walletdir``   |
|                 |                 |                 | directory), or  |
|                 |                 |                 | as an absolute  |
|                 |                 |                 | path to a       |
|                 |                 |                 | file/directory. |
+-----------------+-----------------+-----------------+-----------------+

*Result—operation status*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An object       |
|                 |                 | equired(exactly | containing the  |
|                 |                 | 1)              | wallet name or  |
|                 |                 |                 | warning message |
|                 |                 |                 | related to the  |
|                 |                 |                 | operation       |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``name``     | string          | Required        | The wallet name |
|                 |                 |                 | if loaded       |
|                 |                 |                 | successfully    |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``warning``  | string          | Required        | Warning message |
|                 |                 |                 | if wallet was   |
|                 |                 |                 | not loaded      |
|                 |                 |                 | cleanly         |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.16.0*

.. code:: bash

   dash-cli -testnet loadwallet wallet-test.dat

Result:

.. code:: json

   {
     "name": "wallet-test.dat",
     "warning": ""
   }

*See also*

-  `CreateWallet <core-api-ref-remote-procedure-calls-wallet#createwallet>`__:
   creates and loads a new wallet.
-  `UnloadWallet <core-api-ref-remote-procedure-calls-wallet#unloadwallet>`__:
   unloads the specified wallet.

LockUnspent
===========

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block]

The ```lockunspent``
RPC <core-api-ref-remote-procedure-calls-wallet#lockunspent>`__
temporarily locks or unlocks specified transaction outputs. A locked
transaction output will not be chosen by automatic coin selection when
spending dash. Locks are stored in memory only, so nodes start with zero
locked outputs and the locked output list is always cleared when a node
stops or fails.

*Parameter #1—whether to lock or unlock the outputs*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Unlock          | bool            | R               | Set to          |
|                 |                 | equired(exactly | ``false`` to    |
|                 |                 | 1)              | lock the        |
|                 |                 |                 | outputs         |
|                 |                 |                 | specified in    |
|                 |                 |                 | the following   |
|                 |                 |                 | parameter. Set  |
|                 |                 |                 | to ``true`` to  |
|                 |                 |                 | unlock the      |
|                 |                 |                 | outputs         |
|                 |                 |                 | specified. If   |
|                 |                 |                 | this is the     |
|                 |                 |                 | only argument   |
|                 |                 |                 | specified and   |
|                 |                 |                 | it is set to    |
|                 |                 |                 | ``true``, all   |
|                 |                 |                 | outputs will be |
|                 |                 |                 | unlocked; if it |
|                 |                 |                 | is the only     |
|                 |                 |                 | argument and is |
|                 |                 |                 | set to          |
|                 |                 |                 | ``false``,      |
|                 |                 |                 | there will be   |
|                 |                 |                 | no change       |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the outputs to lock or unlock*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Outputs         | array           | Optional(0 or   | An array of     |
|                 |                 | 1)              | outputs to lock |
|                 |                 |                 | or unlock       |
+-----------------+-----------------+-----------------+-----------------+
| →Output         | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing a    |
|                 |                 |                 | particular      |
|                 |                 |                 | output          |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``txid``   | string          | R               | The TXID of the |
|                 |                 | equired(exactly | transaction     |
|                 |                 | 1)              | containing the  |
|                 |                 |                 | output to lock  |
|                 |                 |                 | or unlock,      |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in internal     |
|                 |                 |                 | byte order      |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``vout``   | number (int)    | R               | The output      |
|                 |                 | equired(exactly | index number    |
|                 |                 | 1)              | (vout) of the   |
|                 |                 |                 | output to lock  |
|                 |                 |                 | or unlock. The  |
|                 |                 |                 | first output in |
|                 |                 |                 | a transaction   |
|                 |                 |                 | has an index of |
|                 |                 |                 | ``0``           |
+-----------------+-----------------+-----------------+-----------------+

*Result—``true`` if successful*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | bool            | R               | Set to ``true`` |
|                 |                 | equired(exactly | if the outputs  |
|                 |                 | 1)              | were            |
|                 |                 |                 | successfully    |
|                 |                 |                 | locked or       |
|                 |                 |                 | unlocked. If    |
|                 |                 |                 | the outputs     |
|                 |                 |                 | were already    |
|                 |                 |                 | locked or       |
|                 |                 |                 | unlocked, it    |
|                 |                 |                 | will also       |
|                 |                 |                 | return ``true`` |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Lock two outputs:

.. code:: bash

   dash-cli -testnet lockunspent false '''
     [
       {
         "txid": "d3d57ec5e4168b7145e911d019e9713563c1f2db5b2d6885739ea887feca4c87",
         "vout": 0
       },
       {
         "txid": "607897611b2f7c5b23297b2a352a8d6f4383f8d0782585f93220082d361f8db9",
         "vout": 1
       }
     ]
   '''

Result:

.. code:: json

   true

Verify the outputs have been locked:

.. code:: bash

   dash-cli -testnet listlockunspent

Result

.. code:: json

   [
     {
       "txid": "d3d57ec5e4168b7145e911d019e9713563c1f2db5b2d6885739ea887feca4c87",
       "vout": 0
     },
     {
       "txid": "607897611b2f7c5b23297b2a352a8d6f4383f8d0782585f93220082d361f8db9",
       "vout": 1
     }
   ]

Unlock one of the above outputs:

.. code:: bash

   dash-cli -testnet lockunspent true '''
   [
     {
       "txid": "607897611b2f7c5b23297b2a352a8d6f4383f8d0782585f93220082d361f8db9",
       "vout": 1
     }
   ]
   '''

Result:

.. code:: json

   true

Verify the output has been unlocked:

.. code:: bash

   dash-cli -testnet listlockunspent

Result:

.. code:: json

   [
     {
       "txid": "d3d57ec5e4168b7145e911d019e9713563c1f2db5b2d6885739ea887feca4c87",
       "vout": 0
     }
   ]

*See also*

-  `ListLockUnspent <core-api-ref-remote-procedure-calls-wallet#listlockunspent>`__:
   returns a list of temporarily unspendable (locked) outputs.
-  `ListUnspent <core-api-ref-remote-procedure-calls-wallet#listunspent>`__:
   returns an array of unspent transaction outputs belonging to this
   wallet.

RemovePrunedFunds
=================

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block]

*Added in Dash Core 0.12.3 / Bitcoin Core 0.13.0*

The ```removeprunedfunds``
RPC <core-api-ref-remote-procedure-calls-wallet#removeprunedfunds>`__
deletes the specified transaction from the wallet. Meant for use with
pruned wallets and as a companion to importprunedfunds. This will effect
wallet balances.

*Parameter #1—the raw transaction to import*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| TXID            | string(hex)     | R               | The hex-encoded |
|                 |                 | equired(exactly | id of the       |
|                 |                 | 1)              | transaction you |
|                 |                 |                 | are removing    |
+-----------------+-----------------+-----------------+-----------------+

*Result—``null`` on success*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | null            | R               | If the funds    |
|                 |                 | equired(exactly | are removed     |
|                 |                 | 1)              | from the        |
|                 |                 |                 | wallet, JSON    |
|                 |                 |                 | ``null`` will   |
|                 |                 |                 | be returned     |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.3*

.. code:: bash

   dash-cli removeprunedfunds bb7daff525b83fa6a847ab50bf7f8f14d6\
   22761a19f69157b362ef3f25bda687

(Success: no result displayed.)

*See also*

-  `ImportPrivKey <core-api-ref-remote-procedure-calls-wallet#importprivkey>`__:
   adds a private key to your wallet. The key should be formatted in the
   wallet import format created by the ```dumpprivkey``
   RPC <core-api-ref-remote-procedure-calls-wallet#dumpprivkey>`__.
-  `ImportPrunedFunds <core-api-ref-remote-procedure-calls-wallet#importprunedfunds>`__:
   imports funds without the need of a rescan. Meant for use with pruned
   wallets.

RescanBlockChain
================

The ```rescanblockchain``
RPC <core-api-ref-remote-procedure-calls-wallet#rescanblockchain>`__
rescans the local blockchain for wallet related transactions.

*Parameter #1—the start block height*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Start Height    | integer         | Optional(0 or   | The block       |
|                 |                 | 1)              | height where    |
|                 |                 |                 | the rescan      |
|                 |                 |                 | should start    |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the stop block height*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Stop Height     | integer         | Optional(0 or   | The last block  |
|                 |                 | 1)              | height that     |
|                 |                 |                 | should be       |
|                 |                 |                 | scanned         |
+-----------------+-----------------+-----------------+-----------------+

*Result—``null`` or start/end height details if parameters provided*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An object       |
|                 |                 | equired(exactly | containing the  |
|                 |                 | 1)              | start/end       |
|                 |                 |                 | heights         |
|                 |                 |                 | depending on    |
|                 |                 |                 | the range of    |
|                 |                 |                 | blocks scanned  |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | integer         | Optional(0 or   | The block       |
| `start_height`` |                 | 1)              | height where    |
|                 |                 |                 | the rescan has  |
|                 |                 |                 | started. If     |
|                 |                 |                 | omitted, rescan |
|                 |                 |                 | started from    |
|                 |                 |                 | the genesis     |
|                 |                 |                 | block           |
+-----------------+-----------------+-----------------+-----------------+
| →\              | integer         | Optional(0 or   | The height of   |
| ``stop_height`` |                 | 1)              | the last        |
|                 |                 |                 | rescanned       |
|                 |                 |                 | block. If       |
|                 |                 |                 | omitted, rescan |
|                 |                 |                 | stopped at the  |
|                 |                 |                 | chain tip       |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.16.0*

.. code:: bash

   dash-cli rescanblockchain

Result:

.. code:: json

   {
     "start_height": 293600,
     "stop_height": 293602
   }

*See also*

-  `AbortRescan <core-api-ref-remote-procedure-calls-wallet#abortrescan>`__:
   stops current wallet rescan.

ScanTXOutset
============

[block:callout] { “type”: “danger”, “body”: “Experimental warning: this
call may be removed or changed in future releases.” } [/block] The
```scantxoutset``
RPC <core-api-ref-remote-procedure-calls-wallet#scantxoutset>`__ scans
the unspent transaction output set for entries that match certain output
descriptors.

*Parameter #1—action*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Action          | string          | R               | The action to   |
|                 |                 | equired(exactly | execute: -      |
|                 |                 | 1)              | “start” for     |
|                 |                 |                 | starting a      |
|                 |                 |                 | scan, - “abort” |
|                 |                 |                 | for aborting    |
|                 |                 |                 | the current     |
|                 |                 |                 | scan (returns   |
|                 |                 |                 | true when abort |
|                 |                 |                 | was             |
|                 |                 |                 | successful), -  |
|                 |                 |                 | “status” for    |
|                 |                 |                 | progress report |
|                 |                 |                 | (in %) of the   |
|                 |                 |                 | current scan    |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—scan objects*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Scan Objects    | array           | R               | An array of     |
|                 |                 | equired(exactly | scan objects.   |
|                 |                 | 1)              | Every scan      |
|                 |                 |                 | object is       |
|                 |                 |                 | either a string |
|                 |                 |                 | descriptor or   |
|                 |                 |                 | an object.      |
+-----------------+-----------------+-----------------+-----------------+
| →descriptor     | string: object  | Required(1 or   | An output       |
|                 |                 | more)           | descriptor; an  |
|                 |                 |                 | object with     |
|                 |                 |                 | output          |
|                 |                 |                 | descriptor and  |
|                 |                 |                 | me              |
|                 |                 |                 | tadata.Examples |
|                 |                 |                 | of output       |
|                 |                 |                 | descriptors     |
|                 |                 |                 | are: -          |
|                 |                 |                 | ``add           |
|                 |                 |                 | r(<address>)``: |
|                 |                 |                 | Outputs whose   |
|                 |                 |                 | scriptPubKey    |
|                 |                 |                 | corresponds to  |
|                 |                 |                 | the specified   |
|                 |                 |                 | address (does   |
|                 |                 |                 | not include     |
|                 |                 |                 | P2PK) -         |
|                 |                 |                 | ``raw(<         |
|                 |                 |                 | hex script>)``: |
|                 |                 |                 | Outputs whose   |
|                 |                 |                 | scriptPubKey    |
|                 |                 |                 | equals the      |
|                 |                 |                 | specified hex   |
|                 |                 |                 | scripts -       |
|                 |                 |                 | ``com           |
|                 |                 |                 | bo(<pubkey>)``: |
|                 |                 |                 | P2PK and P2PKH  |
|                 |                 |                 | outputs for the |
|                 |                 |                 | given pubkey -  |
|                 |                 |                 | ``p             |
|                 |                 |                 | kh(<pubkey>)``: |
|                 |                 |                 | P2PKH outputs   |
|                 |                 |                 | for the given   |
|                 |                 |                 | pubkey -        |
|                 |                 |                 | ``sh(multi(     |
|                 |                 |                 | <n>,<pubkey>,<p |
|                 |                 |                 | ubkey>,...))``: |
|                 |                 |                 | P2SH-multisig   |
|                 |                 |                 | outputs for the |
|                 |                 |                 | given threshold |
|                 |                 |                 | and pubkeys     |
+-----------------+-----------------+-----------------+-----------------+
| → →desc         | string          | R               | An output       |
|                 |                 | equired(exactly | descriptor      |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →range        | number (int)    | Optional(0 or   | The child index |
|                 |                 | 1)              | HD that chains  |
|                 |                 |                 | should be       |
|                 |                 |                 | explored        |
|                 |                 |                 | (default: 1000) |
+-----------------+-----------------+-----------------+-----------------+

In the above, either refers to a fixed public key in hexadecimal
notation, or to an xpub/xprv optionally followed by one or more path
elements separated by “/”, and optionally ending in “/*" (unhardened),
or "/*\ ’” or "/*h" (hardened) to specify all unhardened or hardened
child keys. In the latter case, a range needs to be specified by below
if different from 1000.

*Result—The unspent and total amount*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An object       |
|                 |                 | equired(exactly | containing the  |
|                 |                 | 1)              | the unspent and |
|                 |                 |                 | total amounts.  |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``success``  | bool            | R               | Whether the     |
|                 |                 | equired(exactly | scan was        |
|                 |                 | 1)              | completed       |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``txouts``   | number (int)    | R               | The number of   |
|                 |                 | equired(exactly | unspent         |
|                 |                 | 1)              | transaction     |
|                 |                 |                 | outputs scanned |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``height``   | number (int)    | R               | The current     |
|                 |                 | equired(exactly | block height    |
|                 |                 | 1)              | (index)         |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | The hash of the |
| \ ``bestblock`` |                 | equired(exactly | block at the    |
|                 |                 | 1)              | tip of the      |
|                 |                 |                 | chain           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``unspents`` | array           | R               | An array        |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | unspent output  |
|                 |                 |                 | objects         |
+-----------------+-----------------+-----------------+-----------------+
| → →Unspent      | array           | Required(1 or   | An object       |
| output          |                 | more)           | containing      |
|                 |                 |                 | unspent output  |
|                 |                 |                 | information     |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``txid`` | string (hex)    | R               | The TXID of the |
|                 |                 | equired(exactly | transaction the |
|                 |                 | 1)              | output appeared |
|                 |                 |                 | in. The TXID    |
|                 |                 |                 | must be encoded |
|                 |                 |                 | in hex in RPC   |
|                 |                 |                 | byte order      |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``vout`` | number (int)    | R               | The index       |
|                 |                 | equired(exactly | number of the   |
|                 |                 | 1)              | output (vout)   |
|                 |                 |                 | as it appeared  |
|                 |                 |                 | in its          |
|                 |                 |                 | transaction,    |
|                 |                 |                 | with the first  |
|                 |                 |                 | output being 0  |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string (hex)    | R               | The output’s    |
| →\ `            |                 | equired(exactly | pubkey script   |
| `scriptPubKey`` |                 | 1)              | encoded as hex  |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``desc`` | string          | R               | A specialized   |
|                 |                 | equired(exactly | descriptor for  |
|                 |                 | 1)              | the matched     |
|                 |                 |                 | scriptPubKey    |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (int)    | R               | The total       |
| →\ ``amount``   |                 | equired(exactly | amount in DASH  |
|                 |                 | 1)              | of the unspent  |
|                 |                 |                 | output          |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (int)    | R               | The height of   |
| →\ ``height``   |                 | equired(exactly | the unspent     |
|                 |                 | 1)              | transaction     |
|                 |                 |                 | output          |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | numeric         | R               | The total       |
| `total_amount`` |                 | equired(exactly | amount of all   |
|                 |                 | 1)              | found unspent   |
|                 |                 |                 | outputs in DASH |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

.. code:: bash

   dash-cli -testnet scantxoutset start '["addr(yWjoZBvnUKWhpKMbBkVVnnMD8Bzno9j6tQ)"]'

Result:

.. code:: json

   {
     "success": true,
     "txouts": 639756,
     "height": 667140,
     "bestblock": "000000ec777dd903c5a378ab209a7815b24a5365b5c53a0c22e64ef3350d33db",
     "unspents": [
       {
         "txid": "571028a9a2f69c5eec75dbae10c8724b8afd44530fac97936ae6676a9c61e03c",
         "vout": 0,
         "scriptPubKey": "76a914724c86a5dc23ecac05474d9be3ac76a6aa4bcb4488ac",
         "desc": "addr(yWjoZBvnUKWhpKMbBkVVnnMD8Bzno9j6tQ)#sycxjztu",
         "amount": 1.00000000,
         "height": 494777
       },
       {
         "txid": "3e76165230a3ff5bb8df0a9e278caa81f9a653c2b7a075f8dc16e56103c8f68e",
         "vout": 0,
         "scriptPubKey": "76a914724c86a5dc23ecac05474d9be3ac76a6aa4bcb4488ac",
         "desc": "addr(yWjoZBvnUKWhpKMbBkVVnnMD8Bzno9j6tQ)#sycxjztu",
         "amount": 7.76020488,
         "height": 494777
       }
     ],
     "total_amount": 8.76020488
   }

*See also*

-  `ListUnspent </docs/core-api-ref-remote-procedure-calls-wallet#listunspent>`__:
   returns an array of unspent transaction outputs belonging to this
   wallet.

SendMany
========

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**). Requires an unlocked wallet or an
unencrypted wallet.” } [/block]

The ```sendmany``
RPC <core-api-ref-remote-procedure-calls-wallet#sendmany>`__ creates and
broadcasts a transaction which sends outputs to multiple addresses.

*Parameter #1—unused parameter* [block:callout] { “type”: “warning”,
“body”: “Note that this parameter has been removed in v0.17. To use this
RPC with a "fromaccount" parameter, restart dashd with
``-deprecatedrpc=accounts``.” } [/block] Name \| Type \| Presence \|
Description — \| — \| — \| — Unused \| string \| Required(exactly 1) \|
**Deprecated: (previously account) will be removed in a later version of
Dash Core**\ Must be set to ``""`` for backwards compatibility.

*Parameter #2—the addresses and amounts to pay*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Outputs         | object          | R               | An object       |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | key/value pairs |
|                 |                 |                 | corresponding   |
|                 |                 |                 | to the          |
|                 |                 |                 | addresses and   |
|                 |                 |                 | amounts to pay  |
+-----------------+-----------------+-----------------+-----------------+
| →Address/Amount | string (base58) | Required(1 or   | A key/value     |
|                 | : number (dash) | more)           | pair with a     |
|                 |                 |                 | base            |
|                 |                 |                 | 58check-encoded |
|                 |                 |                 | string          |
|                 |                 |                 | containing the  |
|                 |                 |                 | P2PKH or P2SH   |
|                 |                 |                 | address to pay  |
|                 |                 |                 | as the key, and |
|                 |                 |                 | an amount of    |
|                 |                 |                 | dash to pay as  |
|                 |                 |                 | the value       |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—minimum confirmations*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Confirmations   | number (int)    | Optional(0 or   | *Deprecated and |
|                 |                 | 1)              | ignored since   |
|                 |                 |                 | Dash Core       |
|                 |                 |                 | 18.0.0*         |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #4–whether to add the balance from transactions locked via
InstantSend*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| addlocked       | bool            | Optional(0 or   | *Deprecated and |
|                 |                 | 1)              | ignored since   |
|                 |                 |                 | Dash Core       |
|                 |                 |                 | 18.0.0*         |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #5—a comment*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Comment         | string          | Optional(0 or   | A               |
|                 |                 | 1)              | locally-stored  |
|                 |                 |                 | (not broadcast) |
|                 |                 |                 | comment         |
|                 |                 |                 | assigned to     |
|                 |                 |                 | this            |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Default is no   |
|                 |                 |                 | comment         |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #6—automatic fee subtraction*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Subtract Fee    | array           | Optional(0 or   | An array of     |
| From Amount     |                 | 1)              | addresses. The  |
|                 |                 |                 | fee will be     |
|                 |                 |                 | equally divided |
|                 |                 |                 | by as many      |
|                 |                 |                 | addresses as    |
|                 |                 |                 | are entries in  |
|                 |                 |                 | this array and  |
|                 |                 |                 | subtracted from |
|                 |                 |                 | each address.   |
|                 |                 |                 | If this array   |
|                 |                 |                 | is empty or not |
|                 |                 |                 | provided, the   |
|                 |                 |                 | fee will be     |
|                 |                 |                 | paid by the     |
|                 |                 |                 | sender          |
+-----------------+-----------------+-----------------+-----------------+
| →Address        | string (base58) | Optional (0 or  | An address      |
|                 |                 | more)           | previously      |
|                 |                 |                 | listed as one   |
|                 |                 |                 | of the          |
|                 |                 |                 | recipients.     |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #7—use InstantSend*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Use InstantSend | bool            | Optional(0 or   | *Deprecated and |
|                 |                 | 1)              | ignored since   |
|                 |                 |                 | Dash Core       |
|                 |                 |                 | 0.15.0*         |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #8—use CoinJoin*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Use CoinJoin    | bool            | Optional(0 or   | If set to       |
|                 |                 | 1)              | ``true``, use   |
|                 |                 |                 | CoinJoin funds  |
|                 |                 |                 | only (default:  |
|                 |                 |                 | false).         |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #9—confirmation target*

+----------------+--------------+----------------+----------------+
| Name           | Type         | Presence       | Description    |
+================+==============+================+================+
| `              | number (int) | Optional(0 or  | Confirmation   |
| `conf_target`` |              | 1)             | target (in     |
|                |              |                | blocks)        |
+----------------+--------------+----------------+----------------+

*Parameter #10—fee estimate mode*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``              | string          | Optional(0 or   | The fee         |
| estimate_mode`` |                 | 1)              | estimate mode,  |
|                 |                 |                 | must be one     |
|                 |                 |                 | of              |
|                 |                 |                 | :\ ``UNSET``\ \ |
|                 |                 |                 |  ``ECONOMICAL`` |
|                 |                 |                 | \ \ ``CONSERVAT |
|                 |                 |                 | IVE``\ Default: |
|                 |                 |                 | ``UNSET``       |
+-----------------+-----------------+-----------------+-----------------+

*Result—a TXID of the sent transaction*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | string          | R               | The TXID of the |
|                 |                 | equired(exactly | sent            |
|                 |                 | 1)              | transaction,    |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

Send 0.1 DASH to the first address and 0.2 DASH to the second address,
with a comment of “Example Transaction”.

.. code:: bash

   dash-cli -testnet sendmany \
     "" \
     '''
       {
         "ySutkc49Khpz1HQN8AfWNitVBLwqtyaxvv": 0.1,
         "yhQrX8CZTTfSjKmaq5h7DgSShyEsumCRBi": 0.2
       } ''' \
     6       \
     false   \
     "Example Transaction"

Result:

.. code:: text

   a7c0194a005a220b9bfeb5fdd12d5b90979c10f53de4f8a48a1495aa198a6b95

*Example from Dash Core 0.12.2 (CoinJoin)*

Send 0.1 DASH to the first address and 0.2 DASH to the second address
using CoinJoin, with a comment of “Example Transaction”.

.. code:: bash

   dash-cli -testnet sendmany \
     "" \
     '''
       {
         "ySutkc49Khpz1HQN8AfWNitVBLwqtyaxvv": 0.1,
         "yhQrX8CZTTfSjKmaq5h7DgSShyEsumCRBi": 0.2
       } ''' \
     6       \
     false   \
     "Example Transaction"
     '''
       [""]
     '''    \
     false  \
     true

Result:

.. code:: text

   43337c8e4f3b21bedad7765fa851a6e855e4bb04f60d6b3e4c091ed21ffc5753

*See also*

-  `SendFrom </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#sendfrom>`__:
   spends an amount from a local account to a dash address.
-  `SendToAddress <core-api-ref-remote-procedure-calls-wallet#sendtoaddress>`__:
   spends an amount to a given address.
-  `Move </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#move>`__:
   moves a specified amount from one account in your wallet to another
   using an off-block-chain transaction.

SendToAddress
=============

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**). Requires an unlocked wallet or an
unencrypted wallet.” } [/block]

The ```sendtoaddress``
RPC <core-api-ref-remote-procedure-calls-wallet#sendtoaddress>`__ spends
an amount to a given address.

*Parameter #1—to address*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| To Address      | string          | R               | A P2PKH or P2SH |
|                 |                 | equired(exactly | address to      |
|                 |                 | 1)              | which the dash  |
|                 |                 |                 | should be sent  |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—amount to spend*

====== ============= =================== ===========================
Name   Type          Presence            Description
====== ============= =================== ===========================
Amount number (dash) Required(exactly 1) The amount to spent in dash
====== ============= =================== ===========================

*Parameter #3—a comment*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Comment         | string          | Optional(0 or   | A               |
|                 |                 | 1)              | locally-stored  |
|                 |                 |                 | (not broadcast) |
|                 |                 |                 | comment         |
|                 |                 |                 | assigned to     |
|                 |                 |                 | this            |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Default is no   |
|                 |                 |                 | comment         |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #4—a comment about who the payment was sent to*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Comment To      | string          | Optional(0 or   | A               |
|                 |                 | 1)              | locally-stored  |
|                 |                 |                 | (not broadcast) |
|                 |                 |                 | comment         |
|                 |                 |                 | assigned to     |
|                 |                 |                 | this            |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Meant to be     |
|                 |                 |                 | used for        |
|                 |                 |                 | describing who  |
|                 |                 |                 | the payment was |
|                 |                 |                 | sent to.        |
|                 |                 |                 | Default is no   |
|                 |                 |                 | comment         |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #5—automatic fee subtraction*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Subtract Fee    | boolean         | Optional(0 or   | The fee will be |
| From Amount     |                 | 1)              | deducted from   |
|                 |                 |                 | the amount      |
|                 |                 |                 | being sent. The |
|                 |                 |                 | recipient will  |
|                 |                 |                 | receive less    |
|                 |                 |                 | dash than you   |
|                 |                 |                 | enter in the    |
|                 |                 |                 | amount field.   |
|                 |                 |                 | Default is      |
|                 |                 |                 | ``false``       |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #6—use InstantSend*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Use InstantSend | bool            | Optional(0 or   | *Deprecated and |
|                 |                 | 1)              | ignored since   |
|                 |                 |                 | Dash Core       |
|                 |                 |                 | 0.15.0*         |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #7—use CoinJoin*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Use CoinJoin    | bool            | Optional(0 or   | If set to       |
|                 |                 | 1)              | ``true``, use   |
|                 |                 |                 | CoinJoin funds  |
|                 |                 |                 | only (default:  |
|                 |                 |                 | false).         |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #8—confirmation target*

+----------------+--------------+----------------+----------------+
| Name           | Type         | Presence       | Description    |
+================+==============+================+================+
| `              | number (int) | Optional(0 or  | Confirmation   |
| `conf_target`` |              | 1)             | target (in     |
|                |              |                | blocks)        |
+----------------+--------------+----------------+----------------+

*Parameter #9—fee estimate mode*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``              | string          | Optional(0 or   | The fee         |
| estimate_mode`` |                 | 1)              | estimate mode,  |
|                 |                 |                 | must be one     |
|                 |                 |                 | of              |
|                 |                 |                 | :\ ``UNSET``\ \ |
|                 |                 |                 |  ``ECONOMICAL`` |
|                 |                 |                 | \ \ ``CONSERVAT |
|                 |                 |                 | IVE``\ Default: |
|                 |                 |                 | ``UNSET``       |
+-----------------+-----------------+-----------------+-----------------+

*Result—a TXID of the sent transaction*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | string          | R               | The TXID of the |
|                 |                 | equired(exactly | sent            |
|                 |                 | 1)              | transaction,    |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Spend 0.1 dash to the address below with the comment “sendtoaddress
example” and the comment-to “Nemo From Example.com”:

.. code:: bash

   dash-cli -testnet sendtoaddress ySutkc49Khpz1HQN8AfWNitVBLwqtyaxvv \
     1.0 "sendtoaddress example" "Nemo From Example.com"

Result:

.. code:: text

   70e2029d363f0110fe8a0aa2ba7bd771a579453135568b2aa559b2cb30f875aa

*Example from Dash Core 0.12.2 (InstantSend)*

Spend 0.1 dash via InstantSend to the address below with the comment
“sendtoaddress example” and the comment-to “Nemo From Example.com”:

.. code:: bash

   dash-cli -testnet sendtoaddress ySutkc49Khpz1HQN8AfWNitVBLwqtyaxvv \
     1.0 "sendtoaddress example" "Nemo From Example.com" false true

Result:

.. code:: text

   af002b9c931b5efb5b2852df3d65efd48c3b9ac2ba0ef8a4cf97b894f3ff08c2

*Example from Dash Core 0.12.2 (CoinJoin)*

Spend 0.1 dash via CoinJoin to the address below with the comment
“sendtoaddress example” and the comment-to “Nemo From Example.com”:

.. code:: bash

   dash-cli -testnet sendtoaddress ySutkc49Khpz1HQN8AfWNitVBLwqtyaxvv \
     1.0 "sendtoaddress example" "Nemo From Example.com" false false true

Result:

.. code:: text

   949833bc49e0643f63e2afed1704ccccf005a93067a4e46165b06ace42544694

*Example from Dash Core 0.12.2 (InstantSend + CoinJoin)*

Spend 0.1 dash via InstantSend and CoinJoin to the address below with
the comment “sendtoaddressexample” and the comment-to “Nemo From
Example.com”:

.. code:: bash

   dash-cli -testnet sendtoaddress ySutkc49Khpz1HQN8AfWNitVBLwqtyaxvv \
     1.008 "sendtoaddress example" "Nemo From Example.com" false true true

Result:

.. code:: text

   ba4bbe29fa06b67d6f3f3a73e381627e66abe22e217ce329aefad41ea72c3922

*See also*

-  `SendFrom </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#sendfrom>`__:
   spends an amount from a local account to a dash address.
-  `SendMany <core-api-ref-remote-procedure-calls-wallet#sendmany>`__:
   creates and broadcasts a transaction which sends outputs to multiple
   addresses.
-  `Move </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#move>`__:
   moves a specified amount from one account in your wallet to another
   using an off-block-chain transaction.

SetLabel
========

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block] The ```setlabel``
RPC <core-api-ref-remote-procedure-calls-wallet#setlabel>`__ sets the
label associated with the given address.

*Parameter #1—a Dash address*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Address         | string (base58) | R               | The P2PKH or    |
|                 |                 | equired(exactly | P2SH Dash       |
|                 |                 | 1)              | address to be   |
|                 |                 |                 | associated with |
|                 |                 |                 | a label.        |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—a label*

===== ====== =================== ===================================
Name  Type   Presence            Description
===== ====== =================== ===================================
Label string Required(exactly 1) The label to assign to the address.
===== ====== =================== ===================================

*Result—``null`` if successful*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | null            | R               | Set to JSON     |
|                 |                 | equired(exactly | ``null`` if the |
|                 |                 | 1)              | address was     |
|                 |                 |                 | successfully    |
|                 |                 |                 | placed in the   |
|                 |                 |                 | account         |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

Assign the “doc test” label to the provided address.

.. code:: bash

   dash-cli -testnet setlabel yMTFRnrfJ4NpnYVeidDNHVwT7uuNsVjevq "doc test"

(Success: no result displayed.)

*See also*

-  `ListLabels <core-api-ref-remote-procedure-calls-wallet#listlabels>`__:
   returns the list of all labels, or labels that are assigned to
   addresses with a specific purpose.
-  `GetAddressesByLabel <core-api-ref-remote-procedure-calls-wallet#getaddressesbylabel>`__:
   returns the list of addresses assigned the specified label.

# SetCoinJoinAmount

The ```setcoinjoinamount``
RPC <core-api-ref-remote-procedure-calls-wallet#setcoinjoinamount>`__
sets the amount of DASH to be processed with CoinJoin (previously named
``setprivatesendamount`` prior to Dash Core 0.17.0)

*Parameter #1—amount to process*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Amount          | int             | R               | The number of   |
|                 |                 | equired(exactly | DASH to process |
|                 |                 | 1)              | (minimum: 2,    |
|                 |                 |                 | maximum:        |
|                 |                 |                 | 21,000,000)     |
+-----------------+-----------------+-----------------+-----------------+

*Result—``null`` on success*

*Example from Dash Core 0.13.0*

.. code:: bash

   dash-cli -testnet setcoinjoinamount 2000

(Success: no result displayed.)

*See also:*

-  `SetCoinJoinRounds <core-api-ref-remote-procedure-calls-wallet#setcoinjoinrounds>`__:
   sets the number of rounds to use

# SetCoinJoinRounds

The ```setcoinjoinrounds``
RPC <core-api-ref-remote-procedure-calls-wallet#setcoinjoinrounds>`__
sets the number of rounds to use (previously named
``setprivatesendrounds`` prior to Dash Core 0.17.0)

*Parameter #1—number of rounds to use*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Rounds          | int             | R               | The number of   |
|                 |                 | equired(exactly | rounds to use   |
|                 |                 | 1)              | (minimum: 1,    |
|                 |                 |                 | maximum: 16)    |
+-----------------+-----------------+-----------------+-----------------+

*Result—``null`` on success*

*Example from Dash Core 0.13.0*

.. code:: bash

   dash-cli -testnet setcoinjoinrounds 4

(Success: no result displayed.)

*See also:*

-  `SetCoinJoinAmount <core-api-ref-remote-procedure-calls-wallet#setcoinjoinamount>`__:
   sets the amount of DASH to be processed with CoinJoin

SetTxFee
========

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block]

The ```settxfee``
RPC <core-api-ref-remote-procedure-calls-wallet#settxfee>`__ sets the
transaction fee per kilobyte paid by transactions created by this
wallet.

*Parameter #1—the transaction fee amount per kilobyte*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Transaction Fee | number (dash)   | R               | The transaction |
| Per Kilobyte    |                 | equired(exactly | fee to pay, in  |
|                 |                 | 1)              | dash, for each  |
|                 |                 |                 | kilobyte of     |
|                 |                 |                 | transaction     |
|                 |                 |                 | data. Be        |
|                 |                 |                 | careful setting |
|                 |                 |                 | the fee too     |
|                 |                 |                 | low—your        |
|                 |                 |                 | transactions    |
|                 |                 |                 | may not be      |
|                 |                 |                 | relayed or      |
|                 |                 |                 | included in     |
|                 |                 |                 | blocks          |
+-----------------+-----------------+-----------------+-----------------+

*Result: ``true`` on success*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | bool (true)     | R               | Set to ``true`` |
|                 |                 | equired(exactly | if the fee was  |
|                 |                 | 1)              | successfully    |
|                 |                 |                 | set             |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Set the transaction fee per kilobyte to 10,000 duffs.

.. code:: bash

   dash-cli -testnet settxfee 0.00010000

Result:

.. code:: json

   true

*See also*

-  `GetWalletInfo <core-api-ref-remote-procedure-calls-wallet#getwalletinfo>`__:
   provides information about the wallet.
-  `GetNetworkInfo </docs/core-api-ref-remote-procedure-calls-network#getnetworkinfo>`__:
   returns information about the node’s connection to the network.

SignMessage
===========

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**). Requires an unlocked wallet or an
unencrypted wallet.” } [/block]

The ```signmessage``
RPC <core-api-ref-remote-procedure-calls-wallet#signmessage>`__ signs a
message with the private key of an address.

*Parameter #1—the address corresponding to the private key to sign with*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Address         | string (base58) | R               | A P2PKH address |
|                 |                 | equired(exactly | whose private   |
|                 |                 | 1)              | key belongs to  |
|                 |                 |                 | this wallet     |
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

*Example from Dash Core 0.12.2*

Sign a the message “Hello, World!” using the following address:

.. code:: bash

   dash-cli -testnet signmessage yNpezfFDfoikDuT1f4iK75AiLp2YLPsGAb "Hello, World!"

Result:

.. code:: text

   H4XULzfHCf16In2ECk9Ta9QxQPq639zQto2JA3OLlo3JbUdrClvJ89+A1z+Z9POd6l8LJhn1jGpQYF8mX4jkQvE=

*See also*

-  `VerifyMessage </docs/core-api-ref-remote-procedure-calls-util#verifymessage>`__:
   verifies a signed message.

SignRawTransactionWithWallet
============================

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**). Requires an unlocked wallet.” }
[/block] The ```signrawtransactionwithwallet``
RPC <#signrawtransactionwithwallet>`__ signs a transaction in the
serialized transaction format using private keys stored in the wallet.

*Parameter #1—the transaction to sign*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Transaction     | string (hex)    | R               | The transaction |
|                 |                 | equired(exactly | to sign as a    |
|                 |                 | 1)              | serialized      |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—unspent transaction output details*

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

*Parameter #3—signature hash type*

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
|                 |                 |                 | ```             |
|                 |                 |                 | signrawtransact |
|                 |                 |                 | ionwithwallet`` |
|                 |                 |                 | RPC <#si        |
|                 |                 |                 | gnrawtransactio |
|                 |                 |                 | nwithwallet>`__ |
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
|                 |                 |                 | are required    |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

Sign the hex generated from the ``createrawtransaction`` RPC:

.. code:: bash

   dash-cli -testnet signrawtransactionwithwallet 020000000121f39228a11ddf19\
   7ac3658e93bd264d0afd927f0cdfc7caeb760537e529c94a0100000000ffffffff0180969\
   800000000001976a914fe64a96d6660e30c433e1189082466a95bdf9ceb88ac00000000

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
-  `SignRawTransactionWithKey </docs/core-api-ref-remote-procedure-calls-raw-transactions#signrawtransactionwithkey>`__:
   signs inputs for a transaction in the serialized transaction format
   using private keys provided in the call.

UnloadWallet
============

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**).” } [/block] The ```unloadwallet``
RPC <core-api-ref-remote-procedure-calls-wallet#unloadwallet>`__ unloads
the wallet referenced by the request endpoint otherwise unloads the
wallet specified in the argument. Specifying the wallet name on a wallet
endpoint is invalid.

*Parameter #1—wallet name*

======== ====== =================== =================================
Name     Type   Presence            Description
======== ====== =================== =================================
Filename string Required(exactly 1) The name of the wallet to unload.
======== ====== =================== =================================

*Result—null on success*

*Example from Dash Core 0.17.0*

.. code:: bash

   dash-cli -testnet unloadwallet wallet-test.dat

Result:

.. code:: shell

   null

*See also*

-  `LoadWallet <core-api-ref-remote-procedure-calls-wallet#loadwallet>`__:
   loads a wallet from a wallet file or directory.

UpgradeToHD
===========

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**)” } [/block]

The ```upgrradetohd``
RPC <core-api-ref-remote-procedure-calls-wallet#upgradetohd>`__ upgrades
non-HD wallets to HD.

*Parameters*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Mnemonic        | string          | Optional(0 or   | Mnemonic as     |
|                 |                 | 1)              | defined in      |
|                 |                 |                 | BIP39 to use    |
|                 |                 |                 | for the new HD  |
|                 |                 |                 | wallet. Use an  |
|                 |                 |                 | empty string    |
|                 |                 |                 | ``""`` to       |
|                 |                 |                 | generate a new  |
|                 |                 |                 | random          |
|                 |                 |                 | mnemonic.       |
+-----------------+-----------------+-----------------+-----------------+
| Mnemonic        | string          | Optional(0 or   | Optional        |
| Passphrase      |                 | 1)              | mnemonic        |
|                 |                 |                 | passphrase as   |
|                 |                 |                 | defined in      |
|                 |                 |                 | `BIP39          |
|                 |                 |                 |  <https://githu |
|                 |                 |                 | b.com/bitcoin/b |
|                 |                 |                 | ips/blob/master |
|                 |                 |                 | /bip-0039.media |
|                 |                 |                 | wiki#From_mnemo |
|                 |                 |                 | nic_to_seed>`__ |
+-----------------+-----------------+-----------------+-----------------+
| Wallet          | string          | Optional(0 or   | If your wallet  |
| Passphrase      |                 | 1)              | is encrypted    |
|                 |                 |                 | you must have   |
|                 |                 |                 | your wallet     |
|                 |                 |                 | passphrase      |
|                 |                 |                 | here. If your   |
|                 |                 |                 | wallet is not   |
|                 |                 |                 | encrypted,      |
|                 |                 |                 | specifying      |
|                 |                 |                 | wallet          |
|                 |                 |                 | passphrase will |
|                 |                 |                 | trigger wallet  |
|                 |                 |                 | encryption.     |
+-----------------+-----------------+-----------------+-----------------+

*Result—``true`` on success*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | null            | R               | ``true`` when   |
|                 |                 | equired(exactly | the command was |
|                 |                 | 1)              | successful or   |
|                 |                 |                 | error message   |
|                 |                 |                 | if not          |
|                 |                 |                 | successful.     |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

Upgrade wallet to HD without specifying any optional parameters:

.. code:: bash

   dash-cli -testnet upgradetohd

.. code:: bash

   true

*See also*

-  `DumpHDInfo <core-api-ref-remote-procedure-calls-wallet#dumphdinfo>`__:
   returns an object containing sensitive private info about this HD
   wallet

WalletCreateFundedPSBT
======================

The ```walletcreatefundedpsbt``
RPC <core-api-ref-remote-procedure-calls-wallet#walletcreatefundedpsbt>`__
creates and funds a transaction in the Partially Signed Transaction
(PST) format. Inputs will be added if supplied inputs are not enough.

Implements the Creator and Updater roles.

*Parameter #1—Inputs*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Inputs          | array           | R               | An array of     |
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
| → →Address      | string: number  | Optional(0 or   | A key-value     |
|                 | (Dash)          | 1)              | pair. The key   |
|                 |                 |                 | (string) is the |
|                 |                 |                 | Dash address,   |
|                 |                 |                 | the value       |
|                 |                 |                 | (float or       |
|                 |                 |                 | string) is the  |
|                 |                 |                 | amount in DASH  |
+-----------------+-----------------+-----------------+-----------------+
| → →Data         | ``data``:       | Optional(0 or   | A key-value     |
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
|                 |                 |                 | (de             |
|                 |                 |                 | fault=\ ``0``). |
|                 |                 |                 | Non-0 value     |
|                 |                 |                 | also            |
|                 |                 |                 | loc             |
|                 |                 |                 | ktime-activates |
|                 |                 |                 | inputs.         |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #4—Additional options*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Options         | Object          | Optional(0 or   | Additional      |
|                 |                 | 1)              | options         |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | Optional(0 or   | The dash        |
| \ ``            |                 | 1)              | address to      |
| changeAddress`` |                 |                 | receive the     |
|                 |                 |                 | change          |
|                 |                 |                 | (default=pool   |
|                 |                 |                 | address)        |
+-----------------+-----------------+-----------------+-----------------+
| →               | numeric (int)   | Optional(0 or   | The index of    |
| \ ``c           |                 | 1)              | the change      |
| hangePosition`` |                 |                 | output          |
|                 |                 |                 | (               |
|                 |                 |                 | default=random) |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | Optional(0 or   | Also select     |
| \ ``in          |                 | 1)              | inputs which    |
| cludeWatching`` |                 |                 | are watch only  |
|                 |                 |                 | (defau          |
|                 |                 |                 | lt=\ ``false``) |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | Optional(0 or   | Lock selected   |
| \ `             |                 | 1)              | unspent outputs |
| `lockUnspents`` |                 |                 | (defau          |
|                 |                 |                 | lt=\ ``false``) |
+-----------------+-----------------+-----------------+-----------------+
| → \ ``feeRate`` | numeric or      | Optional(0 or   | Set a specific  |
|                 | string          | 1)              | fee rate in     |
|                 |                 |                 | DASH/kB         |
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
|                 |                 |                 | added. Those    |
|                 |                 |                 | recipients will |
|                 |                 |                 | receive less    |
|                 |                 |                 | Dash than you   |
|                 |                 |                 | enter in their  |
|                 |                 |                 | corresponding   |
|                 |                 |                 | amount field.   |
|                 |                 |                 | If no outputs   |
|                 |                 |                 | are specified   |
|                 |                 |                 | here, the       |
|                 |                 |                 | sender pays the |
|                 |                 |                 | fee.            |
+-----------------+-----------------+-----------------+-----------------+
| → →Output index | numeric (int)   | Optional(0 or   | An output index |
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
| →               | numeric (int)   | Optional(0 or   | Confirmation    |
| \               |                 | 1)              | target (in      |
| ``conf_target`` |                 |                 | blocks)         |
+-----------------+-----------------+-----------------+-----------------+
| →               | numeric (int)   | Optional(0 or   | The fee         |
| \ ``            |                 | 1)              | estimate mode,  |
| estimate_mode`` |                 |                 | must be one     |
|                 |                 |                 | of:\ ``UNSET``  |
|                 |                 |                 | (default),\ ``E |
|                 |                 |                 | CONOMICAL``,\ ` |
|                 |                 |                 | `CONSERVATIVE`` |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #5—bip32derivs*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``bip32derivs`` | bool            | O               | If true,        |
|                 |                 | ptional(exactly | includes the    |
|                 |                 | 0 or 1)         | BIP32           |
|                 |                 |                 | derivation      |
|                 |                 |                 | paths for       |
|                 |                 |                 | public keys if  |
|                 |                 |                 | we know them    |
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
| → \ ``psbt``    | string (base64) | R               | The resulting   |
|                 |                 | equired(Exactly | raw transaction |
|                 |                 | 1)              | (base64-encoded |
|                 |                 |                 | string)         |
+-----------------+-----------------+-----------------+-----------------+
| → \ ``fee``     | numeric         | R               | Fee in DASH the |
|                 | (bitcoins)      | equired(Exactly | resulting       |
|                 |                 | 1)              | transaction     |
|                 |                 |                 | pays            |
+-----------------+-----------------+-----------------+-----------------+
| →               | numeric (int)   | R               | The position of |
| \ ``changepos`` |                 | equired(Exactly | the added       |
|                 |                 | 1)              | change output,  |
|                 |                 |                 | or ``-1`` if no |
|                 |                 |                 | change output   |
|                 |                 |                 | was added       |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

.. code:: bash

   dash-cli -testnet walletcreatefundedpsbt "[{\"txid\":\"2662c87e1761ed5f4e98a0640b2608114d86f282824a51bd624985d236c71178\",\"vout\":0}]" "[{\"data\":\"00010203\"}]"

Result:

.. code:: json

   {
     "psbt": "cHNidP8BAGQCAAAAAXgRxzbShUlivVFKgoLyhk0RCCYLZKCYTl/tYRd+yGImAAAAAAD/////AgAAAAAAAAAABmoEAAECA6PmxgkAAAAAGXapFFNPqpebN9gMkzsFJWixaDCZ3S8OiKwAAAAAAAEA4QIAAAABlIu3UCzRFVGowPY3H7RvS5g6QGc71ZYEFXIrcS+NfEIBAAAAakcwRAIgT+T8SIyVXyhsUshI7HlQtA7EduG0NMat1oa0dL3eCakCIGIi0pH9naNBQIqopHIPWmlZmXcVod34GH51J3tr/K5+ASEDxn2GlEMVg4rqfsgNOQtdCbkbYkgzcNSXnaXM96ffd6n+////ArTnxgkAAAAAGXapFM78RkkEwDgUwBkG4ZfcdZp0XkfuiKwAypo7AAAAABl2qRQ++by+kvd8j63QVm7qf/jUfyK94IisVUgIAAAAAA==",
     "fee": 0.00000273,
     "changepos": 1
   }

WalletLock
==========

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**). Requires an unlocked wallet.” }
[/block]

The ```walletlock``
RPC <core-api-ref-remote-procedure-calls-wallet#walletlock>`__ removes
the wallet encryption key from memory, locking the wallet. After calling
this method, you will need to call ``walletpassphrase`` again before
being able to call any methods which require the wallet to be unlocked.

*Parameters: none*

*Result—``null`` on success*

========== ==== =================== ===========================
Name       Type Presence            Description
========== ==== =================== ===========================
``result`` null Required(exactly 1) Always set to JSON ``null``
========== ==== =================== ===========================

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet walletlock

(Success: nothing printed.)

*See also*

-  `EncryptWallet <core-api-ref-remote-procedure-calls-wallet#encryptwallet>`__:
   encrypts the wallet with a passphrase. This is only to enable
   encryption for the first time. After encryption is enabled, you will
   need to enter the passphrase to use private keys.
-  `WalletPassphrase <core-api-ref-remote-procedure-calls-wallet#walletpassphrase>`__:
   stores the wallet decryption key in memory for the indicated number
   of seconds. Issuing the ``walletpassphrase`` command while the wallet
   is already unlocked will set a new unlock time that overrides the old
   one.
-  `WalletPassphraseChange <core-api-ref-remote-procedure-calls-wallet#walletpassphrasechange>`__:
   changes the wallet passphrase from ‘old passphrase’ to ‘new
   passphrase’.

WalletPassphrase
================

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**). Requires an encrypted wallet.” }
[/block]

The ```walletpassphrase``
RPC <core-api-ref-remote-procedure-calls-wallet#walletpassphrase>`__
stores the wallet decryption key in memory for the indicated number of
seconds. Issuing the ``walletpassphrase`` command while the wallet is
already unlocked will set a new unlock time that overrides the old one.

[block:callout] { “type”: “warning”, “body”: “**Warning:** if using this
RPC on the command line, remember that your shell probably saves your
command lines (including the value of the passphrase parameter).” }
[/block]

*Parameter #1—the passphrase*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Passphrase      | string          | R               | The passphrase  |
|                 |                 | equired(exactly | that unlocks    |
|                 |                 | 1)              | the wallet      |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the number of seconds to leave the wallet unlocked*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Seconds         | number (int)    | R               | The number of   |
|                 |                 | equired(exactly | seconds after   |
|                 |                 | 1)              | which the       |
|                 |                 |                 | decryption key  |
|                 |                 |                 | will be         |
|                 |                 |                 | automatically   |
|                 |                 |                 | deleted from    |
|                 |                 |                 | memory          |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—unlock for mixing processing only*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Mixing Only     | bool            | Optional(0 or   | If ``true``,    |
|                 |                 | 1)              | the wallet will |
|                 |                 |                 | be locked for   |
|                 |                 |                 | sending         |
|                 |                 |                 | functions but   |
|                 |                 |                 | unlocked for    |
|                 |                 |                 | mixing          |
|                 |                 |                 | transactions    |
|                 |                 |                 | (default:       |
|                 |                 |                 | false)          |
+-----------------+-----------------+-----------------+-----------------+

*Result—``null`` on success*

========== ==== =================== ===========================
Name       Type Presence            Description
========== ==== =================== ===========================
``result`` null Required(exactly 1) Always set to JSON ``null``
========== ==== =================== ===========================

*Example from Dash Core 0.12.2*

Unlock the wallet for 10 minutes (the passphrase is “test”):

.. code:: bash

   dash-cli -testnet walletpassphrase test 600

(Success: no result printed.)

Unlock the wallet for CoinJoin processing transactions only for 10
minutes (the passphrase is “test”):

.. code:: bash

   dash-cli -testnet walletpassphrase test 600 true

(Success: no result printed.)

*See also*

-  `EncryptWallet <core-api-ref-remote-procedure-calls-wallet#encryptwallet>`__:
   encrypts the wallet with a passphrase. This is only to enable
   encryption for the first time. After encryption is enabled, you will
   need to enter the passphrase to use private keys.
-  `WalletPassphraseChange <core-api-ref-remote-procedure-calls-wallet#walletpassphrasechange>`__:
   changes the wallet passphrase from ‘old passphrase’ to ‘new
   passphrase’.
-  `WalletLock <core-api-ref-remote-procedure-calls-wallet#walletlock>`__:
   removes the wallet encryption key from memory, locking the wallet.
   After calling this method, you will need to call ``walletpassphrase``
   again before being able to call any methods which require the wallet
   to be unlocked.

WalletPassphraseChange
======================

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**). Requires an encrypted wallet.” }
[/block]

The ```walletpassphrasechange``
RPC <core-api-ref-remote-procedure-calls-wallet#walletpassphrasechange>`__
changes the wallet passphrase from ‘old passphrase’ to ‘new passphrase’.

[block:callout] { “type”: “warning”, “body”: “**Warning:** if using this
RPC on the command line, remember that your shell probably saves your
command lines (including the value of the passphrase parameter).” }
[/block]

*Parameter #1—the current passphrase*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Current         | string          | R               | The current     |
| Passphrase      |                 | equired(exactly | wallet          |
|                 |                 | 1)              | passphrase      |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the new passphrase*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| New Passphrase  | string          | R               | The new         |
|                 |                 | equired(exactly | passphrase for  |
|                 |                 | 1)              | the wallet      |
+-----------------+-----------------+-----------------+-----------------+

*Result—``null`` on success*

========== ==== =================== ===========================
Name       Type Presence            Description
========== ==== =================== ===========================
``result`` null Required(exactly 1) Always set to JSON ``null``
========== ==== =================== ===========================

*Example from Dash Core 0.12.2*

Change the wallet passphrase from “test” to “example”:

.. code:: bash

   dash-cli -testnet walletpassphrasechange "test" "example"

(Success: no result printed.)

*See also*

-  `EncryptWallet <core-api-ref-remote-procedure-calls-wallet#encryptwallet>`__:
   encrypts the wallet with a passphrase. This is only to enable
   encryption for the first time. After encryption is enabled, you will
   need to enter the passphrase to use private keys.
-  `WalletLock <core-api-ref-remote-procedure-calls-wallet#walletlock>`__:
   removes the wallet encryption key from memory, locking the wallet.
   After calling this method, you will need to call ``walletpassphrase``
   again before being able to call any methods which require the wallet
   to be unlocked.
-  `WalletPassphrase <core-api-ref-remote-procedure-calls-wallet#walletpassphrase>`__:
   stores the wallet decryption key in memory for the indicated number
   of seconds. Issuing the ``walletpassphrase`` command while the wallet
   is already unlocked will set a new unlock time that overrides the old
   one.

WalletProcessPSBT
=================

The ```walletprocesspsbt``
RPC <core-api-ref-remote-procedure-calls-wallet#walletprocesspsbt>`__
updates a PSBT with input information from a wallet and then allows the
signing of inputs.

*Parameter #1—PSBT*

======== ====== =================== =============================
Name     Type   Presence            Description
======== ====== =================== =============================
``psbt`` string Required(exactly 1) The transaction base64 string
======== ====== =================== =============================

*Parameter #2—Sign Transaction*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``sign``        | bool            | O               | Sign the        |
|                 |                 | ptional(exactly | transaction     |
|                 |                 | 0 or 1)         | when updating   |
|                 |                 |                 | (default =      |
|                 |                 |                 | ``true``)       |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—Signature Hash Type*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``sighashtype`` | string          | O               | he signature    |
|                 |                 | ptional(exactly | hash type to    |
|                 |                 | 0 or 1)         | sign with if    |
|                 |                 |                 | not specified   |
|                 |                 |                 | by the PSBT.    |
|                 |                 |                 | Must be one of  |
|                 |                 |                 | the following   |
|                 |                 |                 | (default =      |
|                 |                 |                 | ALL): - ALL -   |
|                 |                 |                 | NONE - SINGLE - |
|                 |                 |                 | A               |
|                 |                 |                 | LL|ANYONECANPAY |
|                 |                 |                 | -               |
|                 |                 |                 | NO              |
|                 |                 |                 | NE|ANYONECANPAY |
|                 |                 |                 | -               |
|                 |                 |                 | SING            |
|                 |                 |                 | LE|ANYONECANPAY |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #4—bip32derivs*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| bip32           | bool            | O               | If true,        |
|                 |                 | ptional(exactly | includes the    |
|                 |                 | 0 or 1)         | BIP 32          |
|                 |                 |                 | derivation      |
|                 |                 |                 | paths for       |
|                 |                 |                 | public keys if  |
|                 |                 |                 | known (default  |
|                 |                 |                 | = ``false``).   |
+-----------------+-----------------+-----------------+-----------------+

*Result—the processed wallet*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | The results of  |
|                 |                 | equired(exactly | the signature   |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``psbt``     | string          | R               | The             |
|                 |                 | equired(exactly | base64-encoded  |
|                 |                 | 1)              | partially       |
|                 |                 |                 | signed          |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``complete`` | bool            | R               | If the          |
|                 |                 | equired(exactly | transaction has |
|                 |                 | 1)              | a complete set  |
|                 |                 |                 | of signatures   |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

Change the wallet passphrase from “test” to “example”:

.. code:: bash

   dash-cli walletprocesspsbt "cHNidP8BAEICAAAAAXgRxzbShUlivVFKgoLyhk0RCCYLZKCYTl/tYRd+yGImAAAAAAD/////AQAAAAAAAAAABmoEAAECAwAAAAAAAAA="

Result:

.. code:: json

   {
     "psbt": "cHNidP8BAEICAAAAAXgRxzbShUlivVFKgoLyhk0RCCYLZKCYTl/tYRd+yGImAAAAAAD/////AQAAAAAAAAAABmoEAAECAwAAAAAAAQDhAgAAAAGUi7dQLNEVUajA9jcftG9LmDpAZzvVlgQVcitxL418QgEAAABqRzBEAiBP5PxIjJVfKGxSyEjseVC0DsR24bQ0xq3WhrR0vd4JqQIgYiLSkf2do0FAiqikcg9aaVmZdxWh3fgYfnUne2v8rn4BIQPGfYaUQxWDiup+yA05C10JuRtiSDNw1Jedpcz3p993qf7///8CtOfGCQAAAAAZdqkUzvxGSQTAOBTAGQbhl9x1mnReR+6IrADKmjsAAAAAGXapFD75vL6S93yPrdBWbup/+NR/Ir3giKxVSAgAAQdqRzBEAiAF1fgBDg2M/WAeYTYzCkEiSSrDVzcYoe8wwrw/MbdgOQIgJzoYBQ9hAm6jqk2cLFitUd1/iL1ku8w9unadjNfsCdoBIQJn2pETmk8U2X6veADqnny5/6j8Iy7Oizij0SeJHm9x6AAA",
     "complete": true
   }

*See also*

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
-  `FinalizePSBT </docs/core-api-ref-remote-procedure-calls-raw-transactions#finalizepsbt>`__:
   finalizes the inputs of a PSBT.
-  `WalletCreateFundedPSBT </docs/core-api-ref-remote-procedure-calls-wallet#walletcreatefundedpsbt>`__:
   creates and funds a transaction in the Partially Signed Transaction
   (PST) format.

.. |Warning icon| image:: https://dash-docs.github.io/img/icons/icon_warning.svg
