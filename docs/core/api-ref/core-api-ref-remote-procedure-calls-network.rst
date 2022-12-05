AddNode
=======

The ```addnode``
RPC <core-api-ref-remote-procedure-calls-network#addnode>`__ attempts to
add or remove a node from the addnode list, or to try a connection to a
node once.

*Parameter #1—hostname/IP address and port of node to add or remove*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``node``        | string          | R               | The node to add |
|                 |                 | equired(exactly | as a string in  |
|                 |                 | 1)              | the form of     |
|                 |                 |                 | ``<IP add       |
|                 |                 |                 | ress>:<port>``. |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—whether to add or remove the node, or to try only once to
connect*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``command``     | string          | R               | What to do with |
|                 |                 | equired(exactly | the IP address  |
|                 |                 | 1)              | above. Options  |
|                 |                 |                 | are:• ``add``   |
|                 |                 |                 | to add a node   |
|                 |                 |                 | to the addnode  |
|                 |                 |                 | list. Up to 8   |
|                 |                 |                 | nodes can be    |
|                 |                 |                 | added           |
|                 |                 |                 | additional to   |
|                 |                 |                 | the default 8   |
|                 |                 |                 | nodes. Not      |
|                 |                 |                 | limited by      |
|                 |                 |                 | ``-maxc         |
|                 |                 |                 | onnections``\ • |
|                 |                 |                 | ``remove`` to   |
|                 |                 |                 | remove a node   |
|                 |                 |                 | from the list.  |
|                 |                 |                 | If currently    |
|                 |                 |                 | connected, this |
|                 |                 |                 | will disconnect |
|                 |                 |                 | immediately•    |
|                 |                 |                 | ``onetry`` to   |
|                 |                 |                 | immediately     |
|                 |                 |                 | attempt         |
|                 |                 |                 | connection to   |
|                 |                 |                 | the node even   |
|                 |                 |                 | if the outgoing |
|                 |                 |                 | connection      |
|                 |                 |                 | slots are full; |
|                 |                 |                 | this will only  |
|                 |                 |                 | attempt the     |
|                 |                 |                 | connection once |
+-----------------+-----------------+-----------------+-----------------+

*Result—``null`` plus error on failed remove*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | null            | R               | Always JSON     |
|                 |                 | equired(exactly | ``null``        |
|                 |                 | 1)              | whether the     |
|                 |                 |                 | node was added, |
|                 |                 |                 | removed,        |
|                 |                 |                 | tried           |
|                 |                 |                 | -and-connected, |
|                 |                 |                 | or              |
|                 |                 |                 | tried-and       |
|                 |                 |                 | -not-connected. |
|                 |                 |                 | The JSON-RPC    |
|                 |                 |                 | error field     |
|                 |                 |                 | will be set     |
|                 |                 |                 | only if you try |
|                 |                 |                 | adding a node   |
|                 |                 |                 | that was        |
|                 |                 |                 | already added   |
|                 |                 |                 | or removing a   |
|                 |                 |                 | node that is    |
|                 |                 |                 | not on the      |
|                 |                 |                 | addnodes list   |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

Try connecting to the following node.

.. code:: bash

   dash-cli -testnet addnode 192.0.2.113:19999 onetry

Result (no output from ``dash-cli`` because result is set to ``null``).

*See also*

-  `GetAddedNodeInfo </docs/core-api-ref-remote-procedure-calls-network#getaddednodeinfo>`__:
   returns information about the given added node, or all added nodes
   (except onetry nodes). Only nodes which have been manually added
   using the ```addnode``
   RPC <core-api-ref-remote-procedure-calls-network#addnode>`__ will
   have their information displayed.

ClearBanned
===========

*Added in Bitcoin Core 0.12.0*

The ```clearbanned``
RPC <core-api-ref-remote-procedure-calls-network#clearbanned>`__ clears
list of banned nodes.

*Parameters: none*

*Result—``null`` on success*

+------------+------+---------------------+-----------------------------------------+
| Name       | Type | Presence            | Description                             |
+============+======+=====================+=========================================+
| ``result`` | null | Required(exactly 1) | JSON ``null`` when the list was cleared |
+------------+------+---------------------+-----------------------------------------+

*Example from Dash Core 0.12.2*

Clears the ban list.

.. code:: bash

   dash-cli clearbanned

Result (no output from ``dash-cli`` because result is set to ``null``).

*See also*

-  `ListBanned </docs/core-api-ref-remote-procedure-calls-network#listbanned>`__:
   lists all banned IPs/Subnets.
-  `SetBan </docs/core-api-ref-remote-procedure-calls-network#setban>`__:
   attempts add or remove a IP/Subnet from the banned list.

DisconnectNode
==============

*Added in Bitcoin Core 0.12.0*

The ```disconnectnode``
RPC <core-api-ref-remote-procedure-calls-network#disconnectnode>`__
immediately disconnects from a specified node.

*Parameter #1—hostname/IP address and port of node to disconnect*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``address``     | string          | R               | The node you    |
|                 |                 | equired(exactly | want to         |
|                 |                 | 1)              | disconnect from |
|                 |                 |                 | as a string in  |
|                 |                 |                 | the form of     |
|                 |                 |                 | ``<I            |
|                 |                 |                 | P address>:<por |
|                 |                 |                 | t>``.\ *Updated |
|                 |                 |                 | in Bitcoin Core |
|                 |                 |                 | 0.14.1*         |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—nodeid*

====== ====== ======== ==============================================
Name   Type   Presence Description
====== ====== ======== ==============================================
nodeid number Optional The node ID (see ``getpeerinfo`` for node IDs)
====== ====== ======== ==============================================

*Result—``null`` on success or error on failed disconnect*

+------------+------+---------------------+-----------------------+
| Name       | Type | Presence            | Description           |
+============+======+=====================+=======================+
| ``result`` | null | Required(exactly 1) | JSON ``null`` when    |
|            |      |                     | the node was          |
|            |      |                     | disconnected          |
+------------+------+---------------------+-----------------------+

*Example from Dash Core 0.15.0*

Disconnects following node by address.

.. code:: bash

   dash-cli -testnet disconnectnode 192.0.2.113:19999

Result (no output from ``dash-cli`` because result is set to ``null``).

Disconnects following node by id.

.. code:: bash

   dash-cli -testnet disconnectnode "" 3

Result (no output from ``dash-cli`` because result is set to ``null``).

*See also*

-  `AddNode </docs/core-api-ref-remote-procedure-calls-network#addnode>`__:
   attempts to add or remove a node from the addnode list, or to try a
   connection to a node once.
-  `GetAddedNodeInfo </docs/core-api-ref-remote-procedure-calls-network#getaddednodeinfo>`__:
   returns information about the given added node, or all added nodes
   (except onetry nodes). Only nodes which have been manually added
   using the ```addnode``
   RPC <core-api-ref-remote-procedure-calls-network#addnode>`__ will
   have their information displayed.

GetAddedNodeInfo
================

The ```getaddednodeinfo``
RPC <core-api-ref-remote-procedure-calls-network#getaddednodeinfo>`__
returns information about the given added node, or all added nodes
(except onetry nodes). Only nodes which have been manually added using
the ```addnode``
RPC <core-api-ref-remote-procedure-calls-network#addnode>`__ will have
their information displayed.

Prior to Dash Core 0.12.3, this dummy parameter was required for
historical purposes but not used:

*DEPRECATED Parameter #1—whether to display connection information*

======= ====== ===================== =============================
Name    Type   Presence              Description
======= ====== ===================== =============================
*Dummy* *bool* *Required(exactly 1)* *Removed in Dash Core 0.12.3*
======= ====== ===================== =============================

Beginning with Dash Core 0.12.3, this is the single (optional)
parameter:

