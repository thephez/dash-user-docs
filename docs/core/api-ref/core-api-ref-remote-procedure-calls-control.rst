Debug
=====

The ```debug``
RPC <core-api-ref-remote-procedure-calls-control#debug>`__ changes the
debug category from the console. [block:callout] { “type”: “danger”,
“body”: “Breaking change(s) in Dash Core 18.0. See parameter and/or
response information for details.” } [/block] *Parameter #1—debug
category*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Debug category  | string          | Required(1 or   | The debug       |
|                 |                 | more)           | category to     |
|                 |                 |                 | activate. Use a |
|                 |                 |                 | ``+`` to        |
|                 |                 |                 | specify         |
|                 |                 |                 | multiple        |
|                 |                 |                 | categories.     |
|                 |                 |                 | Categories will |
|                 |                 |                 | be one of the   |
|                 |                 |                 | following:•     |
|                 |                 |                 | ``0`` -         |
|                 |                 |                 | Disables all    |
|                 |                 |                 | categories •    |
|                 |                 |                 | ``1`` or        |
|                 |                 |                 | ``all`` -       |
|                 |                 |                 | Enables all     |
|                 |                 |                 | categories •    |
|                 |                 |                 | ``addrman`` •   |
|                 |                 |                 | ``bench`` •     |
|                 |                 |                 | ``cmpctblock``  |
|                 |                 |                 | • ``coindb`` •  |
|                 |                 |                 | ``walletdb``    |
|                 |                 |                 | (**renamed from |
|                 |                 |                 | ``db`` in Dash  |
|                 |                 |                 | Core 18.0.0**)• |
|                 |                 |                 | ``estimatefee`` |
|                 |                 |                 | • ``http`` •    |
|                 |                 |                 | ``leveldb`` •   |
|                 |                 |                 | ``libevent`` •  |
|                 |                 |                 | ``mempool`` •   |
|                 |                 |                 | ``mempoolrej``  |
|                 |                 |                 | • ``net`` •     |
|                 |                 |                 | ``proxy`` •     |
|                 |                 |                 | ``prune`` •     |
|                 |                 |                 | ``qt`` •        |
|                 |                 |                 | ``rand`` •      |
|                 |                 |                 | ``reindex`` •   |
|                 |                 |                 | ``rpc`` •       |
|                 |                 |                 | ``selectcoins`` |
|                 |                 |                 | • ``tor`` •     |
|                 |                 |                 | ``zmq`` •       |
|                 |                 |                 | ``dash`` (all   |
|                 |                 |                 | su              |
|                 |                 |                 | bcategories)The |
|                 |                 |                 | ``dash``        |
|                 |                 |                 | sub-categories  |
|                 |                 |                 | can be enabled  |
|                 |                 |                 | individually:•  |
|                 |                 |                 | ``chainlocks``  |
|                 |                 |                 | • ``gobject`` • |
|                 |                 |                 | ``instantsend`` |
|                 |                 |                 | • ``llmq`` •    |
|                 |                 |                 | ``llmq-dkg`` •  |
|                 |                 |                 | ``llmq-sigs`` • |
|                 |                 |                 | ``mnpayments``  |
|                 |                 |                 | • ``mnsync`` •  |
|                 |                 |                 | ``coinjoin`` •  |
|                 |                 |                 | ``spork`` Note: |
|                 |                 |                 | No error will   |
|                 |                 |                 | be thrown even  |
|                 |                 |                 | if the          |
|                 |                 |                 | specified       |
|                 |                 |                 | category        |
|                 |                 |                 | doesn’t match   |
|                 |                 |                 | any of the      |
|                 |                 |                 | above           |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.15.0*

.. code:: bash

   dash-cli -testnet debug "net+mempool"

Result:

.. code:: text

   Debug mode: net+mempool

*See also*

-  `Logging </docs/core-api-ref-remote-procedure-calls-control#logging>`__:
   gets and sets the logging configuration

GetMemoryInfo
=============

*Added in Dash Core 0.12.3 / Bitcoin Core 0.14.0*

The ```getmemoryinfo``
RPC <core-api-ref-remote-procedure-calls-control#getmemoryinfo>`__
returns information about memory usage.

