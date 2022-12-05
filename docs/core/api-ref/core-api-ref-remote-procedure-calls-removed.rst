EstimateFee
===========

[block:callout] { “type”: “danger”, “body”: “**Warning:** **Removed in
Dash Core 0.17.0.**” } [/block]

The ```estimatefee``
RPC <core-api-ref-remote-procedure-calls-util#estimatefee>`__ estimates
the transaction fee per kilobyte that needs to be paid for a transaction
to begin confirmation within a certain number of blocks.

*Parameter #1—how many blocks the transaction may wait before being
included*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Blocks          | number (int)    | R               | The maximum     |
|                 |                 | equired(exactly | number of       |
|                 |                 | 1)              | blocks a        |
|                 |                 |                 | transaction     |
|                 |                 |                 | should have to  |
|                 |                 |                 | wait before it  |
|                 |                 |                 | is predicted to |
|                 |                 |                 | be included in  |
|                 |                 |                 | a block. Has to |
|                 |                 |                 | be between 2    |
|                 |                 |                 | and 25 blocks   |
+-----------------+-----------------+-----------------+-----------------+

*Result—the fee the transaction needs to pay per kilobyte*
[block:callout] { “type”: “danger”, “body”: “If the node doesn’t have
enough information to make an estimate, the value ``-1`` will be
returned.”, “title”: “Inability to estimate” } [/block] Name \| Type \|
Presence \| Description — \| — \| — \| — ``result`` \| number (Dash) \|
Required(exactly 1) \| The estimated fee the transaction should pay in
order to be included within the specified number of blocks.

*Examples from Dash Core 0.12.2*

.. code:: bash

   dash-cli estimatefee 6

Result:

.. code:: json

   0.00044345

Requesting data the node can’t calculate (out of range):

.. code:: bash

   dash-cli estimatefee 100

Result:

.. code:: json

   -1

*See also*

-  `SetTxFee </docs/core-api-ref-remote-procedure-calls-wallet#settxfee>`__:
   sets the transaction fee per kilobyte paid by transactions created by
   this wallet.

GetPoolInfo
===========

The ```getpoolinfo`` RPC <#getpoolinfo>`__ returns an object containing
CoinJoin pool related information.

*Parameters: none*