*Parameter #1—what node to display information about*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``node``        | string          | Optional(0 or   | The node to get |
|                 |                 | 1)              | information     |
|                 |                 |                 | about in the    |
|                 |                 |                 | same            |
|                 |                 |                 | ``<IP ad        |
|                 |                 |                 | dress>:<port>`` |
|                 |                 |                 | format as the   |
|                 |                 |                 | ```addnode``    |
|                 |                 |                 | R               |
|                 |                 |                 | PC <core-api-re |
|                 |                 |                 | f-remote-proced |
|                 |                 |                 | ure-calls-netwo |
|                 |                 |                 | rk#addnode>`__. |
|                 |                 |                 | If this         |
|                 |                 |                 | parameter is    |
|                 |                 |                 | not provided,   |
|                 |                 |                 | information     |
|                 |                 |                 | about all added |
|                 |                 |                 | nodes will be   |
|                 |                 |                 | returned        |
+-----------------+-----------------+-----------------+-----------------+

*Result—a list of added nodes*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | An array        |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | objects         |
|                 |                 |                 | describing each |
|                 |                 |                 | added node. If  |
|                 |                 |                 | no added nodes  |
|                 |                 |                 | are present,    |
|                 |                 |                 | the array will  |
|                 |                 |                 | be empty. Nodes |
|                 |                 |                 | added with      |
|                 |                 |                 | ``onetry`` will |
|                 |                 |                 | not be returned |
+-----------------+-----------------+-----------------+-----------------+
| →Added Node     | object          | Optional(0 or   | An object       |
|                 |                 | more)           | containing      |
|                 |                 |                 | details about a |
|                 |                 |                 | single added    |
|                 |                 |                 | node            |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | An added node   |
| →               |                 | equired(exactly | in the same     |
| \ ``addednode`` |                 | 1)              | ``<IP ad        |
|                 |                 |                 | dress>:<port>`` |
|                 |                 |                 | format as used  |
|                 |                 |                 | in the          |
|                 |                 |                 | ```addnode``    |
|                 |                 |                 | R               |
|                 |                 |                 | PC <core-api-re |
|                 |                 |                 | f-remote-proced |
|                 |                 |                 | ure-calls-netwo |
|                 |                 |                 | rk#addnode>`__. |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | Optional(0 or   | This will be    |
| →               |                 | 1)              | set to ``true`` |
| \ ``connected`` |                 |                 | if the node is  |
|                 |                 |                 | currently       |
|                 |                 |                 | connected and   |
|                 |                 |                 | ``false`` if it |
|                 |                 |                 | is not          |
+-----------------+-----------------+-----------------+-----------------+
| →               | array           | R               | This will be an |
| →               |                 | equired(exactly | array of        |
| \ ``addresses`` |                 | 1)              | addresses       |
|                 |                 |                 | belonging to    |
|                 |                 |                 | the added node  |
+-----------------+-----------------+-----------------+-----------------+
| → → →Address    | object          | Optional(0 or   | An object       |
|                 |                 | more)           | describing one  |
|                 |                 |                 | of this node’s  |
|                 |                 |                 | addresses       |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string          | R               | An IP address   |
| →\ ``address``  |                 | equired(exactly | and port number |
|                 |                 | 1)              | of the node. If |
|                 |                 |                 | the node was    |
|                 |                 |                 | added using a   |
|                 |                 |                 | DNS address,    |
|                 |                 |                 | this will be    |
|                 |                 |                 | the resolved IP |
|                 |                 |                 | address         |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string          | R               | Whether or not  |
| →               |                 | equired(exactly | the local node  |
| \ ``connected`` |                 | 1)              | is connected to |
|                 |                 |                 | this addnode    |
|                 |                 |                 | using this IP   |
|                 |                 |                 | address. Valid  |
|                 |                 |                 | values are:•    |
|                 |                 |                 | ``false`` for   |
|                 |                 |                 | not connected•  |
|                 |                 |                 | ``inbound`` if  |
|                 |                 |                 | the addnode     |
|                 |                 |                 | connected to    |
|                 |                 |                 | us•             |
|                 |                 |                 | ``outbound`` if |
|                 |                 |                 | we connected to |
|                 |                 |                 | the addnode     |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.3*

.. code:: bash

   dash-cli getaddednodeinfo

Result (real hostname and IP address replaced with
`RFC5737 <http://tools.ietf.org/html/rfc5737>`__ reserved address):

.. code:: json

   [
     {
       "addednode": "192.0.2.113:19999",
       "connected": true,
       "addresses": [
         {
           "address": "192.0.2.113:19999",
           "connected": "outbound"
         }
       ]
     }
   ]

*See also*

-  `AddNode </docs/core-api-ref-remote-procedure-calls-network#addnode>`__:
   attempts to add or remove a node from the addnode list, or to try a
   connection to a node once.
-  `GetPeerInfo </docs/core-api-ref-remote-procedure-calls-network#getpeerinfo>`__:
   returns data about each connected network node.

GetConnectionCount
==================

The ```getconnectioncount``
RPC <core-api-ref-remote-procedure-calls-network#getconnectioncount>`__
returns the number of connections to other nodes.

*Parameters: none*

*Result—the number of connections to other nodes*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | number (int)    | R               | The total       |
|                 |                 | equired(exactly | number of       |
|                 |                 | 1)              | connections to  |
|                 |                 |                 | other nodes     |
|                 |                 |                 | (both inbound   |
|                 |                 |                 | and outbound)   |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet getconnectioncount

Result:

.. code:: text

   14

*See also*

-  `GetNetTotals </docs/core-api-ref-remote-procedure-calls-network#getnettotals>`__:
   returns information about network traffic, including bytes in, bytes
   out, and the current time.
-  `GetPeerInfo </docs/core-api-ref-remote-procedure-calls-network#getpeerinfo>`__:
   returns data about each connected network node.
-  `GetNetworkInfo </docs/core-api-ref-remote-procedure-calls-network#getnetworkinfo>`__:
   returns information about the node’s connection to the network.

GetNodeAddresses
================

The ```getnodeaddresses``
RPC <core-api-ref-remote-procedure-calls-network#getnodeaddresses>`__
returns the known addresses which can potentially be used to find new
nodes in the network.

*Parameter #1—count*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``count``       | number (int)    | Optional(0 or   | The number of   |
|                 |                 | 1)              | addresses to    |
|                 |                 |                 | return. Limited |
|                 |                 |                 | to the smaller  |
|                 |                 |                 | of 2500 or 23%  |
|                 |                 |                 | of all known    |
|                 |                 |                 | addresses       |
|                 |                 |                 | (default = 1).  |
+-----------------+-----------------+-----------------+-----------------+

