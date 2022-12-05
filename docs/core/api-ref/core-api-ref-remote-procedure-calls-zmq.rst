GetZmqNotifications
===================

[block:callout] { “type”: “success”, “body”: “Added in Dash Core 0.17.0”
} [/block] The ```getzmqnotifications``
RPC <core-api-ref-remote-procedure-calls-blockchain#getblockchaininfo>`__
returns information about the active ZeroMQ notifications.

*Parameters: none*

*Result—A JSON array of objects providing information about the enabled
ZMQ notifications*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | Array of        |
|                 |                 | equired(exactly | objects         |
|                 |                 | 1)              | containing      |
|                 |                 |                 | Information     |
|                 |                 |                 | about the       |
|                 |                 |                 | enabled ZMQ     |
|                 |                 |                 | notifications   |
+-----------------+-----------------+-----------------+-----------------+
| →Notification   | object          | Required(0 or   | Information     |
|                 |                 | more)           | about a ZMQ     |
|                 |                 |                 | notification    |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``type``   | string          | R               | Type of         |
|                 |                 | equired(exactly | notification    |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | Address of the  |
| →\ ``address``  |                 | equired(exactly | publisher       |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``hwm``    | number          | R               | Outbound        |
|                 |                 | equired(exactly | message high    |
|                 |                 | 1)              | water mark      |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

.. code:: bash

   dash-cli -testnet getzmqnotifications

Result:

.. code:: json

   [
     {
       "type": "pubhashblock",
       "address": "tcp://0.0.0.0:20009",
       "hwm": 1000
     },
     {
       "type": "pubhashchainlock",
       "address": "tcp://0.0.0.0:20009",
       "hwm": 1000
     },
     {
       "type": "pubhashgovernanceobject",
       "address": "tcp://0.0.0.0:20009",
       "hwm": 1000
     }
   ]

*See also: none*