*Result—information about the CoinJoin pool*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | Information     |
|                 |                 | equired(exactly | about the pool  |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``state``    | string          | R               | Pool state.     |
|                 |                 | equired(exactly | Will be one of  |
|                 |                 | 1)              | the following:• |
|                 |                 |                 | ``IDLE`` •      |
|                 |                 |                 | ``QUEUE`` •     |
|                 |                 |                 | ``ACCE          |
|                 |                 |                 | PTING_ENTRIES`` |
|                 |                 |                 | • ``SIGNING`` • |
|                 |                 |                 | ``ERROR`` •     |
|                 |                 |                 | ``SUCCESS`` •   |
|                 |                 |                 | ``UNKNOWN``     |
+-----------------+-----------------+-----------------+-----------------+
| →\              | string          | R               | One of the      |
| ``mixing_mode`` |                 | equired(exactly | following:•     |
|                 |                 | 1)              | ``normal`` •    |
|                 |                 |                 | ``              |
|                 |                 |                 | multi-session`` |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``queue``    | number (int)    | R               | Queue size      |
|                 |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``entries``  | number (int)    | R               | The number of   |
|                 |                 | equired(exactly | entries         |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``status``   | string          | R               | A more detailed |
|                 |                 | equired(exactly | description of  |
|                 |                 | 1)              | the current     |
|                 |                 |                 | state           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``outpoint`` | string (hex)    | O               | Previous output |
|                 |                 | ptional(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``addr``     | string          | O               | Address         |
|                 |                 | ptional(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | O               | The number of   |
| \ ``keys_left`` |                 | ptional(exactly | keys left in    |
|                 |                 | 1)              | the local       |
|                 |                 |                 | wallet          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``warnings`` | number (int)    | O               | Warnings        |
|                 |                 | ptional(exactly | related to      |
|                 |                 | 1)              | local wallet    |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet getpoolinfo

Result:

.. code:: json

   {
     "state": "IDLE",
     "mixing_mode": "normal",
     "queue": 0,
     "entries": 0,
     "status": "PrivateSend is idle.",
     "keys_left": 617,
     "warnings": ""
   }

.. code:: json

   {
     "state": "QUEUE",
     "mixing_mode": "normal",
     "queue": 1,
     "entries": 0,
     "status": "Submitted to masternode, waiting in queue .",
     "outpoint": "e3a6b7878a7e9413898bb379b323c521676f9d460db17ec3bf42d9ac0c9a432f-1",
     "addr": "217.182.229.146:19999",
     "keys_left": 571,
     "warnings": ""
   }

.. code:: json

   {
     "state": "ERROR",
     "mixing_mode": "normal",
     "queue": 0,
     "entries": 0,
     "status": "PrivateSend request incomplete: Session timed out. Will retry...",
     "keys_left": 571,
     "warnings": ""
   }

*See also:*

GetReceivedByAccount
====================

[block:callout] { “type”: “danger”, “body”: “**Warning:** **Removed in
Dash Core 18.0.0**” } [/block]

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**)” } [/block] The
```getreceivedbyaccount``
RPC <core-api-ref-remote-procedure-calls-wallet-deprecated#getreceivedbyaccount>`__
returns the total amount received by addresses in a particular account
from transactions with the specified number of confirmations. It does
not count coinbase transactions.

*Parameter #1—the account name*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Account         | string          | R               | The name of the |
|                 |                 | equired(exactly | account         |
|                 |                 | 1)              | containing the  |
|                 |                 |                 | addresses to    |
|                 |                 |                 | get. For the    |
|                 |                 |                 | default         |
|                 |                 |                 | account, use an |
|                 |                 |                 | empty string    |
|                 |                 |                 | (\\“)”          |
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
|                 |                 |                 | (default=false) |
+-----------------+-----------------+-----------------+-----------------+

*Result—the number of dash received*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | number (dash)   | R               | The number of   |
|                 |                 | equired(exactly | dash received   |
|                 |                 | 1)              | by the account. |
|                 |                 |                 | May be ``0``    |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Get the dash received by the “doc test” account with six or more
confirmations:

.. code:: bash

   dash-cli -testnet getreceivedbyaccount "doc test" 6

Result:

.. code:: json

   0.30000000

*See also*

-  `GetReceivedByAddress </docs/core-api-ref-remote-procedure-calls-wallet#getreceivedbyaddress>`__:
   returns the total amount received by the specified address in
   transactions with the specified number of confirmations. It does not
   count coinbase transactions.
-  `GetAddressesByAccount </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#getaddressesbyaccount>`__:
   returns a list of every address assigned to a particular account.
-  `ListAccounts </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#listaccounts>`__:
   lists accounts and their balances.

KeePass
=======

[block:callout] { “type”: “danger”, “body”: “**Warning:** **Removed in
Dash Core 18.0.0**” } [/block]

The ```keepass``
RPC <core-api-ref-remote-procedure-calls-wallet#keepass>`__ provides
commands for configuring and managing KeePass authentication

*Parameter #1—Command mode*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``mode``        | string          | Required        | The command     |
|                 |                 | (exactly 1)     | mode to         |
|                 |                 |                 | us              |
|                 |                 |                 | e:\ ``genkey``, |
|                 |                 |                 | \ ``init``,\ `` |
|                 |                 |                 | setpassphrase`` |
+-----------------+-----------------+-----------------+-----------------+

*Command Options*

+-----------------------+-----------------------+-----------------------+
| Mode                  | Description           |                       |
+=======================+=======================+=======================+
| ``genkey``            | Generates a base64    |                       |
|                       | encoded 256 bit AES   |                       |
|                       | key that can be used  |                       |
|                       | for the communication |                       |
|                       | with KeePassHttp.     |                       |
|                       | This is only          |                       |
|                       | necessary for manual  |                       |
|                       | configuration.        |                       |
+-----------------------+-----------------------+-----------------------+
| ``init``              | Sets up the           |                       |
|                       | association between   |                       |
|                       | Dash Core and KeePass |                       |
|                       | by generating an AES  |                       |
|                       | key and sending an    |                       |
|                       | association message   |                       |
|                       | to KeePassHttp. This  |                       |
|                       | will trigger KeePass  |                       |
|                       | to ask for an Id for  |                       |
|                       | the association.      |                       |
|                       | Returns the           |                       |
|                       | association and the   |                       |
|                       | base64 encoded string |                       |
|                       | for the AES key.      |                       |
+-----------------------+-----------------------+-----------------------+
| ``setpassphrase``     | Updates the           |                       |
|                       | passphrase in         |                       |
|                       | KeePassHttp to a new  |                       |
|                       | value. This should    |                       |
|                       | match the passphrase  |                       |
|                       | you intend to use for |                       |
|                       | the wallet. Please    |                       |
|                       | note that the         |                       |
|                       | standard RPC commands |                       |
|                       | w                     |                       |
|                       | alletpassphrasechange |                       |
|                       | and the wallet        |                       |
|                       | encryption from the   |                       |
|                       | QT GUI already send   |                       |
|                       | the updates to        |                       |
|                       | KeePassHttp, so this  |                       |
|                       | is only necessary for |                       |
|                       | manual manipulation   |                       |
|                       | of the password.      |                       |
+-----------------------+-----------------------+-----------------------+

**Command Mode - ``genkey``**

*Result—the new key*

====== =============== ==================== ===========
Name   Type            Presence             Description
====== =============== ==================== ===========
Result string (base64) Required (exactly 1) The new key
====== =============== ==================== ===========

*Example from Dash Core 0.12.2*

Manually generate a key

.. code:: bash

   dash-cli -testnet keepass genkey

Result:

.. code:: bash

   Generated Key: dNjo+J8Jb30txbJiKq4s9H6vEgWq/whb1w9bb2cTOFo=

**Command Mode - ``init``**

*Result—initialization response*

====== ====== ==================== ========================
Name   Type   Presence             Description
====== ====== ==================== ========================
Result string Required (exactly 1) The success/error status
====== ====== ==================== ========================

*Example from Dash Core 0.12.2*

Automatically initialize

.. code:: bash

   dash-cli -testnet keepass init

Result (wrapped):

.. code:: bash

   Association successful. Id: testwalletassociation - \
   Key: MSb+JLygqz7ZH40SyJ1QR62i00IXoa3tmT85MGGI2K0=

**Command Mode - ``setpassphrase``**

*Parameter #2—Passphrase*

========== ====== ==================== =====================
Name       Type   Presence             Description
========== ====== ==================== =====================
Passphrase string Required (exactly 1) The passphrase to set
========== ====== ==================== =====================

*Result—status*

====== ====== ==================== ========================
Name   Type   Presence             Description
====== ====== ==================== ========================
Result string Required (exactly 1) The success/error status
====== ====== ==================== ========================

*Example from Dash Core 0.12.2*

Set KeePass passphrase

.. code:: bash

   dash-cli -testnet keepass setpassphrase 1BWi20Xyk76uWumxJQy4

Result:

.. code:: bash

   setlogin: Updated credentials.

*See also: none*

ListAccounts
============

[block:callout] { “type”: “danger”, “body”: “**Warning:** **Removed in
Dash Core 18.0.0**” } [/block]

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**)” } [/block] The ```listaccounts``
RPC <core-api-ref-remote-procedure-calls-wallet-deprecated#listaccounts>`__
lists accounts and their balances.