*Parameter #1—mode*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| mode            | string          | O               | *Added in Dash  |
|                 |                 | ptionalDefault: | Core            |
|                 |                 | ``stats``       | 0.15            |
|                 |                 |                 | .0*\ Determines |
|                 |                 |                 | what kind of    |
|                 |                 |                 | information is  |
|                 |                 |                 | returned.-      |
|                 |                 |                 | ``stats``       |
|                 |                 |                 | returns general |
|                 |                 |                 | statistics      |
|                 |                 |                 | about memory    |
|                 |                 |                 | usage in the    |
|                 |                 |                 | daemon.-        |
|                 |                 |                 | ``mallocinfo``  |
|                 |                 |                 | returns an XML  |
|                 |                 |                 | string          |
|                 |                 |                 | describing      |
|                 |                 |                 | low-level heap  |
|                 |                 |                 | state (only     |
|                 |                 |                 | available if    |
|                 |                 |                 | compiled with   |
|                 |                 |                 | glibc 2.10+).   |
+-----------------+-----------------+-----------------+-----------------+

*Result—information about memory usage*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An object       |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | information     |
|                 |                 |                 | about memory    |
|                 |                 |                 | usage           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``locked``   | string : object | R               | An object       |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | information     |
|                 |                 |                 | about locked    |
|                 |                 |                 | memory manager  |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``used``    | number (int)    | R               | Number of bytes |
|                 |                 | equired(exactly | used            |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``free``    | number (int)    | R               | Number of bytes |
|                 |                 | equired(exactly | available in    |
|                 |                 | 1)              | current arenas  |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``total``   | number (int)    | R               | Total number of |
|                 |                 | equired(exactly | bytes managed   |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``locked``  | number (int)    | R               | Amount of bytes |
|                 |                 | equired(exactly | that succeeded  |
|                 |                 | 1)              | locking         |
+-----------------+-----------------+-----------------+-----------------+
| →→\             | number (int)    | R               | Number          |
| ``chunks_used`` |                 | equired(exactly | allocated       |
|                 |                 | 1)              | chunks          |
+-----------------+-----------------+-----------------+-----------------+
| →→\             | number (int)    | R               | Number unused   |
| ``chunks_free`` |                 | equired(exactly | chunks          |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.3*

.. code:: bash

   dash-cli getmemoryinfo

Result:

.. code:: json

   {
     "locked": {
       "used": 1146240,
       "free": 426624,
       "total": 1572864,
       "locked": 1572864,
       "chunks_used": 16368,
       "chunks_free": 7
     }
   }

*See also*

-  `GetMemPoolInfo </docs/core-api-ref-remote-procedure-calls-blockchain#getmempoolinfo>`__:
   returns information about the node’s current transaction memory pool.

GetRPCInfo
==========

*Added in Dash Core 18.0.0*

The ```getrpcinfo`` RPC <getrpcinfo>`__ returns details about the RPC
server.

*Parameters: none*

*Result—information about the RPC server*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An object       |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | information     |
|                 |                 |                 | about the RPC   |
|                 |                 |                 | server          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``ac         | array of        | R               | An object       |
| tive_commands`` | objects         | equired(exactly | containing      |
|                 |                 | 1)              | information     |
|                 |                 |                 | about active    |
|                 |                 |                 | RPC commands    |
+-----------------+-----------------+-----------------+-----------------+
| →→Active        | object          | Optional(0 or   | Information     |
| command         |                 | more)           | about a         |
|                 |                 |                 | currently       |
|                 |                 |                 | active command  |
+-----------------+-----------------+-----------------+-----------------+
| →→→\ ``method`` | number (int)    | R               | Name of the     |
|                 |                 | equired(exactly | command         |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →→              | number (int)    | R               | Number of       |
| →\ ``duration`` |                 | equired(exactly | microseconds    |
|                 |                 | 1)              | the command has |
|                 |                 |                 | been active     |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

.. code:: bash

   dash-cli getrpcinfo

Result:

.. code:: json

   {
     "active_commands": [
       {
         "method": "generate",
         "duration": 5226138
       },
       {
         "method": "getrpcinfo",
         "duration": 5
       }
     ]
   }

*See also: none*

Help
====

The ```help`` RPC <core-api-ref-remote-procedure-calls-control#help>`__
lists all available public RPC commands, or gets help for the specified
RPC. Commands which are unavailable will not be listed, such as wallet
RPCs if wallet support is disabled.

*Parameter #1—the name of the RPC to get help for*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| RPC             | string          | Optional(0 or   | The name of the |
|                 |                 | 1)              | RPC to get help |
|                 |                 |                 | for. If         |
|                 |                 |                 | omitted, Dash   |
|                 |                 |                 | Core 0.10x will |
|                 |                 |                 | display an      |
|                 |                 |                 | alphabetical    |
|                 |                 |                 | list of         |
|                 |                 |                 | commands; Dash  |
|                 |                 |                 | Core 0.11.0     |
|                 |                 |                 | will display a  |
|                 |                 |                 | categorized     |
|                 |                 |                 | list of         |
|                 |                 |                 | commands        |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the name of the subcommand to get help for*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Sub-command     | string          | Optional(0 or   | The subcommand  |
|                 |                 | 1)              | to get help on. |
|                 |                 |                 | Please note     |
|                 |                 |                 | that not all    |
|                 |                 |                 | subcommands     |
|                 |                 |                 | support this at |
|                 |                 |                 | the moment      |
+-----------------+-----------------+-----------------+-----------------+

*Result—a list of RPCs or detailed help for a specific RPC*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | string          | R               | The help text   |
|                 |                 | equired(exactly | for the         |
|                 |                 | 1)              | specified RPC   |
|                 |                 |                 | or the list of  |
|                 |                 |                 | commands. The   |
|                 |                 |                 | ``dash-cli``    |
|                 |                 |                 | command will    |
|                 |                 |                 | parse this text |
|                 |                 |                 | and format it   |
|                 |                 |                 | as              |
|                 |                 |                 | human-readable  |
|                 |                 |                 | text            |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

Command to get help about the ```help``
RPC <core-api-ref-remote-procedure-calls-control#help>`__:

.. code:: bash

   dash-cli -testnet help help

Result:

.. code:: text

   help ( "command" "subcommand" )

   List all commands, or get help for a specified command.

   Arguments:
   1. "command"     (string, optional) The command to get help on
   2. "subcommand"  (string, optional) The subcommand to get help on. Please note that not all subcommands support this at the moment

   Result:
   "text"     (string) The help text

*See also*

-  The `RPC Quick
   Reference <core-api-ref-remote-procedure-call-quick-reference>`__

Logging
=======

The ```logging``
RPC <core-api-ref-remote-procedure-calls-control#logging>`__ gets and
sets the logging configuration [block:callout] { “type”: “danger”,
“body”: “Breaking change(s) in Dash Core 18.0. See parameter and/or
response information for details.” } [/block] *Parameter #1—include
categories*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``include``     | array of        | Optional(0 or   | Enable          |
|                 | strings         | 1)              | debugging for   |
|                 |                 |                 | these           |
|                 |                 |                 | categories      |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—exclude categories*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``exclude``     | array of        | Optional(0 or   | Enable          |
|                 | strings         | 1)              | debugging for   |
|                 |                 |                 | these           |
|                 |                 |                 | categories      |
+-----------------+-----------------+-----------------+-----------------+

The categories are:

+-----------------------------------+-----------------------------------+
| Type                              | Category                          |
+===================================+===================================+
| Special                           | • ``0`` - Disables all categories |
|                                   | • ``1`` or ``all`` - Enables all  |
|                                   | categories • ``dash`` -           |
|                                   | Enables/disables all Dash         |
|                                   | categories                        |
+-----------------------------------+-----------------------------------+
| Standard                          | ``addrman``, ``bench``            |
|                                   | \ ``cmpctblock``, ``coindb``,     |
|                                   | ``estimatefee``, ``http``,        |
|                                   | ``leveldb``, ``libevent``,        |
|                                   | ``mempool``, ``mempoolrej``,      |
|                                   | ``net``, ``proxy``, ``prune``,    |
|                                   | ``qt``, ``rand``, ``reindex``,    |
|                                   | ``rpc``, ``selectcoins``,         |
|                                   | ``tor``, ``zmq``, ``walletdb``    |
|                                   | (**renamed from ``db`` in Dash    |
|                                   | Core 18.0.0**)                    |
+-----------------------------------+-----------------------------------+
| Dash                              | \ ``chainlocks``, ``gobject``,    |
|                                   | ``instantsend``, ``llmq``,        |
|                                   | ``llmq-dkg``, ``llmq-sigs``,      |
|                                   | ``mnpayments``, ``mnsync``,       |
|                                   | ``coinjoin``, ``spork``           |
+-----------------------------------+-----------------------------------+

*Result—a list of the logging categories that are active*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | A JSON object   |
|                 |                 | equired(exactly | show a list of  |
|                 |                 | 1)              | the logging     |
|                 |                 |                 | categories that |
|                 |                 |                 | are active      |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.15.0*

Include a category in logging

.. code:: bash

   dash-cli -testnet logging '["llmq", "spork"]'

Result:

.. code:: json

   {
     "net": 0,
     "tor": 0,
     "mempool": 0,
     "http": 0,
     "bench": 0,
     "zmq": 0,
     "walletdb": 0,
     "rpc": 0,
     "estimatefee": 0,
     "addrman": 0,
     "selectcoins": 0,
     "reindex": 0,
     "cmpctblock": 0,
     "rand": 0,
     "prune": 0,
     "proxy": 0,
     "mempoolrej": 0,
     "libevent": 0,
     "coindb": 0,
     "qt": 0,
     "leveldb": 0,
     "chainlocks": 0,
     "gobject": 0,
     "instantsend": 0,
     "llmq": 1,
     "llmq-dkg": 0,
     "llmq-sigs": 0,
     "mnpayments": 0,
     "mnsync": 0,
     "coinjoin": 0,
     "spork": 1
   }

Excluding a previously included category (without including any new
ones):

.. code:: bash

   dash-cli -testnet logging '[]' '["spork"]'

Result:

.. code:: json

   {
     "net": 0,
     "tor": 0,
     "mempool": 0,
     "http": 0,
     "bench": 0,
     "zmq": 0,
     "walletdb": 0,
     "rpc": 0,
     "estimatefee": 0,
     "addrman": 0,
     "selectcoins": 0,
     "reindex": 0,
     "cmpctblock": 0,
     "rand": 0,
     "prune": 0,
     "proxy": 0,
     "mempoolrej": 0,
     "libevent": 0,
     "coindb": 0,
     "qt": 0,
     "leveldb": 0,
     "chainlocks": 0,
     "gobject": 0,
     "instantsend": 0,
     "llmq": 1,
     "llmq-dkg": 0,
     "llmq-sigs": 0,
     "mnpayments": 0,
     "mnsync": 0,
     "coinjoin": 0,
     "spork": 0
   }

*See also*

-  `Debug </docs/core-api-ref-remote-procedure-calls-control#debug>`__:
   changes the debug category from the console.

Stop
====

The ```stop`` RPC <core-api-ref-remote-procedure-calls-control#stop>`__
safely shuts down the Dash Core server.

*Parameters: none*

*Result—the server is safely shut down*

+------------+--------+---------------------+----------------------+
| Name       | Type   | Presence            | Description          |
+============+========+=====================+======================+
| ``result`` | string | Required(exactly 1) | The string           |
|            |        |                     | :ra                  |
|            |        |                     | w-latex:`\Dash `Core |
|            |        |                     | server stopping""    |
+------------+--------+---------------------+----------------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet stop

Result:

.. code:: text

   Dash Core server stopping

*See also: none*

Uptime
======

The ```uptime``
RPC <core-api-ref-remote-procedure-calls-control#uptime>`__ returns the
total uptime of the server.

*Parameters: none*

*Result*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | number (int)    | R               | The number of   |
|                 |                 | equired(exactly | seconds that    |
|                 |                 | 1)              | the server has  |
|                 |                 |                 | been running    |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.15.0*

.. code:: bash

   dash-cli -testnet uptime

Result:

.. code:: text

   5500

*See also: none*
