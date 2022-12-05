[block:callout] { “type”: “danger”, “body”: “RPCs that require wallet
support are **not available on masternodes** for security reasons. Such
RPCs are designated with a "*Requires wallet support*" message.”,
“title”: “Wallet Support” } [/block]

GetAccount
==========

[block:callout] { “type”: “danger”, “body”: “**Warning:** ``setaccount``
will be removed in Dash Core v18.0. Use the RPCs listed in the See Also
subsection below instead. To use this command in Dash Core v0.17, start
dashd with ``-deprecatedrpc=accounts``.” } [/block]

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**)” } [/block]

The ```getaccount``
RPC <core-api-ref-remote-procedure-calls-wallet-deprecated#getaccount>`__
returns the name of the account associated with the given address.

*Parameter #1—a Dash address*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Address         | string (base58) | R               | A P2PKH or P2SH |
|                 |                 | equired(exactly | Dash address    |
|                 |                 | 1)              | belonging       |
|                 |                 |                 | either to a     |
|                 |                 |                 | specific        |
|                 |                 |                 | account or the  |
|                 |                 |                 | default account |
|                 |                 |                 | (\\“)”          |
+-----------------+-----------------+-----------------+-----------------+

*Result—an account name*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | string          | R               | The name of an  |
|                 |                 | equired(exactly | account, or an  |
|                 |                 | 1)              | empty string    |
|                 |                 |                 | (\\“, the       |
|                 |                 |                 | default         |
|                 |                 |                 | account)”       |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet getaccount yMTFRnrfJ4NpnYVeidDNHVwT7uuNsVjevq

Result:

.. code:: text

   doc test

*See also*

-  `GetAddressesByAccount </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#getaddressesbyaccount>`__:
   returns a list of every address assigned to a particular account.

GetAccountAddress
=================

[block:callout] { “type”: “danger”, “body”: “**Warning:**
``getaccountaddress`` will be removed in Dash Core v18.0. Use the RPCs
listed in the See Also subsection below instead. To use this command in
Dash Core v0.17, start dashd with ``-deprecatedrpc=accounts``.” }
[/block]

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**)” } [/block]

The ```getaccountaddress``
RPC <core-api-ref-remote-procedure-calls-wallet-deprecated#getaccountaddress>`__
returns the current Dash address for receiving payments to this account.
If the account doesn’t exist, it creates both the account and a new
address for receiving payment. Once a payment has been received to an
address, future calls to this RPC for the same account will return a
different address.

*Parameter #1—an account name*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Account         | string          | R               | The name of an  |
|                 |                 | equired(exactly | account. Use an |
|                 |                 | 1)              | empty string    |
|                 |                 |                 | (\\“) for the   |
|                 |                 |                 | default         |
|                 |                 |                 | account. If the |
|                 |                 |                 | account doesn’t |
|                 |                 |                 | exist, it will  |
|                 |                 |                 | be created”     |
+-----------------+-----------------+-----------------+-----------------+

*Result—a Dash address*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | string (base58) | R               | An address,     |
|                 |                 | equired(exactly | belonging to    |
|                 |                 | 1)              | the account     |
|                 |                 |                 | specified,      |
|                 |                 |                 | which has not   |
|                 |                 |                 | yet received    |
|                 |                 |                 | any payments    |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Get an address for the default account:

.. code:: bash

   dash-cli -testnet getaccountaddress ""

Result:

.. code:: text

   yNUQ6RzTpNj5GP5ebdRcusJ7K9JJKx6VvV

*See also*

-  `GetNewAddress </docs/core-api-ref-remote-procedure-calls-wallet#getnewaddress>`__:
   returns a new Dash address for receiving payments. If an account is
   specified, payments received with the address will be credited to
   that account.
-  `GetRawChangeAddress </docs/core-api-ref-remote-procedure-calls-wallet#getrawchangeaddress>`__:
   returns a new Dash address for receiving change. This is for use with
   raw transactions, not normal use.
-  `GetAddressesByAccount </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#getaddressesbyaccount>`__:
   returns a list of every address assigned to a particular account.

GetAddressesByAccount
=====================