*Parameter #1—the minimum number of confirmations a transaction must
have*

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

*Parameter #2— whether to include transactions locked via InstantSend*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| addlocked       | bool            | O               | Add the balance |
|                 |                 | ptional(exactly | from            |
|                 |                 | 1)              | InstantSend     |
|                 |                 |                 | locked          |
|                 |                 |                 | transactions    |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—whether to include watch-only addresses in results*

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

*Result—a list of accounts and their balances*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | A JSON array    |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | key/value pairs |
|                 |                 |                 | with account    |
|                 |                 |                 | names and       |
|                 |                 |                 | values. Must    |
|                 |                 |                 | include, at the |
|                 |                 |                 | very least, the |
|                 |                 |                 | default account |
|                 |                 |                 | (\\“)”          |
+-----------------+-----------------+-----------------+-----------------+
| →Account :      | string : number | Required(1 or   | The name of an  |
| Balance         | (dash)          | more)           | account as a    |
|                 |                 |                 | string paired   |
|                 |                 |                 | with the        |
|                 |                 |                 | balance of the  |
|                 |                 |                 | account as a    |
|                 |                 |                 | number of dash. |
|                 |                 |                 | The number of   |
|                 |                 |                 | dash may be     |
|                 |                 |                 | negative if the |
|                 |                 |                 | account has     |
|                 |                 |                 | spent more dash |
|                 |                 |                 | than it         |
|                 |                 |                 | received.       |
|                 |                 |                 | Accounts with   |
|                 |                 |                 | zero balances   |
|                 |                 |                 | and zero        |
|                 |                 |                 | transactions    |
|                 |                 |                 | will be         |
|                 |                 |                 | displayed       |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.13.0*