*Result—the current bytes in, bytes out, and current time*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | An array        |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | information     |
|                 |                 |                 | about the known |
|                 |                 |                 | addresses.      |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``time``     | number (int)    | R               | The epoch time  |
|                 |                 | equired(exactly | of when the     |
|                 |                 | 1)              | node was last   |
|                 |                 |                 | seen (in Unix)  |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``services`` | number (int)    | R               | The services    |
|                 |                 | equired(exactly | offered         |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``address``  | string          | R               | The address of  |
|                 |                 | equired(exactly | the node        |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``port``     | number (int)    | R               | The port of the |
|                 |                 | equired(exactly | node            |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

.. code:: bash

   dash-cli -testnet getnodeaddresses

Result:

.. code:: json

   [
     {
       "time": 1634187034,
       "services": 1029,
       "address": "34.214.102.160",
       "port": 19999
     }
   ]

GetNetTotals
============

The ```getnettotals``
RPC <core-api-ref-remote-procedure-calls-network#getnettotals>`__
returns information about network traffic, including bytes in, bytes
out, and the current time.

*Parameters: none*

*Result—the current bytes in, bytes out, and current time*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An object       |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | information     |
|                 |                 |                 | about the       |
|                 |                 |                 | node’s network  |
|                 |                 |                 | totals          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``t          | number (int)    | R               | The total       |
| otalbytesrecv`` |                 | equired(exactly | number of bytes |
|                 |                 | 1)              | received since  |
|                 |                 |                 | the node was    |
|                 |                 |                 | last restarted  |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``t          | number (int)    | R               | The total       |
| otalbytessent`` |                 | equired(exactly | number of bytes |
|                 |                 | 1)              | sent since the  |
|                 |                 |                 | node was last   |
|                 |                 |                 | restarted       |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (int)    | R               | Unix epoch time |
|  ``timemillis`` |                 | equired(exactly | in milliseconds |
|                 |                 | 1)              | according to    |
|                 |                 |                 | the operating   |
|                 |                 |                 | system’s clock  |
|                 |                 |                 | (not the node   |
|                 |                 |                 | adjusted time)  |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | string : object | R               | The upload      |
| `uploadtarget`` |                 | equired(exactly | target          |
|                 |                 | 1)              | information     |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | Length of the   |
| →               |                 | equired(exactly | measuring       |
| \ ``timeframe`` |                 | 1)              | timeframe in    |
|                 |                 |                 | seconds         |
|                 |                 |                 | (currently set  |
|                 |                 |                 | to ``24``       |
|                 |                 |                 | hours)          |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``target`` | number (int)    | R               | The maximum     |
|                 |                 | equired(exactly | allowed         |
|                 |                 | 1)              | outbound        |
|                 |                 |                 | traffic in      |
|                 |                 |                 | bytes (default  |
|                 |                 |                 | is ``0``). Can  |
|                 |                 |                 | be changed with |
|                 |                 |                 | ``-ma           |
|                 |                 |                 | xuploadtarget`` |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | R               | Indicates if    |
| →\ ``t          |                 | equired(exactly | the target is   |
| arget_reached`` |                 | 1)              | reached. If the |
|                 |                 |                 | target is       |
|                 |                 |                 | reached the     |
|                 |                 |                 | node won’t      |
|                 |                 |                 | serve SPV and   |
|                 |                 |                 | historical      |
|                 |                 |                 | block requests  |
|                 |                 |                 | anymore         |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | R               | Indicates if    |
| →\ ``serve_hist |                 | equired(exactly | historical      |
| orical_blocks`` |                 | 1)              | blocks are      |
|                 |                 |                 | served          |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | Amount of bytes |
| →\ ``bytes_     |                 | equired(exactly | left in current |
| left_in_cycle`` |                 | 1)              | time cycle.     |
|                 |                 |                 | ``0`` is        |
|                 |                 |                 | displayed if no |
|                 |                 |                 | upload target   |
|                 |                 |                 | is set          |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | Seconds left in |
| →\ ``time_      |                 | equired(exactly | current time    |
| left_in_cycle`` |                 | 1)              | cycle. ``0`` is |
|                 |                 |                 | displayed if no |
|                 |                 |                 | upload target   |
|                 |                 |                 | is set          |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli getnettotals

Result:

.. code:: json

   {
     "totalbytesrecv": 4661588,
     "totalbytessent": 2899423,
     "timemillis": 1507815162756,
     "uploadtarget": {
       "timeframe": 86400,
       "target": 0,
       "target_reached": false,
       "serve_historical_blocks": true,
       "bytes_left_in_cycle": 0,
       "time_left_in_cycle": 0
     }
   }

*See also*

-  `GetNetworkInfo </docs/core-api-ref-remote-procedure-calls-network#getnetworkinfo>`__:
   returns information about the node’s connection to the network.
-  `GetPeerInfo </docs/core-api-ref-remote-procedure-calls-network#getpeerinfo>`__:
   returns data about each connected network node.

GetNetworkInfo
==============

The ```getnetworkinfo``
RPC <core-api-ref-remote-procedure-calls-network#getnetworkinfo>`__
returns information about the node’s connection to the network.

*Parameters: none*

*Result—information about the node’s connection to the network*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | Information     |
|                 |                 | equired(exactly | about this      |
|                 |                 | 1)              | node’s          |
|                 |                 |                 | connection to   |
|                 |                 |                 | the network     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``version``  | number          | R               | This node’s     |
|                 |                 | equired(exactly | version of Dash |
|                 |                 | 1)              | Core in its     |
|                 |                 |                 | internal        |
|                 |                 |                 | integer format. |
|                 |                 |                 | For example,    |
|                 |                 |                 | Dash Core       |
|                 |                 |                 | 0.12.2 has the  |
|                 |                 |                 | integer version |
|                 |                 |                 | number 120200   |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | string          | R               | The node’s      |
| `buildversion`` |                 | equired(exactly | build version   |
|                 |                 | 1)              | including RC    |
|                 |                 |                 | info or commit  |
|                 |                 |                 | as relevant     |
+-----------------+-----------------+-----------------+-----------------+
| →\              | string          | R               | The user agent  |
|  ``subversion`` |                 | equired(exactly | this node sends |
|                 |                 | 1)              | in its          |
|                 |                 |                 | ```version``    |
|                 |                 |                 | message <core   |
|                 |                 |                 | -ref-p2p-networ |
|                 |                 |                 | k-control-messa |
|                 |                 |                 | ges#version>`__ |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``pr         | number (int)    | R               | The protocol    |
| otocolversion`` |                 | equired(exactly | version number  |
|                 |                 | 1)              | used by this    |
|                 |                 |                 | node. See the   |
|                 |                 |                 | `protocol       |
|                 |                 |                 | versions        |
|                 |                 |                 | sectio          |
|                 |                 |                 | n <core-ref-p2p |
|                 |                 |                 | -network-protoc |
|                 |                 |                 | ol-versions>`__ |
|                 |                 |                 | for more        |
|                 |                 |                 | information     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | string (hex)    | R               | The services    |
| localservices`` |                 | equired(exactly | supported by    |
|                 |                 | 1)              | this node as    |
|                 |                 |                 | advertised in   |
|                 |                 |                 | its             |
|                 |                 |                 | ```version``    |
|                 |                 |                 | message <core   |
|                 |                 |                 | -ref-p2p-networ |
|                 |                 |                 | k-control-messa |
|                 |                 |                 | ges#version>`__ |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``local      | array           | R               | **Added in Dash |
| servicesnames`` |                 | equired(exactly | Core            |
|                 |                 | 1)              | 18.0.0**\ An    |
|                 |                 |                 | array of        |
|                 |                 |                 | strings         |
|                 |                 |                 | describing the  |
|                 |                 |                 | services        |
|                 |                 |                 | offered, in     |
|                 |                 |                 | human-readable  |
|                 |                 |                 | form.           |
+-----------------+-----------------+-----------------+-----------------+
| → →SERVICE_NAME | string          | R               | The service     |
|                 |                 | equired(exactly | name.           |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\              | bool            | R               | *Added in       |
|  ``localrelay`` |                 | equired(exactly | Bitcoin Core    |
|                 |                 | 1)              | 0.13.0*\ The    |
|                 |                 |                 | services        |
|                 |                 |                 | supported by    |
|                 |                 |                 | this node as    |
|                 |                 |                 | advertised in   |
|                 |                 |                 | its             |
|                 |                 |                 | ```version``    |
|                 |                 |                 | message <core   |
|                 |                 |                 | -ref-p2p-networ |
|                 |                 |                 | k-control-messa |
|                 |                 |                 | ges#version>`__ |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (int)    | R               | The offset of   |
|  ``timeoffset`` |                 | equired(exactly | the node’s      |
|                 |                 | 1)              | clock from the  |
|                 |                 |                 | computer’s      |
|                 |                 |                 | clock (both in  |
|                 |                 |                 | UTC) in         |
|                 |                 |                 | seconds. The    |
|                 |                 |                 | offset may be   |
|                 |                 |                 | up to 4200      |
|                 |                 |                 | seconds (70     |
|                 |                 |                 | minutes)        |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | bool            | R               | Set to ``true`` |
| networkactive`` |                 | equired(exactly | if P2P          |
|                 |                 | 1)              | networking is   |
|                 |                 |                 | enabled. Set to |
|                 |                 |                 | ``false`` if    |
|                 |                 |                 | P2P networking  |
|                 |                 |                 | is disabled.    |
|                 |                 |                 | Ena             |
|                 |                 |                 | bling/disabling |
|                 |                 |                 | done via        |
|                 |                 |                 | `SetNetworkAct  |
|                 |                 |                 | ive </docs/core |
|                 |                 |                 | -api-ref-remote |
|                 |                 |                 | -procedure-call |
|                 |                 |                 | s-network#setne |
|                 |                 |                 | tworkactive>`__ |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (int)    | R               | The total       |
| ``connections`` |                 | equired(exactly | number of open  |
|                 |                 | 1)              | connections     |
|                 |                 |                 | (both outgoing  |
|                 |                 |                 | and incoming)   |
|                 |                 |                 | between this    |
|                 |                 |                 | node and other  |
|                 |                 |                 | nodes           |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | string          | R               | **Added in Dash |
| `socketevents`` |                 | equired(exactly | Core            |
|                 |                 | 1)              | 0.16.0**\ The   |
|                 |                 |                 | socket events   |
|                 |                 |                 | mode, either    |
|                 |                 |                 | ``epoll``,      |
|                 |                 |                 | ``poll``, or    |
|                 |                 |                 | ``select``      |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``networks`` | array           | R               | An array with   |
|                 |                 | equired(exactly | three objects:  |
|                 |                 | 1)              | one describing  |
|                 |                 |                 | the IPv4        |
|                 |                 |                 | connection, one |
|                 |                 |                 | describing the  |
|                 |                 |                 | IPv6            |
|                 |                 |                 | connection, and |
|                 |                 |                 | one describing  |
|                 |                 |                 | the Tor hidden  |
|                 |                 |                 | service (onion) |
|                 |                 |                 | connection      |
+-----------------+-----------------+-----------------+-----------------+
| → →Network      | object          | Optional(0 to   | An object       |
|                 |                 | 3)              | describing a    |
|                 |                 |                 | network. If the |
|                 |                 |                 | network is      |
|                 |                 |                 | unroutable, it  |
|                 |                 |                 | will not be     |
|                 |                 |                 | returned        |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``name`` | string          | R               | The name of the |
|                 |                 | equired(exactly | network. Either |
|                 |                 | 1)              | ``ipv4``,       |
|                 |                 |                 | ``ipv6``, or    |
|                 |                 |                 | ``onion``       |
+-----------------+-----------------+-----------------+-----------------+
| → →             | bool            | R               | Set to ``true`` |
| →\ ``limited``  |                 | equired(exactly | if only         |
|                 |                 | 1)              | connections to  |
|                 |                 |                 | this network    |
|                 |                 |                 | are allowed     |
|                 |                 |                 | according to    |
|                 |                 |                 | the             |
|                 |                 |                 | ``-onlynet``    |
|                 |                 |                 | Dash Core       |
|                 |                 |                 | c               |
|                 |                 |                 | ommand-line/con |
|                 |                 |                 | figuration-file |
|                 |                 |                 | parameter.      |
|                 |                 |                 | Otherwise set   |
|                 |                 |                 | to ``false``    |
+-----------------+-----------------+-----------------+-----------------+
| → →             | bool            | R               | Set to ``true`` |
| →               |                 | equired(exactly | if connections  |
| \ ``reachable`` |                 | 1)              | can be made to  |
|                 |                 |                 | or from this    |
|                 |                 |                 | network.        |
|                 |                 |                 | Otherwise set   |
|                 |                 |                 | to ``false``    |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | R               | The hostname    |
| →\ ``proxy``    |                 | equired(exactly | and port of any |
|                 |                 | 1)              | proxy being     |
|                 |                 |                 | used for this   |
|                 |                 |                 | network. If a   |
|                 |                 |                 | proxy is not in |
|                 |                 |                 | use, an empty   |
|                 |                 |                 | string          |
+-----------------+-----------------+-----------------+-----------------+
| → →             | bool            | R               | *Added in       |
| →\ `            |                 | equired(exactly | Bitcoin Core    |
| `proxy_randomiz |                 | 1)              | 0.11.0*\ Set to |
| e_credentials`` |                 |                 | ``true`` if     |
|                 |                 |                 | randomized      |
|                 |                 |                 | credentials are |
|                 |                 |                 | set for this    |
|                 |                 |                 | proxy.          |
|                 |                 |                 | Otherwise set   |
|                 |                 |                 | to ``false``    |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``relayfee`` | number (DASH)   | R               | The minimum     |
|                 |                 | equired(exactly | relay fee per   |
|                 |                 | 1)              | kilobyte for    |
|                 |                 |                 | transactions in |
|                 |                 |                 | order for this  |
|                 |                 |                 | node to accept  |
|                 |                 |                 | it into its     |
|                 |                 |                 | memory pool     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``i          | number (DASH)   | R               | *Added in Dash  |
| ncrementalfee`` |                 | equired(exactly | Core            |
|                 |                 | 1)              | 0.12.3*\ The    |
|                 |                 |                 | minimum fee     |
|                 |                 |                 | increment for   |
|                 |                 |                 | mempool         |
|                 |                 |                 | limiting or BIP |
|                 |                 |                 | 125 replacement |
|                 |                 |                 | in DASH/kB      |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``l          | array           | R               | An array of     |
| ocaladdresses`` |                 | equired(exactly | objects each    |
|                 |                 | 1)              | describing the  |
|                 |                 |                 | local addresses |
|                 |                 |                 | this node       |
|                 |                 |                 | believes it     |
|                 |                 |                 | listens on      |
+-----------------+-----------------+-----------------+-----------------+
| → →Address      | object          | Optional(0 or   | An object       |
|                 |                 | more)           | describing a    |
|                 |                 |                 | particular      |
|                 |                 |                 | address this    |
|                 |                 |                 | node believes   |
|                 |                 |                 | it listens on   |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | R               | An IP address   |
| →\ ``address``  |                 | equired(exactly | or .onion       |
|                 |                 | 1)              | address this    |
|                 |                 |                 | node believes   |
|                 |                 |                 | it listens on.  |
|                 |                 |                 | This may be     |
|                 |                 |                 | manually        |
|                 |                 |                 | configured,     |
|                 |                 |                 | auto detected,  |
|                 |                 |                 | or based on     |
|                 |                 |                 | ```version``    |
|                 |                 |                 | messages <core  |
|                 |                 |                 | -ref-p2p-networ |
|                 |                 |                 | k-control-messa |
|                 |                 |                 | ges#version>`__ |
|                 |                 |                 | this node       |
|                 |                 |                 | received from   |
|                 |                 |                 | its peers       |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``port`` | number (int)    | R               | The port number |
|                 |                 | equired(exactly | this node       |
|                 |                 | 1)              | believes it     |
|                 |                 |                 | listens on for  |
|                 |                 |                 | the associated  |
|                 |                 |                 | ``address``.    |
|                 |                 |                 | This may be     |
|                 |                 |                 | manually        |
|                 |                 |                 | configured,     |
|                 |                 |                 | auto detected,  |
|                 |                 |                 | or based on     |
|                 |                 |                 | ```version``    |
|                 |                 |                 | messages <core  |
|                 |                 |                 | -ref-p2p-networ |
|                 |                 |                 | k-control-messa |
|                 |                 |                 | ges#version>`__ |
|                 |                 |                 | this node       |
|                 |                 |                 | received from   |
|                 |                 |                 | its peers       |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (int)    | R               | The number of   |
| →\ ``score``    |                 | equired(exactly | incoming        |
|                 |                 | 1)              | connections     |
|                 |                 |                 | during the      |
|                 |                 |                 | uptime of this  |
|                 |                 |                 | node that have  |
|                 |                 |                 | used this       |
|                 |                 |                 | ``address`` in  |
|                 |                 |                 | their           |
|                 |                 |                 | ```version``    |
|                 |                 |                 | message <core   |
|                 |                 |                 | -ref-p2p-networ |
|                 |                 |                 | k-control-messa |
|                 |                 |                 | ges#version>`__ |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``warnings`` | string          | R               | *Added in       |
|                 |                 | equired(exactly | Bitcoin Core    |
|                 |                 | 1)              | 0.11.0*\ A      |
|                 |                 |                 | plain-text      |
|                 |                 |                 | description of  |
|                 |                 |                 | any network     |
|                 |                 |                 | warnings. If    |
|                 |                 |                 | there are no    |
|                 |                 |                 | warnings, an    |
|                 |                 |                 | empty string    |
|                 |                 |                 | will be         |
|                 |                 |                 | returned.       |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

.. code:: bash

   dash-cli getnetworkinfo

Result (actual addresses have been replaced with
`RFC5737 <http://tools.ietf.org/html/rfc5737>`__ reserved addresses):

.. code:: json

   {
     "version": 170003,
     "buildversion": "v0.17.0.3-649273e70",
     "subversion": "/Dash Core:0.17.0.3/",
     "protocolversion": 70220,
     "localservices": "0000000000000445",
     "localservicesnames": [
       "NETWORK",
       "BLOOM",
       "COMPACT_FILTERS",
       "NETWORK_LIMITED"
     ],
     "localrelay": true,
     "timeoffset": 0,
     "networkactive": true,
     "connections": 8,
     "socketevents": "epoll",
     "networks": [
       {
         "name": "ipv4",
         "limited": false,
         "reachable": true,
         "proxy": "",
         "proxy_randomize_credentials": false
       },
       {
         "name": "ipv6",
         "limited": false,
         "reachable": true,
         "proxy": "",
         "proxy_randomize_credentials": false
       },
       {
         "name": "onion",
         "limited": true,
         "reachable": false,
         "proxy": "",
         "proxy_randomize_credentials": false
       },
       {
         "name": "",
         "limited": false,
         "reachable": true,
         "proxy": "",
         "proxy_randomize_credentials": false
       },
       {
         "name": "",
         "limited": false,
         "reachable": true,
         "proxy": "",
         "proxy_randomize_credentials": false
       }
     ],
     "relayfee": 0.00001000,
     "incrementalfee": 0.00001000,
     "localaddresses": [
     ],
     "warnings": "Warning: unknown new rules activated (versionbit 3)"
   }

*See also*

-  `GetPeerInfo </docs/core-api-ref-remote-procedure-calls-network#getpeerinfo>`__:
   returns data about each connected network node.
-  `GetNetTotals </docs/core-api-ref-remote-procedure-calls-network#getnettotals>`__:
   returns information about network traffic, including bytes in, bytes
   out, and the current time.
-  `SetNetworkActive </docs/core-api-ref-remote-procedure-calls-network#setnetworkactive>`__:
   disables/enables all P2P network activity.

GetPeerInfo
===========

The ```getpeerinfo``
RPC <core-api-ref-remote-procedure-calls-network#getpeerinfo>`__ returns
data about each connected network node.

*Parameters: none*

*Result—information about each currently-connected network node*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | An array of     |
|                 |                 | equired(exactly | objects each    |
|                 |                 | 1)              | describing one  |
|                 |                 |                 | connected node. |
|                 |                 |                 | If there are no |
|                 |                 |                 | connections,    |
|                 |                 |                 | the array will  |
|                 |                 |                 | be empty        |
+-----------------+-----------------+-----------------+-----------------+
| →Node           | object          | Optional(0 or   | An object       |
|                 |                 | more)           | describing a    |
|                 |                 |                 | particular      |
|                 |                 |                 | connected node  |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``id``     | number (int)    | R               | The node’s      |
|                 |                 | equired(exactly | index number in |
|                 |                 | 1)              | the local node  |
|                 |                 |                 | address         |
|                 |                 |                 | database        |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``addr``   | string          | R               | The IP address  |
|                 |                 | equired(exactly | and port number |
|                 |                 | 1)              | used for the    |
|                 |                 |                 | connection to   |
|                 |                 |                 | the remote node |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | Optional(0 or   | Our IP address  |
| →               |                 | 1)              | and port number |
| \ ``addrlocal`` |                 |                 | according to    |
|                 |                 |                 | the remote      |
|                 |                 |                 | node. May be    |
|                 |                 |                 | incorrect due   |
|                 |                 |                 | to error or     |
|                 |                 |                 | lying. Most SPV |
|                 |                 |                 | nodes set this  |
|                 |                 |                 | to              |
|                 |                 |                 | ``1             |
|                 |                 |                 | 27.0.0.1:9999`` |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | Optional(0 or   | **Added in Dash |
| →               |                 | 1)              | Core            |
| \ ``mapped_as`` |                 |                 | 18.0.0**\ The   |
|                 |                 |                 | AS in the BGP   |
|                 |                 |                 | route to the    |
|                 |                 |                 | peer used for   |
|                 |                 |                 | diversifying    |
|                 |                 |                 | peer selection  |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | Optional(0 or   | Bind address of |
| →\ ``addrbind`` |                 | 1)              | the connection  |
|                 |                 |                 | to the peer     |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | The services    |
| →\ ``services`` |                 | equired(exactly | advertised by   |
|                 |                 | 1)              | the remote node |
|                 |                 |                 | in its          |
|                 |                 |                 | ```version``    |
|                 |                 |                 | message <core   |
|                 |                 |                 | -ref-p2p-networ |
|                 |                 |                 | k-control-messa |
|                 |                 |                 | ges#version>`__ |
+-----------------+-----------------+-----------------+-----------------+
| →               | array           | R               | **Added in Dash |
| →\ ``           |                 | equired(exactly | Core            |
| servicesnames`` |                 | 1)              | 18.0.0**\ An    |
|                 |                 |                 | array of        |
|                 |                 |                 | strings         |
|                 |                 |                 | describing the  |
|                 |                 |                 | services        |
|                 |                 |                 | offered, in     |
|                 |                 |                 | human-readable  |
|                 |                 |                 | form.           |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | R               | The service     |
| →SERVICE_NAME   |                 | equired(exactly | name if it is   |
|                 |                 | 1)              | recognised.     |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | Optional(0 or   | The ProRegTx of |
| →\ ``verified_  |                 | 1)              | the masternode  |
| proregtx_hash`` |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | Optional(0 or   | The hashed      |
| →\ ``verifie    |                 | 1)              | operator public |
| d_pubkey_hash`` |                 |                 | key of the      |
|                 |                 |                 | masternode      |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | The Unix epoch  |
| →\ ``lastsend`` |                 | equired(exactly | time when we    |
|                 |                 | 1)              | last            |
|                 |                 |                 | successfully    |
|                 |                 |                 | sent data to    |
|                 |                 |                 | the TCP socket  |
|                 |                 |                 | for this node   |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | The Unix epoch  |
| →\ ``lastrecv`` |                 | equired(exactly | time when we    |
|                 |                 | 1)              | last received   |
|                 |                 |                 | data from this  |
|                 |                 |                 | node            |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | The total       |
| →               |                 | equired(exactly | number of bytes |
| \ ``bytessent`` |                 | 1)              | we’ve sent to   |
|                 |                 |                 | this node       |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | The total       |
| →               |                 | equired(exactly | number of bytes |
| \ ``bytesrecv`` |                 | 1)              | we’ve received  |
|                 |                 |                 | from this node  |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | The Unix epoch  |
| →\ ``conntime`` |                 | equired(exactly | time when we    |
|                 |                 | 1)              | connected to    |
|                 |                 |                 | this node       |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | *Added in       |
| →\              |                 | equired(exactly | Bitcoin Core    |
|  ``timeoffset`` |                 | 1)              | 0.12.0*\ The    |
|                 |                 |                 | time offset in  |
|                 |                 |                 | seconds         |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (real)   | R               | The number of   |
| →\ ``pingtime`` |                 | equired(exactly | seconds this    |
|                 |                 | 1)              | node took to    |
|                 |                 |                 | respond to our  |
|                 |                 |                 | last P2P        |
|                 |                 |                 | ```ping``       |
|                 |                 |                 | message <c      |
|                 |                 |                 | ore-ref-p2p-net |
|                 |                 |                 | work-control-me |
|                 |                 |                 | ssages#ping>`__ |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (real)   | Optional(0 or   | *Updated in     |
| →\ ``minping``  |                 | 1)              | Bitcoin Core    |
|                 |                 |                 | 0.13.0*\ The    |
|                 |                 |                 | minimum         |
|                 |                 |                 | observed ping   |
|                 |                 |                 | time (if any at |
|                 |                 |                 | all)            |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (real)   | Optional(0 or   | The number of   |
| →\ ``pingwait`` |                 | 1)              | seconds we’ve   |
|                 |                 |                 | been waiting    |
|                 |                 |                 | for this node   |
|                 |                 |                 | to respond to a |
|                 |                 |                 | P2P ```ping``   |
|                 |                 |                 | message <co     |
|                 |                 |                 | re-ref-p2p-netw |
|                 |                 |                 | ork-control-mes |
|                 |                 |                 | sages#ping>`__. |
|                 |                 |                 | Only shown if   |
|                 |                 |                 | there’s an      |
|                 |                 |                 | outstanding     |
|                 |                 |                 | ```ping``       |
|                 |                 |                 | message <c      |
|                 |                 |                 | ore-ref-p2p-net |
|                 |                 |                 | work-control-me |
|                 |                 |                 | ssages#ping>`__ |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | The protocol    |
| →\ ``version``  |                 | equired(exactly | version number  |
|                 |                 | 1)              | used by this    |
|                 |                 |                 | node. See the   |
|                 |                 |                 | `protocol       |
|                 |                 |                 | versions        |
|                 |                 |                 | sectio          |
|                 |                 |                 | n <core-ref-p2p |
|                 |                 |                 | -network-protoc |
|                 |                 |                 | ol-versions>`__ |
|                 |                 |                 | for more        |
|                 |                 |                 | information     |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``subver`` | string          | R               | The user agent  |
|                 |                 | equired(exactly | this node sends |
|                 |                 | 1)              | in its          |
|                 |                 |                 | ```version``    |
|                 |                 |                 | message <core-  |
|                 |                 |                 | ref-p2p-network |
|                 |                 |                 | -control-messag |
|                 |                 |                 | es#version>`__. |
|                 |                 |                 | This string     |
|                 |                 |                 | will have been  |
|                 |                 |                 | sanitized to    |
|                 |                 |                 | prevent         |
|                 |                 |                 | corrupting the  |
|                 |                 |                 | JSON results.   |
|                 |                 |                 | May be an empty |
|                 |                 |                 | string          |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | R               | Set to ``true`` |
| →\ ``inbound``  |                 | equired(exactly | if this node    |
|                 |                 | 1)              | connected to us |
|                 |                 |                 | (inbound); set  |
|                 |                 |                 | to ``false`` if |
|                 |                 |                 | we connected to |
|                 |                 |                 | this node       |
|                 |                 |                 | (outbound)      |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | R               | Set to ``true`` |
| →\ ``addnode``  |                 | equired(exactly | if this node    |
|                 |                 | 1)              | was added via   |
|                 |                 |                 | the             |
|                 |                 |                 | ```addnode``    |
|                 |                 |                 | R               |
|                 |                 |                 | PC <core-api-re |
|                 |                 |                 | f-remote-proced |
|                 |                 |                 | ure-calls-netwo |
|                 |                 |                 | rk#addnode>`__. |
+-----------------+-----------------+-----------------+-----------------+
| →               | bool            | R               | *Added in Dash  |
| →\              |                 | equired(exactly | Core            |
|  ``masternode`` |                 | 1)              | 0               |
|                 |                 |                 | .16.0*\ Whether |
|                 |                 |                 | connection was  |
|                 |                 |                 | due to          |
|                 |                 |                 | masternode      |
|                 |                 |                 | connection      |
|                 |                 |                 | attempt         |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | The height of   |
| →\ ``s          |                 | equired(exactly | the remote      |
| tartingheight`` |                 | 1)              | node’s block    |
|                 |                 |                 | chain when it   |
|                 |                 |                 | connected to us |
|                 |                 |                 | as reported in  |
|                 |                 |                 | its             |
|                 |                 |                 | ```version``    |
|                 |                 |                 | message <core   |
|                 |                 |                 | -ref-p2p-networ |
|                 |                 |                 | k-control-messa |
|                 |                 |                 | ges#version>`__ |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | The ban score   |
| →\ ``banscore`` |                 | equired(exactly | we’ve assigned  |
|                 |                 | 1)              | the node based  |
|                 |                 |                 | on any          |
|                 |                 |                 | misbehavior     |
|                 |                 |                 | it’s made. By   |
|                 |                 |                 | default, Dash   |
|                 |                 |                 | Core            |
|                 |                 |                 | disconnects     |
|                 |                 |                 | when the ban    |
|                 |                 |                 | score reaches   |
|                 |                 |                 | ``100``         |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | The             |
| →\ ``s          |                 | equired(exactly | highest-height  |
| ynced_headers`` |                 | 1)              | header we have  |
|                 |                 |                 | in common with  |
|                 |                 |                 | this node based |
|                 |                 |                 | the last P2P    |
|                 |                 |                 | ```headers``    |
|                 |                 |                 | message <c      |
|                 |                 |                 | ore-ref-p2p-net |
|                 |                 |                 | work-data-messa |
|                 |                 |                 | ges#headers>`__ |
|                 |                 |                 | it sent us. If  |
|                 |                 |                 | a ```headers``  |
|                 |                 |                 | message <c      |
|                 |                 |                 | ore-ref-p2p-net |
|                 |                 |                 | work-data-messa |
|                 |                 |                 | ges#headers>`__ |
|                 |                 |                 | has not been    |
|                 |                 |                 | received, this  |
|                 |                 |                 | will be set to  |
|                 |                 |                 | ``-1``          |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | The             |
| →\ ``           |                 | equired(exactly | highest-height  |
| synced_blocks`` |                 | 1)              | block we have   |
|                 |                 |                 | in common with  |
|                 |                 |                 | this node based |
|                 |                 |                 | on P2P ```inv`` |
|                 |                 |                 | message         |
|                 |                 |                 | s <core-ref-p2p |
|                 |                 |                 | -network-data-m |
|                 |                 |                 | essages#inv>`__ |
|                 |                 |                 | this node sent  |
|                 |                 |                 | us. If no block |
|                 |                 |                 | ```inv``        |
|                 |                 |                 | message         |
|                 |                 |                 | s <core-ref-p2p |
|                 |                 |                 | -network-data-m |
|                 |                 |                 | essages#inv>`__ |
|                 |                 |                 | have been       |
|                 |                 |                 | received from   |
|                 |                 |                 | this node, this |
|                 |                 |                 | will be set to  |
|                 |                 |                 | ``-1``          |
+-----------------+-----------------+-----------------+-----------------+
| →               | array           | R               | An array of     |
| →\ ``inflight`` |                 | equired(exactly | blocks which    |
|                 |                 | 1)              | have been       |
|                 |                 |                 | requested from  |
|                 |                 |                 | this peer. May  |
|                 |                 |                 | be empty        |
+-----------------+-----------------+-----------------+-----------------+
| → → →Blocks     | number (int)    | Optional(0 or   | The height of a |
|                 |                 | more)           | block being     |
|                 |                 |                 | requested from  |
|                 |                 |                 | the remote peer |
+-----------------+-----------------+-----------------+-----------------+
| \* →            | bool            | R               | Set to ``true`` |
| →\              |                 | equired(exactly | if the remote   |
| ``whitelisted`` |                 | 1)              | peer has been   |
|                 |                 |                 | whitelisted;    |
|                 |                 |                 | otherwise, set  |
|                 |                 |                 | to ``false``.   |
|                 |                 |                 | Whitelisted     |
|                 |                 |                 | peers will not  |
|                 |                 |                 | be banned if    |
|                 |                 |                 | their ban score |
|                 |                 |                 | exceeds the     |
|                 |                 |                 | maximum (100 by |
|                 |                 |                 | default). By    |
|                 |                 |                 | default, peers  |
|                 |                 |                 | connecting from |
|                 |                 |                 | localhost are   |
|                 |                 |                 | whitelisted     |
+-----------------+-----------------+-----------------+-----------------+
| →               | array           | R               | **Added in Dash |
| →\              |                 | equired(exactly | Core            |
| ``permissions`` |                 | 1)              | 18.0.0**\ Any   |
|                 |                 |                 | special         |
|                 |                 |                 | permissions     |
|                 |                 |                 | that have been  |
|                 |                 |                 | granted to this |
|                 |                 |                 | peer            |
+-----------------+-----------------+-----------------+-----------------+
| →               | string : object | R               | *Added in       |
| →\ ``byte       |                 | equired(exactly | Bitcoin Core    |
| ssent_per_msg`` |                 | 1)              | 0.13.           |
|                 |                 |                 | 0*\ Information |
|                 |                 |                 | about total     |
|                 |                 |                 | sent bytes      |
|                 |                 |                 | aggregated by   |
|                 |                 |                 | message type    |
+-----------------+-----------------+-----------------+-----------------+
| → → →Message    | number (int)    | Required(1 or   | Total sent      |
| Type            |                 | more)           | bytes           |
|                 |                 |                 | aggregated by   |
|                 |                 |                 | message type.   |
|                 |                 |                 | One field for   |
|                 |                 |                 | every used      |
|                 |                 |                 | message type    |
+-----------------+-----------------+-----------------+-----------------+
| →               | string : object | R               | *Added in       |
| →\ ``byte       |                 | equired(exactly | Bitcoin Core    |
| srecv_per_msg`` |                 | 1)              | 0.13.           |
|                 |                 |                 | 0*\ Information |
|                 |                 |                 | about total     |
|                 |                 |                 | received bytes  |
|                 |                 |                 | aggregated by   |
|                 |                 |                 | message type    |
+-----------------+-----------------+-----------------+-----------------+
| → → →Message    | number (int)    | Required(1 or   | Total received  |
| Type            |                 | more)           | bytes           |
|                 |                 |                 | aggregated by   |
|                 |                 |                 | message type.   |
|                 |                 |                 | One field for   |
|                 |                 |                 | every used      |
|                 |                 |                 | message type    |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

.. code:: bash

   dash-cli -testnet getpeerinfo

Result (edited to show only a single entry, with IP addresses changed to
`RFC5737 <http://tools.ietf.org/html/rfc5737>`__ reserved IP addresses):

.. code:: json

   [
     {
       "id": 28,
       "addr": "34.217.98.54:19999",
       "addrlocal": "99.235.23.127:56865",
       "addrbind": "10.0.0.111:56865",
       "services": "0000000000000405",
       "servicesnames": [
         "NETWORK",
         "BLOOM",
         "NETWORK_LIMITED"
       ],
       "relaytxes": true,
       "lastsend": 1634805868,
       "lastrecv": 1634805868,
       "bytessent": 71058,
       "bytesrecv": 115054,
       "conntime": 1634801665,
       "timeoffset": 0,
       "pingtime": 0.092595,
       "minping": 0.083287,
       "version": 70219,
       "subver": "/Dash Core:0.17.0.3/",
       "inbound": false,
       "addnode": false,
       "masternode": false,
       "startingheight": 598074,
       "banscore": 0,
       "synced_headers": 598106,
       "synced_blocks": 598106,
       "inflight": [
       ],
       "whitelisted": false,
       "permissions": [
       ],
       "bytessent_per_msg": {
         "addr": 110,
         "dsq": 65280,
         "getaddr": 24,
         "getdata": 1045,
         "getheaders": 1053,
         "getsporks": 24,
         "govsync": 66,
         "headers": 717,
         "inv": 341,
         "mempool": 24,
         "ping": 1024,
         "pong": 1024,
         "sendaddrv2": 24,
         "sendcmpct": 66,
         "senddsq": 25,
         "sendheaders": 24,
         "verack": 24,
         "version": 163
       },
       "bytesrecv_per_msg": {
         "addr": 11272,
         "block": 3104,
         "clsig": 780,
         "cmpctblock": 10012,
         "dsq": 79730,
         "getheaders": 1053,
         "headers": 754,
         "inv": 2745,
         "islock": 378,
         "mnauth": 152,
         "notfound": 305,
         "ping": 1024,
         "pong": 1024,
         "sendcmpct": 33,
         "senddsq": 25,
         "sendheaders": 24,
         "spork": 2420,
         "ssc": 32,
         "verack": 24,
         "version": 163
       }
     }
   ]

*See also*

-  `GetAddedNodeInfo </docs/core-api-ref-remote-procedure-calls-network#getaddednodeinfo>`__:
   returns information about the given added node, or all added nodes
   (except onetry nodes). Only nodes which have been manually added
   using the ```addnode``
   RPC <core-api-ref-remote-procedure-calls-network#addnode>`__ will
   have their information displayed.
-  `GetNetTotals </docs/core-api-ref-remote-procedure-calls-network#getnettotals>`__:
   returns information about network traffic, including bytes in, bytes
   out, and the current time.
-  `GetNetworkInfo </docs/core-api-ref-remote-procedure-calls-network#getnetworkinfo>`__:
   returns information about the node’s connection to the network.

ListBanned
==========

*Added in Bitcoin Core 0.12.0*

The ```listbanned``
RPC <core-api-ref-remote-procedure-calls-network#listbanned>`__ lists
all banned IPs/Subnets.

*Parameters: none*

*Result—information about each banned IP/Subnet*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An array of     |
|                 |                 | equired(exactly | objects each    |
|                 |                 | 1)              | describing one  |
|                 |                 |                 | entry. If there |
|                 |                 |                 | are no entries  |
|                 |                 |                 | in the ban      |
|                 |                 |                 | list, the array |
|                 |                 |                 | will be empty   |
+-----------------+-----------------+-----------------+-----------------+
| →Node           | object          | Optional(0 or   | A ban list      |
|                 |                 | more)           | entry           |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | The IP/Subnet   |
| →\ ``address``  |                 | equired(exactly | of the entry    |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number(int)     | R               | The Unix epoch  |
| →\ `            |                 | equired(exactly | time when the   |
| `banned_until`` |                 | 1)              | entry was added |
|                 |                 |                 | to the ban list |
+-----------------+-----------------+-----------------+-----------------+
| →               | number(int)     | R               | The Unix epoch  |
| →\              |                 | equired(exactly | time until the  |
| ``ban_created`` |                 | 1)              | IP/Subnet is    |
|                 |                 |                 | banned          |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | Set to one of   |
| →\              |                 | equired(exactly | the following   |
|  ``ban_reason`` |                 | 1)              | reasons:•       |
|                 |                 |                 | ``nod           |
|                 |                 |                 | e misbehaving`` |
|                 |                 |                 | if the node was |
|                 |                 |                 | banned by the   |
|                 |                 |                 | client because  |
|                 |                 |                 | of DoS          |
|                 |                 |                 | violations•     |
|                 |                 |                 | ``m             |
|                 |                 |                 | anually added`` |
|                 |                 |                 | if the node was |
|                 |                 |                 | manually banned |
|                 |                 |                 | by the user     |
+-----------------+-----------------+-----------------+-----------------+

*Examples from Dash Core 0.12.2*

The default (``false``):

.. code:: bash

   dash-cli listbanned

Result:

.. code:: json

   [
     {
       "address": "192.0.2.201/32",
       "banned_until": 1507906175,
       "ban_created": 1507819775,
       "ban_reason": "node misbehaving"
     },
     {
       "address": "192.0.2.101/32",
       "banned_until": 1507906199,
       "ban_created": 1507819799,
       "ban_reason": "manually added"
     }
   ]

*See also*

-  `SetBan </docs/core-api-ref-remote-procedure-calls-network#setban>`__:
   attempts add or remove a IP/Subnet from the banned list.
-  `ClearBanned </docs/core-api-ref-remote-procedure-calls-network#clearbanned>`__:
   clears list of banned nodes.

Ping
====

The ```ping`` RPC <core-api-ref-remote-procedure-calls-network#ping>`__
sends a P2P ping message to all connected nodes to measure ping time.
Results are provided by the ```getpeerinfo``
RPC <core-api-ref-remote-procedure-calls-network#getpeerinfo>`__
pingtime and pingwait fields as decimal seconds. The P2P ```ping``
message <core-ref-p2p-network-control-messages#ping>`__ is handled in a
queue with all other commands, so it measures processing backlog, not
just network ping.

*Parameters: none*

*Result—``null``*

========== ==== ======== ====================
Name       Type Presence Description
========== ==== ======== ====================
``result`` null Required Always JSON ``null``
========== ==== ======== ====================

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet ping

(Success: no result printed.)

Get the results using the ```getpeerinfo``
RPC <core-api-ref-remote-procedure-calls-network#getpeerinfo>`__:

.. code:: bash

   dash-cli -testnet getpeerinfo | grep ping

Results:

.. code:: json

           "pingtime" : 0.11790800,
           "pingtime" : 0.22673400,
           "pingtime" : 0.16451900,
           "pingtime" : 0.12465200,
           "pingtime" : 0.13267900,
           "pingtime" : 0.23983300,
           "pingtime" : 0.16764700,
           "pingtime" : 0.11337300,

*See also*

-  `GetPeerInfo </docs/core-api-ref-remote-procedure-calls-network#getpeerinfo>`__:
   returns data about each connected network node.
-  `P2P Ping Message <core-ref-p2p-network-control-messages#ping>`__

SetBan
======

*Added in Bitcoin Core 0.12.0*

The ```setban``
RPC <core-api-ref-remote-procedure-calls-network#setban>`__ attempts add
or remove a IP/Subnet from the banned list.

*Parameter #1—IP/Subnet of the node*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| IP(/Netmask)    | string          | R               | The node to add |
|                 |                 | equired(exactly | or remove as a  |
|                 |                 | 1)              | string in the   |
|                 |                 |                 | form of         |
|                 |                 |                 | ``              |
|                 |                 |                 | <IP address>``. |
|                 |                 |                 | The IP address  |
|                 |                 |                 | may be a        |
|                 |                 |                 | hostname        |
|                 |                 |                 | resolvable      |
|                 |                 |                 | through DNS, an |
|                 |                 |                 | IPv4 address,   |
|                 |                 |                 | an IPv4-as-IPv6 |
|                 |                 |                 | address, or an  |
|                 |                 |                 | IPv6 address    |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—whether to add or remove the node*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Command         | string          | R               | What to do with |
|                 |                 | equired(exactly | the IP/Subnet   |
|                 |                 | 1)              | address above.  |
|                 |                 |                 | Options are:•   |
|                 |                 |                 | ``add`` to add  |
|                 |                 |                 | a node to the   |
|                 |                 |                 | addnode list•   |
|                 |                 |                 | ``remove`` to   |
|                 |                 |                 | remove a node   |
|                 |                 |                 | from the list.  |
|                 |                 |                 | If currently    |
|                 |                 |                 | connected, this |
|                 |                 |                 | will disconnect |
|                 |                 |                 | immediately     |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—time how long the ip is banned*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Bantime         | numeric(int)    | Optional(0 or   | Time in seconds |
|                 |                 | 1)              | how long (or    |
|                 |                 |                 | until when if   |
|                 |                 |                 | ``absolute`` is |
|                 |                 |                 | set) the entry  |
|                 |                 |                 | is banned. The  |
|                 |                 |                 | default is 24h  |
|                 |                 |                 | which can also  |
|                 |                 |                 | be overwritten  |
|                 |                 |                 | by the -bantime |
|                 |                 |                 | startup         |
|                 |                 |                 | argument        |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #4—whether a relative or absolute timestamp*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Absolute        | bool            | Optional(0 or   | If set, the     |
|                 |                 | 1)              | bantime must be |
|                 |                 |                 | a absolute      |
|                 |                 |                 | timestamp in    |
|                 |                 |                 | seconds since   |
|                 |                 |                 | epoch (Jan 1    |
|                 |                 |                 | 1970 GMT)       |
+-----------------+-----------------+-----------------+-----------------+

*Result—``null`` on success*

========== ==== =================== ====================
Name       Type Presence            Description
========== ==== =================== ====================
``result`` null Required(exactly 1) Always JSON ``null``
========== ==== =================== ====================

*Example from Dash Core 0.12.2*

Ban the following node.

.. code:: bash

   dash-cli -testnet setban 192.0.2.113 add 2592000

Result (no output from ``dash-cli`` because result is set to ``null``).

*See also*

-  `ListBanned </docs/core-api-ref-remote-procedure-calls-network#listbanned>`__:
   lists all banned IPs/Subnets.
-  `ClearBanned </docs/core-api-ref-remote-procedure-calls-network#clearbanned>`__:
   clears list of banned nodes.

SetNetworkActive
================

*Added in Bitcoin Core 0.14.0*

The ```setnetworkactive``
RPC <core-api-ref-remote-procedure-calls-network#setnetworkactive>`__
disables/enables all P2P network activity.

*Parameter #1—whether to disable or enable all P2P network activity*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Activate        | bool            | R               | Set to ``true`` |
|                 |                 | equired(exactly | to enable all   |
|                 |                 | 1)              | P2P network     |
|                 |                 |                 | activity. Set   |
|                 |                 |                 | to ``false`` to |
|                 |                 |                 | disable all P2P |
|                 |                 |                 | network         |
|                 |                 |                 | activity        |
+-----------------+-----------------+-----------------+-----------------+

*Result—``null`` or error on failure*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | null            | R               | JSON ``null``.  |
|                 |                 | equired(exactly | The JSON-RPC    |
|                 |                 | 1)              | error field     |
|                 |                 |                 | will be set     |
|                 |                 |                 | only if you     |
|                 |                 |                 | entered an      |
|                 |                 |                 | invalid         |
|                 |                 |                 | parameter       |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli setnetworkactive true

Result (no output from ``dash-cli`` because result is set to ``null``).

*See also*

-  `GetNetworkInfo </docs/core-api-ref-remote-procedure-calls-network#getnetworkinfo>`__:
   returns information about the node’s connection to the network.