[block:callout] { “type”: “danger”, “body”: “**Warning:**
``getaddressesbyaccount`` will be removed in Dash Core v18.0. Use the
RPCs listed in the See Also subsection below instead. To use this
command in Dash Core v0.17, start dashd with
``-deprecatedrpc=accounts``.” } [/block]

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**)” } [/block]

The ```getaddressesbyaccount``
RPC <core-api-ref-remote-procedure-calls-wallet-deprecated#getaddressesbyaccount>`__
returns a list of every address assigned to a particular account.

*Parameter #1—the account name*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Account         | string          | R               | The name of the |
|                 |                 | equired(exactly | account         |
|                 |                 | 1)              | containing the  |
|                 |                 |                 | addresses to    |
|                 |                 |                 | get. To get     |
|                 |                 |                 | addresses from  |
|                 |                 |                 | the default     |
|                 |                 |                 | account, pass   |
|                 |                 |                 | an empty string |
|                 |                 |                 | (\\“)”          |
+-----------------+-----------------+-----------------+-----------------+

*Result—a list of addresses*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | An array        |
|                 |                 | equired(exactly | containing all  |
|                 |                 | 1)              | addresses       |
|                 |                 |                 | belonging to    |
|                 |                 |                 | the specified   |
|                 |                 |                 | account. If the |
|                 |                 |                 | account has no  |
|                 |                 |                 | addresses, the  |
|                 |                 |                 | array will be   |
|                 |                 |                 | empty           |
+-----------------+-----------------+-----------------+-----------------+
| Address         | string (base58) | Optional(1 or   | A P2PKH or P2SH |
|                 |                 | more)           | address         |
|                 |                 |                 | belonging to    |
|                 |                 |                 | the account     |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Get the addresses assigned to the account “doc test”:

.. code:: bash

   dash-cli -testnet getaddressesbyaccount "doc test"

Result:

.. code:: json

   [
     "yMTFRnrfJ4NpnYVeidDNHVwT7uuNsVjevq",
     "yhT2HS1SxvXkMVdAdf6RNtGPfuVFvwZi35"
   ]

*See also*

-  `GetAccount </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#getaccount>`__:
   returns the name of the account associated with the given address.
-  `GetBalance </docs/core-api-ref-remote-procedure-calls-wallet#getbalance>`__:
   gets the balance in decimal dash across all accounts or for a
   particular account.

SetAccount
==========

[block:callout] { “type”: “warning”, “body”: “**Warning:**
``setaccount`` will be removed in a later version of Dash Core. Use the
RPCs listed in the See Also subsection below instead.” } [/block]

[block:callout] { “type”: “info”, “body”: “Requires <> support
(**unavailable on masternodes**)” } [/block]

The ```setaccount``
RPC <core-api-ref-remote-procedure-calls-wallet-deprecated#setaccount>`__
puts the specified address in the given account.

*Parameter #1—a dash address*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Address         | string (base58) | R               | The P2PKH or    |
|                 |                 | equired(exactly | P2SH address to |
|                 |                 | 1)              | put in the      |
|                 |                 |                 | account. Must   |
|                 |                 |                 | already belong  |
|                 |                 |                 | to the wallet   |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—an account*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Account         | string          | R               | The name of the |
|                 |                 | equired(exactly | account in      |
|                 |                 | 1)              | which the       |
|                 |                 |                 | address should  |
|                 |                 |                 | be placed. May  |
|                 |                 |                 | be the default  |
|                 |                 |                 | account, an     |
|                 |                 |                 | empty string    |
|                 |                 |                 | (\\“)”          |
+-----------------+-----------------+-----------------+-----------------+

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

*Example from Dash Core 0.12.2*

Put the address indicated below in the “doc test” account.

.. code:: bash

   dash-cli -testnet setaccount \
       yMTFRnrfJ4NpnYVeidDNHVwT7uuNsVjevq "doc test"

(Success: no result displayed.)

*See also*

-  `GetAccount </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#getaccount>`__:
   returns the name of the account associated with the given address.
-  `GetAddressesByAccount </docs/core-api-ref-remote-procedure-calls-wallet-deprecated#getaddressesbyaccount>`__:
   returns a list of every address assigned to a particular account.
-  `SetLabels </docs/core-api-ref-remote-procedure-calls-wallet#setlabels>`__:
   sets the label associated with the given address.