Display account balances with one confirmation and watch-only addresses
included. Add the balance of InstantSend locked transactions also.

.. code:: bash

   dash-cli -testnet listaccounts 1 true true

Result:

.. code:: json

   {
     "": -2941.30029732,
     "Watching": 8.50000000,
     "MN": 2000.25442744,
     "PS": 37.02970000,
     "Recv1": 3843.48167912,
   }

*See also*

-  `GetAccount </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#getaccount>`__:
   returns the name of the account associated with the given address.
-  `GetAddressesByAccount </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#getaddressesbyaccount>`__:
   returns a list of every address assigned to a particular account.
-  `ListReceivedByAccount </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#listreceivedbyaccount>`__:
   lists the total number of dash received by each account.
-  `ListReceivedByLabel <core-api-ref-remote-procedure-calls-wallet#listreceivedbylabel>`__:
   lists the total number of dash received by each label.

ListReceivedByAccount
=====================

[block:callout] { “type”: “danger”, “body”: “**Warning:** **Removed in
Dash Core 18.0.0**” } [/block]

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**)” } [/block] The
```listreceivedbyaccount``
RPC <core-api-ref-remote-procedure-calls-wallet-deprecated#listreceivedbyaccount>`__
lists the total number of dash received by each account.

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
| →Account        | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing an   |
|                 |                 |                 | account         |
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
| →               | string          | R               | The name of the |
| →\ ``account``  |                 | equired(exactly | account         |
|                 |                 | 1)              |                 |
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
| → →\ ``label``  | string          | Optional(0 or   | A comment for   |
|                 |                 | 1)              | the             |
|                 |                 |                 | addr            |
|                 |                 |                 | ess/transaction |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.13.0*

Get the balances for all non-empty accounts, including transactions
which have been confirmed at least six times and InstantSend locked
transactions:

.. code:: bash

   dash-cli -testnet listreceivedbyaccount 6 true false true

Result (edited to only show the first two results):

.. code:: json

   [
       {
           "account" : "",
           "amount" : 0.19960000,
           "confirmations" : 53601
       },
       {
           "account" : "doc test",
           "amount" : 0.30000000,
           "confirmations" : 8991
       }
   ]

*See also*

-  `ListReceivedByAddress </docs/core-api-ref-remote-procedure-calls-wallet#listreceivedbyaddress>`__:
   lists the total number of dash received by each address.
-  `ListReceivedByLabel <core-api-ref-remote-procedure-calls-wallet#listreceivedbylabel>`__:
   lists the total number of dash received by each label.
-  `GetReceivedByAccount </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#getreceivedbyaccount>`__:
   returns the total amount received by addresses in a particular
   account from transactions with the specified number of confirmations.
   It does not count coinbase transactions.
-  `GetReceivedByAddress </docs/core-api-ref-remote-procedure-calls-wallet#getreceivedbyaddress>`__:
   returns the total amount received by the specified address in
   transactions with the specified number of confirmations. It does not
   count coinbase transactions.

Move
====

[block:callout] { “type”: “danger”, “body”: “**Warning:** **Removed in
Dash Core 18.0.0**” } [/block]

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**)” } [/block] The ```move``
RPC <core-api-ref-remote-procedure-calls-wallet-deprecated#move>`__
moves a specified amount from one account in your wallet to another
using an off-block-chain transaction. [block:callout] { “type”:
“warning”, “body”: “**Warning:** it’s possible to move more funds than
are in an account, giving the sending account a negative balance and
giving the receiving account a balance that may exceed the number of
dash in the wallet (or the number of dash in existence).” } [/block]
*Parameter #1—from account*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| From Account    | string          | R               | The name of the |
|                 |                 | equired(exactly | account to move |
|                 |                 | 1)              | the funds from  |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—to account*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| To Account      | string          | R               | The name of the |
|                 |                 | equired(exactly | account to move |
|                 |                 | 1)              | the funds to    |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—amount to move*

====== ============= =================== ==========================
Name   Type          Presence            Description
====== ============= =================== ==========================
Amount number (dash) Required(exactly 1) The amount of dash to move
====== ============= =================== ==========================

*Parameter #4—an unused parameter*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| *Unused*        | number (int)    | Optional(0 or   | This parameter  |
|                 |                 | 1)              | is no longer    |
|                 |                 |                 | used. If        |
|                 |                 |                 | parameter #5    |
|                 |                 |                 | needs to be     |
|                 |                 |                 | specified, this |
|                 |                 |                 | can be any      |
|                 |                 |                 | integer         |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #5—a comment*

======= ====== ================ ========================================
Name    Type   Presence         Description
======= ====== ================ ========================================
Comment string Optional(0 or 1) A comment to assign to this move payment
======= ====== ================ ========================================

*Result—``true`` on success*

+------------+------+---------------------+-----------------------+
| Name       | Type | Presence            | Description           |
+============+======+=====================+=======================+
| ``result`` | bool | Required(exactly 1) | Set to ``true`` if    |
|            |      |                     | the move was          |
|            |      |                     | successful            |
+------------+------+---------------------+-----------------------+

*Example from Dash Core 0.12.2*

Move 1 dash from “doc test” to “test1”, giving the transaction the
comment “Example move”:

.. code:: bash

   dash-cli -testnet move "doc test" "test1" 0.1 0 "Example move"

Result:

.. code:: json

   true

*See also*

-  `ListAccounts </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#listaccounts>`__:
   lists accounts and their balances.
-  `SendFrom </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#sendfrom>`__:
   spends an amount from a local account to a dash address.
-  `SendToAddress </docs/core-api-ref-remote-procedure-calls-wallet#sendtoaddress>`__:
   spends an amount to a given address.

SendFrom
========

[block:callout] { “type”: “danger”, “body”: “**Warning:** **Removed in
Dash Core 18.0.0**” } [/block]

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**). Requires an unlocked wallet or an
unencrypted wallet.” } [/block] The ```sendfrom``
RPC <core-api-ref-remote-procedure-calls-wallet-deprecated#sendfrom>`__
spends an amount from a local account to a dash address.

*Parameter #1—from account*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| From Account    | string          | R               | The name of the |
|                 |                 | equired(exactly | account from    |
|                 |                 | 1)              | which the dash  |
|                 |                 |                 | should be       |
|                 |                 |                 | spent. Use an   |
|                 |                 |                 | empty string    |
|                 |                 |                 | (\\“) for the   |
|                 |                 |                 | default         |
|                 |                 |                 | account”        |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—to address*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| To Address      | string          | R               | A P2PKH or P2SH |
|                 |                 | equired(exactly | address to      |
|                 |                 | 1)              | which the dash  |
|                 |                 |                 | should be sent  |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—amount to spend*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Amount          | number (dash)   | R               | The amount to   |
|                 |                 | equired(exactly | spend in dash.  |
|                 |                 | 1)              | Dash Core will  |
|                 |                 |                 | ensure the      |
|                 |                 |                 | account has     |
|                 |                 |                 | sufficient dash |
|                 |                 |                 | to pay this     |
|                 |                 |                 | amount (but the |
|                 |                 |                 | transaction fee |
|                 |                 |                 | paid is not     |
|                 |                 |                 | included in the |
|                 |                 |                 | calculation, so |
|                 |                 |                 | an account can  |
|                 |                 |                 | spend a total   |
|                 |                 |                 | of its balance  |
|                 |                 |                 | plus the        |
|                 |                 |                 | transaction     |
|                 |                 |                 | fee)            |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #4—minimum confirmations*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Confirmations   | number (int)    | Optional(0 or   | The minimum     |
|                 |                 | 1)              | number of       |
|                 |                 |                 | confirmations   |
|                 |                 |                 | an incoming     |
|                 |                 |                 | transaction     |
|                 |                 |                 | must have for   |
|                 |                 |                 | its outputs to  |
|                 |                 |                 | be credited to  |
|                 |                 |                 | this account’s  |
|                 |                 |                 | balance.        |
|                 |                 |                 | Outgoing        |
|                 |                 |                 | transactions    |
|                 |                 |                 | are always      |
|                 |                 |                 | counted, as are |
|                 |                 |                 | move            |
|                 |                 |                 | transactions    |
|                 |                 |                 | made with the   |
|                 |                 |                 | ```move``       |
|                 |                 |                 | RPC <cor        |
|                 |                 |                 | e-api-ref-remot |
|                 |                 |                 | e-procedure-cal |
|                 |                 |                 | ls-wallet-depre |
|                 |                 |                 | cated#move>`__. |
|                 |                 |                 | If an account   |
|                 |                 |                 | doesn’t have a  |
|                 |                 |                 | balance high    |
|                 |                 |                 | enough to pay   |
|                 |                 |                 | for this        |
|                 |                 |                 | transaction,    |
|                 |                 |                 | the payment     |
|                 |                 |                 | will be         |
|                 |                 |                 | rejected. Use   |
|                 |                 |                 | ``0`` to spend  |
|                 |                 |                 | unconfirmed     |
|                 |                 |                 | incoming        |
|                 |                 |                 | payments.       |
|                 |                 |                 | Default is      |
|                 |                 |                 | ``1``           |
+-----------------+-----------------+-----------------+-----------------+

[block:callout] { “type”: “warning”, “body”: “**Warning:** if account1
receives an unconfirmed payment and transfers it to account2 with the
```move``
RPC <core-api-ref-remote-procedure-calls-wallet-deprecated#move>`__,
account2 will be able to spend those dash even if this parameter is set
to ``1`` or higher.” } [/block] *Parameter #5—whether to add the balance
from transactions locked via InstantSend*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| addlocked       | bool            | Optional(0 or   | If set to       |
|                 |                 | 1)              | ``true``, add   |
|                 |                 |                 | the balance     |
|                 |                 |                 | from            |
|                 |                 |                 | InstantSend     |
|                 |                 |                 | locked          |
|                 |                 |                 | transactions.   |
|                 |                 |                 | If set to       |
|                 |                 |                 | ``false`` (the  |
|                 |                 |                 | default),       |
|                 |                 |                 | InstantSend     |
|                 |                 |                 | locked          |
|                 |                 |                 | transaction     |
|                 |                 |                 | balances are    |
|                 |                 |                 | not included.   |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #6—a comment*

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

*Parameter #7—a comment about who the payment was sent to*

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

Spend 0.1 dash from the account “test” to the address indicated below
using only UTXOs with at least six confirmations, giving the transaction
the comment “Example spend” and labeling the spender “Example.com”:

.. code:: bash

   dash-cli -testnet sendfrom "test" \
               yhJays6zGUFKq1KS5V5WLbyk3cwCXyGrKd \
               0.1 \
               6 \
               false \
               "Example spend" \
               "Example.com"

Result:

.. code:: text

   cd64b9d55c63bf247f2eca32f978e340622107b607a46c422dabcdc20c0571fe

*See also*

-  `SendToAddress </docs/core-api-ref-remote-procedure-calls-wallet#sendtoaddress>`__:
   spends an amount to a given address.
-  `SendMany </docs/core-api-ref-remote-procedure-calls-wallet#sendmany>`__:
   creates and broadcasts a transaction which sends outputs to multiple
   addresses.

SignRawTransaction
==================

[block:callout] { “type”: “danger”, “title”: "“,”body“:”\ **Warning:**
**Removed in Dash Core 18.0.0**" } [/block] The ```signrawtransaction``
RPC <core-api-ref-remote-procedure-calls-raw-transactions#signrawtransaction>`__
signs a transaction in the serialized transaction format using private
keys stored in the wallet or provided in the call.

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

*Parameter #3—private keys for signing*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Private Keys    | array           | Optional(0 or   | An array        |
|                 |                 | 1)              | holding private |
|                 |                 |                 | keys. If any    |
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
|                 |                 |                 | are required    |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Sign the hex generated in the example section for the
``createrawtransaction`` RPC:

.. code:: bash

   dash-cli -testnet signrawtransaction 01000000016b490886c0198b028c6c5cb14\
   5c4eb3b1055a224a7a105aadeff41b69ec91e060100000000ffffffff0200205fa012000\
   0001976a914485485425fa99504ec1638ac4213f3cfc9f32ef388acc0a8f9be010000001\
   976a914811eacc14db8ebb5b64486dc43400c0226b428a488ac00000000

Result:

.. code:: json

   {
     "hex": "01000000016b490886c0198b028c6c5cb145c4eb3b1055a224a7a105aadeff41b69ec91e060100000069463043022033a61c56fa0867ed67b76b023204a9dc0ee6b0d63305dc5f65fe94335445ff2f021f712f55399d5238fc7146497c431fc4182a1de0b96fc22716e0845f561d542e012102eacba539d92eb88d4e73bb32749d79f53f6e8d7947ac40a71bd4b26c13b6ec29ffffffff0200205fa0120000001976a914485485425fa99504ec1638ac4213f3cfc9f32ef388acc0a8f9be010000001976a914811eacc14db8ebb5b64486dc43400c0226b428a488ac00000000",
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
-  `SignRawTransactionWithKey <#signrawtransactionwithkey>`__: signs
   inputs for a transaction in the serialized transaction format using
   private keys provided in the call.
