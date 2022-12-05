GetGovernanceInfo
=================

The ```getgovernanceinfo`` RPC <#getgovernanceinfo>`__ returns an object
containing governance parameters.

*Parameters: none*

*Result—information about the governance system*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | Information     |
|                 |                 | equired(exactly | about the       |
|                 |                 | 1)              | governance      |
|                 |                 |                 | system          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``govern     | number (int)    | R               | The absolute    |
| anceminquorum`` |                 | equired(exactly | minimum number  |
|                 |                 | 1)              | of votes needed |
|                 |                 |                 | to trigger a    |
|                 |                 |                 | governance      |
|                 |                 |                 | action          |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (int)    | R               | The collateral  |
| ``proposalfee`` |                 | equired(exactly | transaction fee |
|                 |                 | 1)              | which must be   |
|                 |                 |                 | paid to create  |
|                 |                 |                 | a proposal in   |
|                 |                 |                 | Dash            |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``su         | number (int)    | R               | The number of   |
| perblockcycle`` |                 | equired(exactly | blocks between  |
|                 |                 | 1)              | superblocks     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``l          | number (int)    | R               | The block       |
| astsuperblock`` |                 | equired(exactly | number of the   |
|                 |                 | 1)              | last superblock |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``n          | number (int)    | R               | The block       |
| extsuperblock`` |                 | equired(exactly | number of the   |
|                 |                 | 1)              | next superblock |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.14.0*

.. code:: bash

   dash-cli -testnet getgovernanceinfo

Result:

.. code:: json

   {
     "governanceminquorum": 1,
     "proposalfee": 5.00000000,
     "superblockcycle": 24,
     "lastsuperblock": 250824,
     "nextsuperblock": 250848
   }

*See also:*

-  `GObject <#gobject>`__: provides a set of commands for managing
   governance objects and displaying information about them.

# GetCoinJoinInfo

The ```getcoinjoininfo`` RPC <#getcoinjoininfo>`__ returns an object
containing an information about CoinJoin settings and state (previously
named ``getprivatesendinfo`` prior to Dash Core 0.17.0).

*Parameters: none*

*Result—(for regular nodes) information about the pool*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | Information     |
|                 |                 | equired(exactly | about the pool  |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``enabled``  | bool            | R               | Whether         |
|                 |                 | equired(exactly | CoinJoin        |
|                 |                 | 1)              | functionality   |
|                 |                 |                 | is enabled      |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | bool            | R               | Whether         |
| `multisession`` |                 | equired(exactly | CoinJoin        |
|                 |                 | 1)              | multisession    |
|                 |                 |                 | option is       |
|                 |                 |                 | enabled         |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | number (int)    | R               | How many        |
| `max_sessions`` |                 | equired(exactly | parallel        |
|                 |                 | 1)              | sessions can    |
|                 |                 |                 | there be at     |
|                 |                 |                 | once            |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (int)    | R               | How many rounds |
|  ``max_rounds`` |                 | equired(exactly | to process      |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (int)    | R               | How many DASH   |
|  ``max_amount`` |                 | equired(exactly | to keep         |
|                 |                 | 1)              | processed       |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (int)    | R               | **Removed in    |
|  ``max_denoms`` |                 | equired(exactly | Dash Core       |
|                 |                 | 1)              | 0.16.0**\ How   |
|                 |                 |                 | many inputs of  |
|                 |                 |                 | each            |
|                 |                 |                 | denominated     |
|                 |                 |                 | amount to       |
|                 |                 |                 | create          |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (int)    | R               | *Added in Dash  |
| ``denoms_goal`` |                 | equired(exactly | Core            |
|                 |                 | 1)              | 0.16.0*\ How    |
|                 |                 |                 | many inputs of  |
|                 |                 |                 | each            |
|                 |                 |                 | denominated     |
|                 |                 |                 | amount to       |
|                 |                 |                 | target          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``d          | number (int)    | R               | *Added in Dash  |
| enoms_hardcap`` |                 | equired(exactly | Core            |
|                 |                 | 1)              | 0               |
|                 |                 |                 | .16.0*\ Maximum |
|                 |                 |                 | limit of how    |
|                 |                 |                 | many inputs of  |
|                 |                 |                 | each            |
|                 |                 |                 | denominated     |
|                 |                 |                 | amount to       |
|                 |                 |                 | create          |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (int)    | R               | How many queues |
|  ``queue_size`` |                 | equired(exactly | there are       |
|                 |                 | 1)              | currently on    |
|                 |                 |                 | the network     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``running``  | bool            | R               | Whether         |
|                 |                 | equired(exactly | CoinJoin is     |
|                 |                 | 1)              | currently       |
|                 |                 |                 | running         |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``sessions`` | array of json   | R               | Information     |
|                 | objects         | equired(exactly | about           |
|                 |                 | 1)              | session(s)      |
+-----------------+-----------------+-----------------+-----------------+
| → →Session      | object          | Optional(1 or   | Information for |
|                 |                 | more)           | a session       |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | R               | The ProTxHash   |
| →               |                 | equired(exactly | of the          |
| \ ``protxhash`` |                 | 1)              | masternode      |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | R               | The outpoint of |
| →\ ``outpoint`` | (txid-index)    | equired(exactly | the masternode  |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | R               | The IP address  |
| →\ ``service``  | (host:port)     | equired(exactly | and port of the |
|                 |                 | 1)              | masternode      |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (int)    | R               | The             |
| →\ `            |                 | equired(exactly | denomination of |
| `denomination`` |                 | 1)              | the session (in |
|                 |                 |                 | DASH)           |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | R               | Current state   |
| →\ ``state``    |                 | equired(exactly | of the session  |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (int)    | R               | The number of   |
| →\ ``           |                 | equired(exactly | entries in the  |
| entries_count`` |                 | 1)              | session         |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | How many new    |
| \ ``keys_left`` |                 | equired(exactly | keys are left   |
|                 |                 | 1)              | since last      |
|                 |                 |                 | automatic       |
|                 |                 |                 | backup          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``warnings`` | string          | O               | Any warnings    |
|                 |                 | ptional(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+

*Result—(for masternodes) information about the pool*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | Information     |
|                 |                 | equired(exactly | about the pool  |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (int)    | R               | How many queues |
|  ``queue_size`` |                 | equired(exactly | there are       |
|                 |                 | 1)              | currently on    |
|                 |                 |                 | the network     |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | number (int)    | R               | The             |
| `denomination`` |                 | equired(exactly | denomination of |
|                 |                 | 1)              | the session (in |
|                 |                 |                 | DASH)           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``state``    | string          | R               | Current state   |
|                 |                 | equired(exactly | of the session  |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | number (int)    | R               | The number of   |
| entries_count`` |                 | equired(exactly | entries in the  |
|                 |                 | 1)              | session         |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0 (regular node)*

.. code:: bash

   dash-cli -testnet getcoinjoininfo

Result:

.. code:: json

   {
     "enabled": true,
     "multisession": true,
     "max_sessions": 4,
     "max_rounds": 16,
     "max_amount": 2000,
     "denoms_goal": 50,
     "denoms_hardcap": 300,
     "queue_size": 3,
     "running": true,
     "sessions": [
       {
         "protxhash": "0515c9a411df0f1bd9940d9a2e4f6d739c29c52fc8c045c383f1ff6acc87c7b7",
         "outpoint": "0a6520a6ef523de71fd0ca70441e1fd648483f094442d986b24e2c9391be61cf-29",
         "service": "54.170.119.85:26216",
         "denomination": 10.00010000,
         "state": "QUEUE",
         "entries_count": 0
       }
     ],
     "keys_left": 998,
     "warnings": ""
   }

*See also: none*

GetSuperblockBudget
===================

The ```getsuperblockbudget`` RPC <#getsuperblockbudget>`__ returns the
absolute maximum sum of superblock payments allowed.

*Parameter #1—block index*

===== ============ =================== ====================
Name  Type         Presence            Description
===== ============ =================== ====================
index number (int) Required(exactly 1) The superblock index
===== ============ =================== ====================

*Result—maximum sum of superblock payments*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | number (int)    | R               | The absolute    |
|                 |                 | equired(exactly | maximum sum of  |
|                 |                 | 1)              | superblock      |
|                 |                 |                 | payments        |
|                 |                 |                 | allowed, in     |
|                 |                 |                 | DASH            |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet getsuperblockbudget 7392

Result:

.. code:: text

   367.20

*See also:*

-  `GetGovernanceInfo <#getgovernanceinfo>`__: returns an object
   containing governance parameters.

GObject
=======

The ```gobject`` RPC <#gobject>`__ provides a set of commands for
managing governance objects and displaying information about them.

GObject Check
-------------

The ``gobject check`` RPC validates governance object data (*proposals
only*).

*Parameter #1—object data (hex)*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``data-hex``    | string (hex)    | R               | The data (hex)  |
|                 |                 | equired(exactly | of a governance |
|                 |                 | 1)              | proposal object |
+-----------------+-----------------+-----------------+-----------------+

*Result—governance object status*

+------------------+--------+------------------+------------------+
| Name             | Type   | Presence         | Description      |
+==================+========+==================+==================+
| Result           | object | Required(exactly | Object           |
|                  |        | 1)               | containing       |
|                  |        |                  | status           |
+------------------+--------+------------------+------------------+
| →\ `             | string | Required(exactly | Status of the    |
| `Object Status`` |        | 1)               | governance       |
|                  |        |                  | object           |
+------------------+--------+------------------+------------------+

*Example from Dash Core 0.14.0*

.. code:: bash

   dash-cli -testnet gobject check 7b22656e645f65706f6368223a3135363034353730\
   35352c226e616d65223a2274657374222c227061796d656e745f61646472657373223a22796\
   4354b4d52457333474c4d65366d544a597233597248316a75774e777246436642222c227061\
   796d656e745f616d6f756e74223a352c2273746172745f65706f6368223a313536303435333\
   439302c2274797065223a312c2275726c223a22687474703a2f2f746573742e636f6d227d

Result:

.. code:: json

   {
     "Object status": "OK"
   }

GObject Count
-------------

The ``gobject count`` RPC returns the count of governance objects and
votes.

*Parameter #1—mode*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``mode``        | string          | O               | Result return   |
|                 |                 | ptional(exactly | fo              |
|                 |                 | 1)              | rmat:\ ``json`` |
|                 |                 |                 | (de             |
|                 |                 |                 | fault)\ ``all`` |
|                 |                 |                 | - Default       |
|                 |                 |                 | before Dash     |
|                 |                 |                 | Core 0.12.3     |
|                 |                 |                 | (for backwards  |
|                 |                 |                 | compatibility)  |
+-----------------+-----------------+-----------------+-----------------+

**Command Mode - ``json``**

*Result—count of governance objects and votes*

+------------------+--------+------------------+------------------+
| Name             | Type   | Presence         | Description      |
+==================+========+==================+==================+
| Result           | object | Required(exactly | Information      |
|                  |        | 1)               | about the        |
|                  |        |                  | governance       |
|                  |        |                  | object           |
+------------------+--------+------------------+------------------+
| →\ `             | int    | Required(exactly | Total object     |
| `objects_total`` |        | 1)               | count            |
+------------------+--------+------------------+------------------+
| →\ ``proposals`` | int    | Required(exactly | Proposal count   |
|                  |        | 1)               |                  |
+------------------+--------+------------------+------------------+
| →\ ``triggers``  | int    | Required(exactly | Trigger count    |
|                  |        | 1)               |                  |
+------------------+--------+------------------+------------------+
| →\ ``other``     | int    | Required(exactly | Non-             |
|                  |        | 1)               | proposal/trigger |
|                  |        |                  | count            |
+------------------+--------+------------------+------------------+
| →\ ``erased``    | int    | Required(exactly | Erased count     |
|                  |        | 1)               |                  |
+------------------+--------+------------------+------------------+
| →\ ``votes``     | int    | Required(exactly | Vote count       |
|                  |        | 1)               |                  |
+------------------+--------+------------------+------------------+

*Example from Dash Core 0.14.0 (mode: ``json``/default)*

.. code:: bash

   dash-cli -testnet gobject count

Result (wrapped):

.. code:: json

   {
     "objects_total": 3,
     "proposals": 3,
     "triggers": 0,
     "other": 0,
     "erased": 4,
     "votes": 18
   }

**Command Mode - ``all``**

*Result—count of governance objects and votes*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | string          | R               | The count of    |
|                 |                 | equired(exactly | governance      |
|                 |                 | 1)              | objects and     |
|                 |                 |                 | votes           |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.14.0 (mode: ``all``)*

.. code:: bash

   dash-cli -testnet gobject count all

Result (wrapped):

.. code:: text

   Governance Objects: 177 (Proposals: 177, Triggers: 0, Other: 0; Erased: 5), \
   Votes: 9680

GObject Deserialize
-------------------

The ``gobject deserialize`` RPC deserializes a governance object from a
hex string to JSON.

*Parameter #1—object data (hex)*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``hex_data``    | string (hex)    | R               | The data (hex)  |
|                 |                 | equired(exactly | of a governance |
|                 |                 | 1)              | object          |
+-----------------+-----------------+-----------------+-----------------+

**Results**

The result output varies depending on the type of governance object
being deserialized. Examples are shown below for both proposal and
trigger object types.

**Result - Proposal**

*Result—governance proposal object deserialized to JSON*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | object          | R               | Array of        |
|                 |                 | equired(exactly | governance      |
|                 |                 | 1)              | objects         |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | Governance      |
| →               |                 | equired(exactly | object info as  |
| \ ``end_epoch`` |                 | 1)              | string          |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``name``   | string (hex)    | R               | Proposal name   |
|                 |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | Proposal        |
| →\ ``pa         |                 | equired(exactly | payment         |
| yment_address`` |                 | 1)              | addr            |
|                 |                 |                 | ess.\ **Support |
|                 |                 |                 | for P2SH        |
|                 |                 |                 | addresses       |
|                 |                 |                 | (e.g. multisig) |
|                 |                 |                 | added in Dash   |
|                 |                 |                 | Core v18.0.0.** |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | Proposal        |
| →\ ``p          |                 | equired(exactly | payment amount  |
| ayment_amount`` |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | Proposal start  |
| →\              |                 | equired(exactly |                 |
| ``start_epoch`` |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``type``   | int             | R               | Object type     |
|                 |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``url``    | string          | R               | Proposal URL    |
|                 |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.14.0*

.. code:: bash

   dash-cli -testnet gobject deserialize 7b22656e645f65706f6368223a313536303435\
   373035352c226e616d65223a2274657374222c227061796d656e745f61646472657373223a22\
   7964354b4d52457333474c4d65366d544a597233597248316a75774e777246436642222c2270\
   61796d656e745f616d6f756e74223a352c2273746172745f65706f6368223a31353630343533\
   3439302c2274797065223a312c2275726c223a22687474703a2f2f746573742e636f6d227d

Result:

.. code:: json

   {
     "end_epoch": 1560457055,
     "name": "test",
     "payment_address": "yd5KMREs3GLMe6mTJYr3YrH1juwNwrFCfB",
     "payment_amount": 5,
     "start_epoch": 1560453490,
     "type": 1,
     "url": "http://test.com"
   }

**Result - Trigger**

*Result—governance trigger object deserialized to JSON*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | object          | R               | Array of        |
|                 |                 | equired(exactly | governance      |
|                 |                 | 1)              | objects         |
+-----------------+-----------------+-----------------+-----------------+
| →               | int             | R               | Block height to |
| →\ ``event      |                 | equired(exactly | activate        |
| _block_height`` |                 | 1)              | trigger         |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | Proposal        |
| →\ ``paym       |                 | equired(exactly | payment address |
| ent_addresses`` |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | Proposal        |
| →\ ``pa         |                 | equired(exactly | payment amount  |
| yment_amounts`` |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | Proposal hashes |
| →\ ``pr         |                 | equired(exactly |                 |
| oposal_hashes`` |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``type``   | int             | R               | Object type     |
|                 |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.14.0*

.. code:: bash

   dash-cli -testnet gobject deserialize 7b226576656e745f626c6f636b5f68656967687\
   4223a203131393539322c20227061796d656e745f616464726573736573223a20227954686d6e\
   75565a316765516e79776f456147627079333362695435473573587a62222c20227061796d656\
   e745f616d6f756e7473223a2022312e3335393631393331222c202270726f706f73616c5f6861\
   73686573223a20223836333966636464653131626432373032373663396330333564366435346\
   3653962393138323465366466373532636164376464646331616532663734386435222c202274\
   797065223a20327d

Result (wrapped):

.. code:: json

   {
     "event_block_height": 119592,
     "payment_addresses": "yThmnuVZ1geQnywoEaGbpy33biT5G5sXzb",
     "payment_amounts": "1.35961931",
     "proposal_hashes": "8639fcdde11bd270276c9c035d6d54ce9b91824e6df752cad7dddc1ae2f748d5",
     "type": 2
   }

GObject Diff
------------

The ``gobject diff`` RPC Lists governance objects differences since last
diff.

*Parameter #1—signal*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``signal``      | string (hex)    | O               | Type of         |
|                 |                 | ptional(exactly | governance      |
|                 |                 | 1)              | object signal:  |
|                 |                 |                 | • ``valid``\ •  |
|                 |                 |                 | ``funding``\ •  |
|                 |                 |                 | ``delete``\ •   |
|                 |                 |                 | ``endorsed``\ • |
|                 |                 |                 | ``all``         |
|                 |                 |                 | (*DEFAULT*)     |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—type*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``type``        | string (hex)    | O               | Type of         |
|                 |                 | ptional(exactly | governance      |
|                 |                 | 1)              | object signal:  |
|                 |                 |                 | •               |
|                 |                 |                 | `               |
|                 |                 |                 | `proposals``\ • |
|                 |                 |                 | ``triggers``\ • |
|                 |                 |                 | ``all``         |
|                 |                 |                 | (*DEFAULT*)     |
+-----------------+-----------------+-----------------+-----------------+

*Result—governance objects*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | object          | R               | Information     |
|                 |                 | equired(exactly | about the       |
|                 |                 | 1)              | governance      |
|                 |                 |                 | object          |
+-----------------+-----------------+-----------------+-----------------+
| →Governance     | object          | Required(1 or   | Key: Governance |
| Object(s)       |                 | more)           | object          |
|                 |                 |                 | hashValues:     |
|                 |                 |                 | Governance      |
|                 |                 |                 | object details  |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | Governance      |
| →\ ``DataHex``  |                 | equired(exactly | object info as  |
|                 |                 | 1)              | hex string      |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | Governance      |
| →\              |                 | equired(exactly | object info as  |
|  ``DataString`` |                 | 1)              | string          |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``Hash``   | string (hex)    | R               | Hash of this    |
|                 |                 | equired(exactly | governance      |
|                 |                 | 1)              | object          |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | Hash of the     |
| →\ ``C          |                 | equired(exactly | collateral      |
| ollateralHash`` |                 | 1)              | payment         |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Object          |
| →\              |                 | equired(exactly | types:\ ``1`` - |
|  ``ObjectType`` |                 | 1)              | Unknown\ ``2``  |
|                 |                 |                 | -               |
|                 |                 |                 | Proposal\ ``3`` |
|                 |                 |                 | - Trigger       |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Object creation |
| →\ `            |                 | equired(exactly | time as Unix    |
| `CreationTime`` |                 | 1)              | epoch time      |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | Optional(0 or   | Signing         |
| →\ ``Sign       |                 | 1)              | masternode’s    |
| ingMasternode`` |                 |                 | vin (only       |
|                 |                 |                 | present in      |
|                 |                 |                 | triggers)       |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ ``Abs        |                 | equired(exactly | ``Yes`` votes   |
| oluteYesCount`` |                 | 1)              | minus number of |
|                 |                 |                 | ``No`` votes    |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ ``YesCount`` |                 | equired(exactly | ``Yes`` votes   |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ ``NoCount``  |                 | equired(exactly | ``No`` votes    |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ `            |                 | equired(exactly | ``Abstain``     |
| `AbstainCount`` |                 | 1)              | votes           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``f          | boolean         | R               | Valid by the    |
| LocalValidity`` |                 | equired(exactly | blockchain      |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | string          | R               | ``f             |
| IsValidReason`` |                 | equired(exactly | LocalValidity`` |
|                 |                 | 1)              | error result.   |
|                 |                 |                 | Empty if no     |
|                 |                 |                 | error returned. |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | boolean         | R               | Minimum network |
| `fCachedValid`` |                 | equired(exactly | support has     |
|                 |                 | 1)              | been reached    |
|                 |                 |                 | flagging this   |
|                 |                 |                 | object as a     |
|                 |                 |                 | valid and       |
|                 |                 |                 | understood      |
|                 |                 |                 | governance      |
|                 |                 |                 | object (e.g,    |
|                 |                 |                 | the serialized  |
|                 |                 |                 | data is correct |
|                 |                 |                 | format, etc)    |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``f          | boolean         | R               | Minimum network |
| CachedFunding`` |                 | equired(exactly | support has     |
|                 |                 | 1)              | been reached    |
|                 |                 |                 | for this object |
|                 |                 |                 | to be funded    |
|                 |                 |                 | (doesn’t mean   |
|                 |                 |                 | it will be for  |
|                 |                 |                 | sure though)    |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | boolean         | R               | Minimum network |
| fCachedDelete`` |                 | equired(exactly | support has     |
|                 |                 | 1)              | been reached    |
|                 |                 |                 | saying this     |
|                 |                 |                 | object should   |
|                 |                 |                 | be deleted from |
|                 |                 |                 | the system      |
|                 |                 |                 | entirely        |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``fC         | boolean         | R               | Minimum network |
| achedEndorsed`` |                 | equired(exactly | support has     |
|                 |                 | 1)              | been reached    |
|                 |                 |                 | flagging this   |
|                 |                 |                 | object as       |
|                 |                 |                 | endorsed        |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet gobject diff all all

Result (truncated):

.. code:: json

   {
     "17c2bd32005c5168a52f9b5caa74d875ee8a6867a6109f36923887ef6c36b301": {
       "DataHex": "5b5b2270726f706f73616c222c7b22656e645f65706f6368223a2231353037343533353731222c226e616d65223a227465737470726f706f73616c5f2d5f6162636465666768696a6b6c6d6e6f707172737475767778797a3031323334353637383931353037323634343939222c227061796d656e745f61646472657373223a2279697355653636445352487048504233514245426764574746637068435933626234222c227061796d656e745f616d6f756e74223a2232222c2273746172745f65706f6368223a2231353037323634343939222c2274797065223a312c2275726c223a2268747470733a2f2f7777772e6461736863656e7472616c2e6f72672f702f746573745f70726f706f73616c5f31353037323634343939227d5d5d",
       "DataString": "[[\"proposal\",{\"end_epoch\":\"1507453571\",\"name\":\"testproposal\",\"payment_address\":\"yisUe66DSRHpHPB3QBEBgdWGFcphCY3bb4\",\"payment_amount\":\"2\",\"start_epoch\":\"1507264499\",\"type\":1,\"url\":\"https://www.dashcentral.org/p/test_proposal_1507264499\"}]]",
       "Hash": "17c2bd32005c5168a52f9b5caa74d875ee8a6867a6109f36923887ef6c36b301",
       "CollateralHash": "a25c44b57931afd74530ce39741f91456446a8fd794d2f1c58c42d6f492647ad",
       "ObjectType": 1,
       "CreationTime": 1507264499,
       "AbsoluteYesCount": 0,
       "YesCount": 0,
       "NoCount": 0,
       "AbstainCount": 0,
       "fBlockchainValidity": true,
       "IsValidReason": "",
       "fCachedValid": true,
       "fCachedFunding": false,
       "fCachedDelete": false,
       "fCachedEndorsed": false
     }
   }

GObject Get
-----------

The ``gobject get`` RPC returns a governance object by hash.

*Parameter #1—object hash*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``go            | string (hex)    | R               | The hash of a   |
| vernance-hash`` |                 | equired(exactly | governance      |
|                 |                 | 1)              | object          |
+-----------------+-----------------+-----------------+-----------------+

*Result—governance object details*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | object          | R               | Information     |
|                 |                 | equired(exactly | about the       |
|                 |                 | 1)              | governance      |
|                 |                 |                 | object          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``DataHex``  | string (hex)    | R               | Governance      |
|                 |                 | equired(exactly | object info as  |
|                 |                 | 1)              | hex string      |
+-----------------+-----------------+-----------------+-----------------+
| →\              | string          | R               | Governance      |
|  ``DataString`` |                 | equired(exactly | object info as  |
|                 |                 | 1)              | string          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``Hash``     | string (hex)    | R               | Hash of this    |
|                 |                 | equired(exactly | governance      |
|                 |                 | 1)              | object          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``C          | string (hex)    | R               | Hash of the     |
| ollateralHash`` |                 | equired(exactly | collateral      |
|                 |                 | 1)              | payment         |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number          | R               | Object          |
|  ``ObjectType`` |                 | equired(exactly | types:\ ``1`` - |
|                 |                 | 1)              | Unknown\ ``2``  |
|                 |                 |                 | -               |
|                 |                 |                 | Proposal\ ``3`` |
|                 |                 |                 | - Trigger       |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | number          | R               | Object creation |
| `CreationTime`` |                 | equired(exactly | time as Unix    |
|                 |                 | 1)              | epoch time      |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | object          | R               | Funding vote    |
| FundingResult`` |                 | equired(exactly | details         |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ ``Abs        |                 | equired(exactly | ``Yes`` votes   |
| oluteYesCount`` |                 | 1)              | minus number of |
|                 |                 |                 | ``No`` votes    |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ ``YesCount`` |                 | equired(exactly | ``Yes`` votes   |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ ``NoCount``  |                 | equired(exactly | ``No`` votes    |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ `            |                 | equired(exactly | ``Abstain``     |
| `AbstainCount`` |                 | 1)              | votes           |
+-----------------+-----------------+-----------------+-----------------+
| →\              | object          | R               | Object validity |
| ``ValidResult`` |                 | equired(exactly | vote details    |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ ``Abs        |                 | equired(exactly | ``Yes`` votes   |
| oluteYesCount`` |                 | 1)              | minus number of |
|                 |                 |                 | ``No`` votes    |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ ``YesCount`` |                 | equired(exactly | ``Yes`` votes   |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ ``NoCount``  |                 | equired(exactly | ``No`` votes    |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ `            |                 | equired(exactly | ``Abstain``     |
| `AbstainCount`` |                 | 1)              | votes           |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | object          | R               | Delete vote     |
| `DeleteResult`` |                 | equired(exactly | details         |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ ``Abs        |                 | equired(exactly | ``Yes`` votes   |
| oluteYesCount`` |                 | 1)              | minus number of |
|                 |                 |                 | ``No`` votes    |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ ``YesCount`` |                 | equired(exactly | ``Yes`` votes   |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ ``NoCount``  |                 | equired(exactly | ``No`` votes    |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ `            |                 | equired(exactly | ``Abstain``     |
| `AbstainCount`` |                 | 1)              | votes           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``E          | object          | R               | Endorsed vote   |
| ndorsedResult`` |                 | equired(exactly | details         |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ ``Abs        |                 | equired(exactly | ``Yes`` votes   |
| oluteYesCount`` |                 | 1)              | minus number of |
|                 |                 |                 | ``No`` votes    |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ ``YesCount`` |                 | equired(exactly | ``Yes`` votes   |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ ``NoCount``  |                 | equired(exactly | ``No`` votes    |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ `            |                 | equired(exactly | ``Abstain``     |
| `AbstainCount`` |                 | 1)              | votes           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``f          | boolean         | R               | Valid by the    |
| LocalValidity`` |                 | equired(exactly | blockchain      |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | string          | R               | ``f             |
| IsValidReason`` |                 | equired(exactly | LocalValidity`` |
|                 |                 | 1)              | error result.   |
|                 |                 |                 | Empty if no     |
|                 |                 |                 | error returned. |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | boolean         | R               | Minimum network |
| `fCachedValid`` |                 | equired(exactly | support has     |
|                 |                 | 1)              | been reached    |
|                 |                 |                 | flagging this   |
|                 |                 |                 | object as a     |
|                 |                 |                 | valid and       |
|                 |                 |                 | understood      |
|                 |                 |                 | governance      |
|                 |                 |                 | object (e.g,    |
|                 |                 |                 | the serialized  |
|                 |                 |                 | data is correct |
|                 |                 |                 | format, etc)    |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``f          | boolean         | R               | Minimum network |
| CachedFunding`` |                 | equired(exactly | support has     |
|                 |                 | 1)              | been reached    |
|                 |                 |                 | for this object |
|                 |                 |                 | to be funded    |
|                 |                 |                 | (doesn’t mean   |
|                 |                 |                 | it will be for  |
|                 |                 |                 | sure though)    |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | boolean         | R               | Minimum network |
| fCachedDelete`` |                 | equired(exactly | support has     |
|                 |                 | 1)              | been reached    |
|                 |                 |                 | saying this     |
|                 |                 |                 | object should   |
|                 |                 |                 | be deleted from |
|                 |                 |                 | the system      |
|                 |                 |                 | entirely        |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``fC         | boolean         | R               | Minimum network |
| achedEndorsed`` |                 | equired(exactly | support has     |
|                 |                 | 1)              | been reached    |
|                 |                 |                 | flagging this   |
|                 |                 |                 | object as       |
|                 |                 |                 | endorsed        |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet gobject get \
       42253a7bec554b97a65d2889e6cb9a1cf308b3d47a778c704bf9cdc1fe1bf6ff

Result (wrapped):

.. code:: json

   {
     "DataHex": "5b5b2270726f706f73616c222c7b22656e645f65706f6368223a2231353037343339353130222c226e616d65223a227465737470726f706f73616c5f2d5f6162636465666768696a6b6c6d6e6f707172737475767778797a3031323334353637383931353037323530343338222c227061796d656e745f61646472657373223a22795668577955345933756456784d5234464b3333556741534a41436831436835516a222c227061796d656e745f616d6f756e74223a2232222c2273746172745f65706f6368223a2231353037323530343338222c2274797065223a312c2275726c223a2268747470733a2f2f7777772e6461736863656e7472616c2e6f72672f702f746573745f70726f706f73616c5f31353037323530343338227d5d5d",
     "DataString": "[[\"proposal\",{\"end_epoch\":\"1507439510\",\"name\":\"testproposal_-_abcdefghijklmnopqrstuvwxyz01234567891507250438\",\"payment_address\":\"yVhWyU4Y3udVxMR4FK33UgASJACh1Ch5Qj\",\"payment_amount\":\"2\",\"start_epoch\":\"1507250438\",\"type\":1,\"url\":\"https://www.dashcentral.org/p/test_proposal_1507250438\"}]]",
     "Hash": "42253a7bec554b97a65d2889e6cb9a1cf308b3d47a778c704bf9cdc1fe1bf6ff",
     "CollateralHash": "cb09bd0310c0a67cde9387ad4d8908a7ad9f5d89c5afd58e9332b8bd26a646c7",
     "ObjectType": 1,
     "CreationTime": 1507246694,
     "FundingResult": {
       "AbsoluteYesCount": 0,
       "YesCount": 0,
       "NoCount": 0,
       "AbstainCount": 0
     },
     "ValidResult": {
       "AbsoluteYesCount": 0,
       "YesCount": 0,
       "NoCount": 0,
       "AbstainCount": 0
     },
     "DeleteResult": {
       "AbsoluteYesCount": 31,
       "YesCount": 31,
       "NoCount": 0,
       "AbstainCount": 0
     },
     "EndorsedResult": {
       "AbsoluteYesCount": 0,
       "YesCount": 0,
       "NoCount": 0,
       "AbstainCount": 0
     },
     "fLocalValidity": true,
     "IsValidReason": "",
     "fCachedValid": true,
     "fCachedFunding": false,
     "fCachedDelete": false,
     "fCachedEndorsed": false
   }

GObject Getcurrentvotes
-----------------------

The ``gobject getcurrentvotes`` RPC gets only current (tallying) votes
for a governance object hash (does not include old votes).

*Parameter #1—object hash*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``go            | string (hex)    | R               | The hash of a   |
| vernance-hash`` |                 | equired(exactly | governance      |
|                 |                 | 1)              | object          |
+-----------------+-----------------+-----------------+-----------------+

*Result—votes for specified governance*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | object          | R               | The governance  |
|                 |                 | equired(exactly | object votes    |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →Vote Info      | string          | Required(1 or   | Key:            |
|                 |                 | more)           | vote-hashValue: |
|                 |                 |                 | vinMasternode,  |
|                 |                 |                 | time, outcome,  |
|                 |                 |                 | and signal of   |
|                 |                 |                 | the vote        |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet gobject getcurrentvotes 78941af577f639ac94440e4855a1ed8f\
     696f1506d1c0bed4f4b68f05be26d3ca

Result (truncated):

.. code:: json

   {
     "174aaba65982d25a23f437e2a66ec3836146ba7b7ce5b3fe2d5476907f7079d9": "2eab488e3a7b030303de0d18e357ce17a9fc6b8876705d61076bbe923b2e5fc8-1:1509354047:YES:DELETE",
     "444d4d871ec35479804f060c733f516908382642ec2dfce6044a59fcadfdcd60": "18e496fe85b61ac9a5fcaec1ef683c7e3fc9bce4a83c883608427ecfb1002fca-1:1508866932:YES:FUNDING",
     "d49a472c62e9d8105931829fc50ef6c6ce04a230507646ee0eaa615e863ef3a0": "18e496fe85b61ac9a5fcaec1ef683c7e3fc9bce4a83c883608427ecfb1002fca-1:1509117071:YES:DELETE",
     "78442507441d4524d2493b8568d130415c1eb394adb2fe38d6ffeb199115bc5d": "3df7fb192e21c34da99bdd10c34e58ecaf3f3c37d6b2289f0ffedba5050188cc-1:1509312524:YES:DELETE",
     "aa4dc9d3b9e74e8c1ffc725b737d07f8a32e43c64907e4bea19e64a86135f08a": "af9f5646ace92f76b3a01b0abe08716a0a7ded64074c2d2e712c93174b9013d1-1:1508866932:YES:FUNDING",
   }

GObject List
------------

The ``gobject list`` RPC Lists governance objects (can be filtered by
signal and/or object type).

*Parameter #1—signal*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``signal``      | string (hex)    | O               | Type of         |
|                 |                 | ptional(exactly | governance      |
|                 |                 | 1)              | object signal:  |
|                 |                 |                 | • ``valid``\ •  |
|                 |                 |                 | ``funding``\ •  |
|                 |                 |                 | ``delete``\ •   |
|                 |                 |                 | ``endorsed``\ • |
|                 |                 |                 | ``all``         |
|                 |                 |                 | (*DEFAULT*)     |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—type*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``type``        | string (hex)    | O               | Type of         |
|                 |                 | ptional(exactly | governance      |
|                 |                 | 1)              | object signal:  |
|                 |                 |                 | •               |
|                 |                 |                 | `               |
|                 |                 |                 | `proposals``\ • |
|                 |                 |                 | ``triggers``\ • |
|                 |                 |                 | ``all``         |
|                 |                 |                 | (*DEFAULT*)     |
+-----------------+-----------------+-----------------+-----------------+

*Result—governance objects*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | object          | R               | Information     |
|                 |                 | equired(exactly | about the       |
|                 |                 | 1)              | governance      |
|                 |                 |                 | object          |
+-----------------+-----------------+-----------------+-----------------+
| →Governance     | object          | Required(1 or   | Key: Governance |
| Object(s)       |                 | more)           | object          |
|                 |                 |                 | hashValues:     |
|                 |                 |                 | Governance      |
|                 |                 |                 | object details  |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | Governance      |
| →\ ``DataHex``  |                 | equired(exactly | object info as  |
|                 |                 | 1)              | hex string      |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | Governance      |
| →\              |                 | equired(exactly | object info as  |
|  ``DataString`` |                 | 1)              | string          |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``Hash``   | string (hex)    | R               | Hash of this    |
|                 |                 | equired(exactly | governance      |
|                 |                 | 1)              | object          |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | Hash of the     |
| →\ ``C          |                 | equired(exactly | collateral      |
| ollateralHash`` |                 | 1)              | payment         |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Object          |
| →\              |                 | equired(exactly | types:\ ``1`` - |
|  ``ObjectType`` |                 | 1)              | Unknown\ ``2``  |
|                 |                 |                 | -               |
|                 |                 |                 | Proposal\ ``3`` |
|                 |                 |                 | - Trigger       |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Object creation |
| →\ `            |                 | equired(exactly | time as Unix    |
| `CreationTime`` |                 | 1)              | epoch time      |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | Optional(0 or   | Signing         |
| →\ ``Sign       |                 | 1)              | masternode’s    |
| ingMasternode`` |                 |                 | vin (only       |
|                 |                 |                 | present in      |
|                 |                 |                 | triggers)       |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ ``Abs        |                 | equired(exactly | ``Yes`` votes   |
| oluteYesCount`` |                 | 1)              | minus number of |
|                 |                 |                 | ``No`` votes    |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ ``YesCount`` |                 | equired(exactly | ``Yes`` votes   |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ ``NoCount``  |                 | equired(exactly | ``No`` votes    |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | Number of       |
| →\ `            |                 | equired(exactly | ``Abstain``     |
| `AbstainCount`` |                 | 1)              | votes           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``f          | boolean         | R               | Valid by the    |
| LocalValidity`` |                 | equired(exactly | blockchain      |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | string          | R               | ``f             |
| IsValidReason`` |                 | equired(exactly | LocalValidity`` |
|                 |                 | 1)              | error result.   |
|                 |                 |                 | Empty if no     |
|                 |                 |                 | error returned. |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | boolean         | R               | Minimum network |
| `fCachedValid`` |                 | equired(exactly | support has     |
|                 |                 | 1)              | been reached    |
|                 |                 |                 | flagging this   |
|                 |                 |                 | object as a     |
|                 |                 |                 | valid and       |
|                 |                 |                 | understood      |
|                 |                 |                 | governance      |
|                 |                 |                 | object (e.g,    |
|                 |                 |                 | the serialized  |
|                 |                 |                 | data is correct |
|                 |                 |                 | format, etc)    |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``f          | boolean         | R               | Minimum network |
| CachedFunding`` |                 | equired(exactly | support has     |
|                 |                 | 1)              | been reached    |
|                 |                 |                 | for this object |
|                 |                 |                 | to be funded    |
|                 |                 |                 | (doesn’t mean   |
|                 |                 |                 | it will be for  |
|                 |                 |                 | sure though)    |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | boolean         | R               | Minimum network |
| fCachedDelete`` |                 | equired(exactly | support has     |
|                 |                 | 1)              | been reached    |
|                 |                 |                 | saying this     |
|                 |                 |                 | object should   |
|                 |                 |                 | be deleted from |
|                 |                 |                 | the system      |
|                 |                 |                 | entirely        |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``fC         | boolean         | R               | Minimum network |
| achedEndorsed`` |                 | equired(exactly | support has     |
|                 |                 | 1)              | been reached    |
|                 |                 |                 | flagging this   |
|                 |                 |                 | object as       |
|                 |                 |                 | endorsed        |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet gobject list all proposals

Result (truncated):

.. code:: json

   {
     "b370fa1afd61aca9aa879abea3087e29656a670478f281d4196efb4e7e893ffe": {
       "DataHex": "5b5b2270726f706f73616c222c7b22656e645f65706f6368223a2231353037343430303338222c226e616d65223a227465737470726f706f73616c5f2d5f6162636465666768696a6b6c6d6e6f707172737475767778797a3031323334353637383931353037323530393636222c227061796d656e745f61646472657373223a2279544c636f506d4e315963654432534345474d6b6e34395753565a4277626f646e6e222c227061796d656e745f616d6f756e74223a2232222c2273746172745f65706f6368223a2231353037323530393636222c2274797065223a312c2275726c223a2268747470733a2f2f7777772e6461736863656e7472616c2e6f72672f702f746573745f70726f706f73616c5f31353037323530393636227d5d5d",
       "DataString": "[[\"proposal\",{\"end_epoch\":\"1507440038\",\"name\":\"testproposal_-_abcdefghijklmnopqrstuvwxyz01234567891507250966\",\"payment_address\":\"yTLcoPmN1YceD2SCEGMkn49WSVZBwbodnn\",\"payment_amount\":\"2\",\"start_epoch\":\"1507250966\",\"type\":1,\"url\":\"https://www.dashcentral.org/p/test_proposal_1507250966\"}]]",
       "Hash": "b370fa1afd61aca9aa879abea3087e29656a670478f281d4196efb4e7e893ffe",
       "CollateralHash": "a51ea89c14735f8b5df37cd846b3561494cc616d4a741e4ef83b368d45c960ba",
       "ObjectType": 1,
       "CreationTime": 1507250966,
       "AbsoluteYesCount": 0,
       "YesCount": 0,
       "NoCount": 0,
       "AbstainCount": 0,
       "fBlockchainValidity": true,
       "IsValidReason": "",
       "fCachedValid": true,
       "fCachedFunding": false,
       "fCachedDelete": false,
       "fCachedEndorsed": false
     },
     "906ae4dbd285e1025832ac9b3160073ecbfeef094d34cf81b3d797a349c720ff": {
       "DataHex": "5b5b2270726f706f73616c222c7b22656e645f65706f6368223a2231353037343534383935222c226e616d65223a227465737470726f706f73616c5f2d5f6162636465666768696a6b6c6d6e6f707172737475767778797a3031323334353637383931353037323635383233222c227061796d656e745f61646472657373223a2279664e68484c4c695936577a5a646a51766137324a64395134313468516578514c68222c227061796d656e745f616d6f756e74223a2232222c2273746172745f65706f6368223a2231353037323635383233222c2274797065223a312c2275726c223a2268747470733a2f2f7777772e6461736863656e7472616c2e6f72672f702f746573745f70726f706f73616c5f31353037323635383233227d5d5d",
       "DataString": "[[\"proposal\",{\"end_epoch\":\"1507454895\",\"name\":\"testproposal_-_abcdefghijklmnopqrstuvwxyz01234567891507265823\",\"payment_address\":\"yfNhHLLiY6WzZdjQva72Jd9Q414hQexQLh\",\"payment_amount\":\"2\",\"start_epoch\":\"1507265823\",\"type\":1,\"url\":\"https://www.dashcentral.org/p/test_proposal_1507265823\"}]]",
       "Hash": "906ae4dbd285e1025832ac9b3160073ecbfeef094d34cf81b3d797a349c720ff",
       "CollateralHash": "1707470c4372ba048b72945365b4bb71afc8a986e0755c1f1e8a37bba21fde83",
       "ObjectType": 1,
       "CreationTime": 1507265823,
       "AbsoluteYesCount": 0,
       "YesCount": 0,
       "NoCount": 0,
       "AbstainCount": 0,
       "fBlockchainValidity": true,
       "IsValidReason": "",
       "fCachedValid": true,
       "fCachedFunding": false,
       "fCachedDelete": false,
       "fCachedEndorsed": false
     }
   }

GObject Prepare
---------------

The ``gobject prepare`` RPC prepares a governance object by signing and
creating a collateral transaction. [block:callout] { “type”: “success”,
“body”: “Note: Dash Core v18.0.0 added support for directing proposal
payouts to P2SH addresses such as multisig.” } [/block] *Parameter
#1—parent hash*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``parent-hash`` | string (hex)    | R               | Hash of the     |
|                 |                 | equired(exactly | parent object.  |
|                 |                 | 1)              | Usually the     |
|                 |                 |                 | root node which |
|                 |                 |                 | has a hash of 0 |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—revision*

============ ==== =================== ======================
Name         Type Presence            Description
============ ==== =================== ======================
``revision`` int  Required(exactly 1) Object revision number
============ ==== =================== ======================

*Parameter #3—time*

======== ======= =================== =============================
Name     Type    Presence            Description
======== ======= =================== =============================
``time`` int64_t Required(exactly 1) Create time (Unix epoch time)
======== ======= =================== =============================

*Parameter #4—data*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``data-hex``    | string (hex)    | R               | **Updated in    |
|                 |                 | equired(exactly | Dash Core       |
|                 |                 | 1)              | 0.14.0 to       |
|                 |                 |                 | require all new |
|                 |                 |                 | proposals to    |
|                 |                 |                 | use JSON        |
|                 |                 |                 | serializa       |
|                 |                 |                 | tion.**\ Object |
|                 |                 |                 | data (JSON      |
|                 |                 |                 | object with     |
|                 |                 |                 | governance      |
|                 |                 |                 | details).       |
|                 |                 |                 | Additional      |
|                 |                 |                 | details         |
|                 |                 |                 | regarding this  |
|                 |                 |                 | are provided in |
|                 |                 |                 | an example      |
|                 |                 |                 | below.          |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #5—use-IS*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``use-IS``      | boolean         | Optional(0 or   | *Deprecated and |
|                 |                 | 1)              | ignored since   |
|                 |                 |                 | Dash Core       |
|                 |                 |                 | 0.15.0*         |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #6—outputHash*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``outputHash``  | string (hex)    | Optional(0 or   | *Added in Dash  |
|                 |                 | 1)              | Core            |
|                 |                 |                 | 0.13.0*\ The    |
|                 |                 |                 | single output   |
|                 |                 |                 | to submit the   |
|                 |                 |                 | proposal fee    |
|                 |                 |                 | from            |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #7—outputIndex*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``outputIndex`` | numeric         | Optional(0 or   | *Added in Dash  |
|                 |                 | 1)              | Core            |
|                 |                 |                 | 0.13.0*\ The    |
|                 |                 |                 | output index    |
|                 |                 |                 | (required if    |
|                 |                 |                 | the             |
|                 |                 |                 | ``outputHash``  |
|                 |                 |                 | parameter is    |
|                 |                 |                 | provided)       |
+-----------------+-----------------+-----------------+-----------------+

*Result—collateral transaction ID*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | string (hex)    | R               | Transaction ID  |
|                 |                 | equired(exactly | for the         |
|                 |                 | 1)              | collateral      |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+

**Details of the ``data-hex`` field:**

The ``data-hex`` field is comprised of a JSON object as described in
`GObject Deserialize <#gobject-deserialize>`__ which is serialized to
hex.

An example of a proposal JSON object is shown here:

.. code:: json

   {
     "end_epoch": 1560457055,
     "name": "test",
     "payment_address": "yd5KMREs3GLMe6mTJYr3YrH1juwNwrFCfB",
     "payment_amount": 5,
     "start_epoch": 1560453490,
     "type": 1,
     "url": "http://test.com"
   }

To serialize the object, first remove all spaces from the JSON object as
shown below:

.. code:: json

   {"end_epoch":1560457055,"name":"test","payment_address":"yd5KMREs3GLMe6mTJYr3YrH1juwNwrFCfB","payment_amount":5,"start_epoch":1560453490,"type":1,"url":"http://test.com"}

Then convert the string to its hex equivalent as shown below. This is
what will be used for the ``data-hex`` field of the ``gobject prepare``
command:

.. code:: bash

   7b22656e645f65706f6368223a313536303435373035352c226e616d65223a2274657374222c\
   227061796d656e745f61646472657373223a227964354b4d52457333474c4d65366d544a5972\
   33597248316a75774e777246436642222c227061796d656e745f616d6f756e74223a352c2273\
   746172745f65706f6368223a313536303435333439302c2274797065223a312c2275726c223a\
   22687474703a2f2f746573742e636f6d227d

*Example from Dash Core 0.14.0*

.. code:: bash

   gobject prepare 0 1 1560449223 7b22656e645f65706f6368223a3135363034353730353\
   52c226e616d65223a2274657374222c227061796d656e745f61646472657373223a227964354\
   b4d52457333474c4d65366d544a597233597248316a75774e777246436642222c227061796d6\
   56e745f616d6f756e74223a352c2273746172745f65706f6368223a313536303435333439302\
   c2274797065223a312c2275726c223a22687474703a2f2f746573742e636f6d227d

Result (Collateral Transaction ID):

.. code:: bash

   3fd758e7a5761bb07b2850b8ba432ef42c1ea80f0921d2eab0682697dda78262

*See also:*

-  `GObject List-Prepared <#gobject-list-prepared>`__: returns a list of
   governance objects prepared by this wallet

GObject List-Prepared
---------------------

The ``gobject list-prepared`` RPC returns a list of governance objects
prepared by this wallet with ```gobject prepare`` <#gobject-prepare>`__
sorted by their creation time.

*Parameter #1—count*

+-----------+--------------+------------------+-------------------------------------+
| Name      | Type         | Presence         | Description                         |
+===========+==============+==================+=====================================+
| ``count`` | number (int) | Optional(0 or 1) | Maximum number of objects to return |
+-----------+--------------+------------------+-------------------------------------+

*Result—list of governance objects*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | array           | R               | List of         |
|                 |                 | equired(exactly | governance      |
|                 |                 | 1)              | objects         |
+-----------------+-----------------+-----------------+-----------------+
| →Governance     | object          | Required(0 or   | Proposal object |
| Object          |                 | more)           |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | Proposal object |
| →\              |                 | equired(exactly | hash            |
|  ``objectHash`` |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | Hash of the     |
| →\              |                 | equired(exactly | parent object.  |
|  ``parentHash`` |                 | 1)              | Usually the     |
|                 |                 |                 | root node which |
|                 |                 |                 | has a hash of 0 |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | Hash of the     |
| →\ ``c          |                 | equired(exactly | collateral      |
| ollateralHash`` |                 | 1)              | payment         |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | Proposal        |
| →               |                 | equired(exactly | creation time   |
| \ ``createdAt`` |                 | 1)              | as Unix epoch   |
|                 |                 |                 | time            |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | Proposal        |
| →\ ``revision`` |                 | equired(exactly | revision number |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``data``   | object          | R               | Object          |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | governance      |
|                 |                 |                 | object data     |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | R               | Governance      |
| →               |                 | equired(exactly | object info as  |
| \ ``end_epoch`` |                 | 1)              | string          |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``name`` | string (hex)    | R               | Proposal name   |
|                 |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string (hex)    | R               | Proposal        |
| →\ ``pa         |                 | equired(exactly | payment address |
| yment_address`` |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | R               | Proposal        |
| →\ ``p          |                 | equired(exactly | payment amount  |
| ayment_amount`` |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string (hex)    | R               | Proposal start  |
| →\              |                 | equired(exactly |                 |
| ``start_epoch`` |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``type`` | number (int)    | R               | Object type     |
|                 |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``url``  | string          | R               | Proposal URL    |
|                 |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``hex``  | string (hex)    | R               | Governance      |
|                 |                 | equired(exactly | object data as  |
|                 |                 | 1)              | hex             |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

.. code:: bash

   gobject list-prepared

Result (Collateral Transaction ID):

.. code:: json

   [
     {
       "objectHash": "307cde2e485968548cd1a19473bf48f788c16178d82f63cbe849c33988d9592b",
       "parentHash": "0000000000000000000000000000000000000000000000000000000000000000",
       "collateralHash": "987570add8979576cb8a4ee510df448fd2ae7097628b7980559489ecb116b0fa",
       "createdAt": 1608143561,
       "revision": 1,
       "data": {
         "end_epoch": 1608151237,
         "name": "test",
         "payment_address": "yd5KMREs3GLMe6mTJYr3YrH1juwNwrFCfB",
         "payment_amount": 5,
         "start_epoch": 1608147672,
         "type": 1,
         "url": "https://www.dash.org",
         "hex": "7b22656e645f65706f6368223a313630383135313233372c226e616d65223a2274657374222c227061796d656e745f61646472657373223a227964354b4d52457333474c4d65366d544a597233597248316a75774e777246436642222c227061796d656e745f616d6f756e74223a352c2273746172745f65706f6368223a313630383134373637322c2274797065223a312c2275726c223a2268747470733a2f2f7777772e646173682e6f7267227d"
       }
     }
   ]

*See also:*

-  `GObject Prepared <#gobject-prepare>`__: prepares a governance object
   by signing and creating a collateral transaction

GObject Submit
--------------

The ``gobject submit`` RPC submits a governance object to network
(objects must first be prepared via ``gobject prepare``).

Note: Parameters 1-4 should be the same values as the ones used for
``gobject prepare``.

*Parameter #1—parent hash*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``parent-hash`` | string (hex)    | R               | Hash of the     |
|                 |                 | equired(exactly | parent object.  |
|                 |                 | 1)              | Usually the     |
|                 |                 |                 | root node which |
|                 |                 |                 | has a hash of 0 |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—revision*

============ ==== =================== ======================
Name         Type Presence            Description
============ ==== =================== ======================
``revision`` int  Required(exactly 1) Object revision number
============ ==== =================== ======================

*Parameter #3—time*

======== ======= =================== ===========
Name     Type    Presence            Description
======== ======= =================== ===========
``time`` int64_t Required(exactly 1) Create time
======== ======= =================== ===========

*Parameter #4—data*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``data-hex``    | string (hex)    | R               | **Updated in    |
|                 |                 | equired(exactly | Dash Core       |
|                 |                 | 1)              | 0.14.0 to       |
|                 |                 |                 | require all new |
|                 |                 |                 | proposals to    |
|                 |                 |                 | use JSON        |
|                 |                 |                 | serializa       |
|                 |                 |                 | tion.**\ Object |
|                 |                 |                 | data (JSON      |
|                 |                 |                 | object with     |
|                 |                 |                 | governance      |
|                 |                 |                 | details). See   |
|                 |                 |                 | `GObject        |
|                 |                 |                 | Prepare <#gobj  |
|                 |                 |                 | ect-prepare>`__ |
|                 |                 |                 | for additional  |
|                 |                 |                 | details about   |
|                 |                 |                 | this field.     |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #5—fee transaction ID*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``data``        | string (hex)    | R               | Fee transaction |
|                 |                 | equired(exactly | ID - required   |
|                 |                 | 1)              | for all objects |
|                 |                 |                 | except triggers |
+-----------------+-----------------+-----------------+-----------------+

*Result—governance object hash*

========== ============ =================== ======================
Name       Type         Presence            Description
========== ============ =================== ======================
``result`` string (hex) Required(exactly 1) Governance object hash
========== ============ =================== ======================

*Example from Dash Core 0.14.0*

.. code:: bash

   dash-cli -testnet gobject submit 0 1 1560449223 7b22656e645f65706f6368223a3\
   13536303435373035352c226e616d65223a2274657374222c227061796d656e745f61646472\
   657373223a227964354b4d52457333474c4d65366d544a597233597248316a75774e7772464\
   36642222c227061796d656e745f616d6f756e74223a352c2273746172745f65706f6368223a\
   313536303435333439302c2274797065223a312c2275726c223a22687474703a2f2f7465737\
   42e636f6d227d \
   3fd758e7a5761bb07b2850b8ba432ef42c1ea80f0921d2eab0682697dda78262

Result (Governance Object Hash):

.. code:: bash

   e353b2ab5f7e7cb24b95e00e153ec2a6339249672f18b8e8e144aa711678710d

*See also:*

-  `GObject Prepared <#gobject-prepare>`__: prepares a governance object
   by signing and creating a collateral transaction

GObject Vote-alias
------------------

The ``gobject vote-alias`` RPC votes on a governance object by
masternode alias (using masternode.conf setup).

*Parameter #1—governance hash*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``go            | string (hex)    | R               | Hash of the     |
| vernance-hash`` |                 | equired(exactly | governance      |
|                 |                 | 1)              | object          |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—vote signal*

+------------+--------+---------------------+----------------------+
| Name       | Type   | Presence            | Description          |
+============+========+=====================+======================+
| ``signal`` | string | Required(exactly 1) | Vote signal:         |
|            |        |                     | ``funding``,         |
|            |        |                     | ``valid``, or        |
|            |        |                     | ``delete``           |
+------------+--------+---------------------+----------------------+

*Parameter #3—vote outcome*

+-------------+--------+---------------------+---------------------+
| Name        | Type   | Presence            | Description         |
+=============+========+=====================+=====================+
| ``outcome`` | string | Required(exactly 1) | Vote outcome:       |
|             |        |                     | ``yes``, ``no``, or |
|             |        |                     | ``abstain``         |
+-------------+--------+---------------------+---------------------+

*Parameter #4—masternode alias*

========= ====== =================== ==========================
Name      Type   Presence            Description
========= ====== =================== ==========================
``alias`` string Required(exactly 1) Alias of voting masternode
========= ====== =================== ==========================

*Result—votes for specified governance*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | object          | R               | The governance  |
|                 |                 | equired(exactly | object votes    |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``overall``  | string          | Required(1 or   | Reports number  |
|                 |                 | more)           | of vote         |
|                 |                 |                 | suc             |
|                 |                 |                 | cesses/failures |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``detail``   | object          | R               | Vote details    |
|                 |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →Masternode   | object          | Required(1 or   | Name of the     |
| Alias           |                 | more)           | masternode      |
|                 |                 |                 | alias           |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | R               | Vote result     |
| →\ ``result``   |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet gobject vote-alias \
   0bf97bce78b3b642c36d4ca8e9265f8f66de8774c220221f57739c1956413e2b \
   funding yes MN01

Result:

.. code:: json

   {
     "overall": "Voted successfully 1 time(s) and failed 0 time(s).",
     "detail": {
       "MN01": {
         "result": "success"
       }
     }
   }

GObject Vote-conf
-----------------

The ``gobject vote-conf`` RPC votes on a governance object by masternode
configured in dash.conf.

*Parameter #1—governance hash*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``go            | string (hex)    | R               | Hash of the     |
| vernance-hash`` |                 | equired(exactly | governance      |
|                 |                 | 1)              | object          |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—vote signal*

+------------+--------+---------------------+----------------------+
| Name       | Type   | Presence            | Description          |
+============+========+=====================+======================+
| ``signal`` | string | Required(exactly 1) | Vote signal:         |
|            |        |                     | ``funding``,         |
|            |        |                     | ``valid``, or        |
|            |        |                     | ``delete``           |
+------------+--------+---------------------+----------------------+

*Parameter #3—vote outcome*

+-------------+--------+---------------------+---------------------+
| Name        | Type   | Presence            | Description         |
+=============+========+=====================+=====================+
| ``outcome`` | string | Required(exactly 1) | Vote outcome:       |
|             |        |                     | ``yes``, ``no``, or |
|             |        |                     | ``abstain``         |
+-------------+--------+---------------------+---------------------+

*Result—votes for specified governance*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | object          | R               | The governance  |
|                 |                 | equired(exactly | object votes    |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``overall``  | string          | Required(1 or   | Reports number  |
|                 |                 | more)           | of vote         |
|                 |                 |                 | suc             |
|                 |                 |                 | cesses/failures |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``detail``   | object          | R               | Vote details    |
|                 |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | object          | Required(1 or   |                 |
| →               |                 | more)           |                 |
| \ ``dash.conf`` |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | R               | Vote result     |
| →\ ``result``   |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet gobject vote-conf \
   0bf97bce78b3b642c36d4ca8e9265f8f66de8774c220221f57739c1956413e2b funding yes

.. code:: json

   {
     "overall": "Voted successfully 1 time(s) and failed 0 time(s).",
     "detail": {
       "dash.conf": {
         "result": "success"
       }
     }
   }

GObject Vote-many
-----------------

The ``gobject vote-many`` RPC votes on a governance object by all
masternodes (using masternode.conf setup).

*Parameter #1—governance hash*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``go            | string (hex)    | R               | Hash of the     |
| vernance-hash`` |                 | equired(exactly | governance      |
|                 |                 | 1)              | object          |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—vote signal*

+------------+--------+---------------------+----------------------+
| Name       | Type   | Presence            | Description          |
+============+========+=====================+======================+
| ``signal`` | string | Required(exactly 1) | Vote signal:         |
|            |        |                     | ``funding``,         |
|            |        |                     | ``valid``, or        |
|            |        |                     | ``delete``           |
+------------+--------+---------------------+----------------------+

*Parameter #3—vote outcome*

+-------------+--------+---------------------+---------------------+
| Name        | Type   | Presence            | Description         |
+=============+========+=====================+=====================+
| ``outcome`` | string | Required(exactly 1) | Vote outcome:       |
|             |        |                     | ``yes``, ``no``, or |
|             |        |                     | ``abstain``         |
+-------------+--------+---------------------+---------------------+

*Parameter #4—masternode alias*

========= ====== =================== ==========================
Name      Type   Presence            Description
========= ====== =================== ==========================
``alias`` string Required(exactly 1) Alias of voting masternode
========= ====== =================== ==========================

*Result—votes for specified governance*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | object          | R               | The governance  |
|                 |                 | equired(exactly | object votes    |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``overall``  | string          | Required(1 or   | Reports number  |
|                 |                 | more)           | of vote         |
|                 |                 |                 | suc             |
|                 |                 |                 | cesses/failures |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``detail``   | object          | R               | Vote details    |
|                 |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →Masternode   | object          | Required(1 or   | Name of the     |
| Alias           |                 | more)           | masternode      |
|                 |                 |                 | alias           |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | R               | Vote result     |
| →\ ``result``   |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet gobject vote-many \
   0bf97bce78b3b642c36d4ca8e9265f8f66de8774c220221f57739c1956413e2b funding yes

.. code:: json

   {
     "overall": "Voted successfully 1 time(s) and failed 0 time(s).",
     "detail": {
       "MN01": {
         "result": "success"
       }
     }
   }

*See also:*

-  `GetGovernanceInfo <#getgovernanceinfo>`__: returns an object
   containing governance parameters.
-  `GetSuperblockBudget <#getsuperblockbudget>`__: returns the absolute
   maximum sum of superblock payments allowed.

Masternode
==========

The ```masternode`` RPC <#masternode>`__ provides a set of commands for
managing masternodes and displaying information about them.

Masternode Count
----------------

The ``masternode count`` RPC prints the number of all known masternodes.
[block:callout] { “type”: “warning”, “title”: “Dash Core 0.17.0 change”,
“body”: “The previously deprecated ``mode`` parameter was removed in
Dash Core 0.17.0. Information regarding the previous functionality is
available in `an older version of the
documentation <https://dashcore.readme.io/v0.16.0/docs/core-api-ref-remote-procedure-calls-dash#masternode-count>`__.”
} [/block] *Parameters: none*

*Result—number of known masternodes*

============== ====== =================== ============================
Name           Type   Presence            Description
============== ====== =================== ============================
``result``     object Required(exactly 1) Masternode count by mode
→\ ``total``   int    Required(exactly 1) Count of all masternodes
→\ ``enabled`` int    Required(exactly 1) Count of enabled masternodes
============== ====== =================== ============================

*Example from Dash Core 0.17.0*

.. code:: bash

   dash-cli -testnet masternode count

Result:

.. code:: bash

   {
     "total": 185,
     "enabled": 130
   }

Masternode Current
------------------

[block:callout] { “type”: “danger”, “title”: “Deprecated in Dash Core
0.17.0”, “body”: “This RPC has been deprecated and will be removed in a
future version of Dash Core” } [/block] The ``masternode current`` RPC
prints info on current masternode winner to be paid the next block
(calculated locally).

*Parameters: none*

*Result—current winning masternode info*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | object          | R               | Winning         |
|                 |                 | equired(exactly | masternode info |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``height``   | int             | R               | Block height    |
|                 |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``IP:port``  | string          | R               | The IP          |
|                 |                 | equired(exactly | address/port of |
|                 |                 | 1)              | the masternode  |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | The             |
| \ ``proTxHash`` |                 | equired(exactly | masternode’s    |
|                 |                 | 1)              | Provider        |
|                 |                 |                 | Registration    |
|                 |                 |                 | transaction     |
|                 |                 |                 | hash            |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``outpoint`` | string          | R               | The             |
|                 |                 | equired(exactly | masternode’s    |
|                 |                 | 1)              | outpoint        |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``payee``    | string          | R               | Payee address   |
|                 |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.14.0*

.. code:: bash

   dash-cli -testnet masternode current

Result:

.. code:: json

   {
     "height": 76179,
     "IP:port": "34.242.53.163:26155",
     "proTxHash": "9de76b8291d00026ab0af86306023c7b90f8e9229dc04916fe1335bf5e11f15d",
     "outpoint": "9de76b8291d00026ab0af86306023c7b90f8e9229dc04916fe1335bf5e11f15d-1",
     "payee": "yZnU7YJJgGQKvKPQFqXJ4k4DGSsRMhgLXx"
   }

Masternode List
---------------

The ``masternode list`` prints a list of all known masternodes.

This RPC uses the same parameters and returns the same data as
`masternodelist <#masternodelist>`__. Please reference it for full
details.

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet masternode list \
       rank f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f

Result:

.. code:: json

   {
     "f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f-1": 11
   }

Masternode Outputs
------------------

The ``masternode outputs`` RPC prints masternode compatible outputs.

*Parameters: none*

*Result—masternode outputs*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | object          | R               | Masternode      |
|                 |                 | equired(exactly | compatible      |
|                 |                 | 1)              | outputs         |
+-----------------+-----------------+-----------------+-----------------+
| →Output         | string          | Required(1 or   | Masternode      |
|                 |                 | more)           | compatible      |
|                 |                 |                 | output          |
|                 |                 |                 | (TXID:Index)    |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet masternode outputs

Result:

.. code:: json

   {
     "f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f": "1"
   }

Masternode Payments
-------------------

[block:callout] { “type”: “success”, “body”: “Added in Dash Core 0.17.0”
} [/block] The ``masternode payments`` RPC prints an array of
deterministic masternodes and their payments for the specified block.

By default, payment information is returned for only the chain tip. More
block winners can be requested via the optional ``count`` parameter.

*Parameter #1—block hash*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Block Hash      | string (hex)    | O               | The hash of the |
|                 |                 | ptional(exactly | starting block  |
|                 |                 | 1)              | (default: tip)  |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—count*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Count           | number (int)    | O               | The number of   |
|                 |                 | ptional(exactly | blocks to       |
|                 |                 | 1)              | return          |
|                 |                 |                 | (default: 1).   |
|                 |                 |                 | Will return     |
|                 |                 |                 | previous blocks |
|                 |                 |                 | if is negative. |
|                 |                 |                 | Both 1 and -1   |
|                 |                 |                 | correspond to   |
|                 |                 |                 | the chain tip.  |
+-----------------+-----------------+-----------------+-----------------+

. *Result—masternode payments*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | array of        | R               | List of         |
|                 | objects         | equired(exactly | masternode      |
|                 |                 | 1)              | payment info    |
+-----------------+-----------------+-----------------+-----------------+
| →Block Payment  | object          | Optional(0 or   | Masternode      |
|                 |                 | more)           | payment info    |
|                 |                 |                 | for a block     |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``height``  | number (int)    | R               | The height of   |
|                 |                 | equired(exactly | the block       |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →→              | number (int)    | R               | The hash of the |
| \ ``blockhash`` |                 | equired(exactly | block           |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``amount``  | number (int)    | R               | Amount received |
|                 |                 | equired(exactly | in this block   |
|                 |                 | 1)              | by all          |
|                 |                 |                 | masternodes     |
+-----------------+-----------------+-----------------+-----------------+
| →→\             | array of        | R               | Masternodes     |
| ``masternodes`` | objects         | equired(exactly | that received   |
|                 |                 | 1)              | payments in     |
|                 |                 |                 | this block      |
+-----------------+-----------------+-----------------+-----------------+
| →→→Masternode   | object          | Required(1 or   | Masternode info |
|                 |                 | more)           |                 |
+-----------------+-----------------+-----------------+-----------------+
| →→→→            | string (hex)    | R               | The hash of the |
| \ ``proTxHash`` |                 | equired(exactly | corresponding   |
|                 |                 | 1)              | ProRegTx        |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | Amount received |
| →→→\ ``amount`` |                 | equired(exactly | by this         |
|                 |                 | 1)              | masternode      |
+-----------------+-----------------+-----------------+-----------------+
| →               | array of        | R               | Payees who      |
| →→→\ ``payees`` | objects         | equired(exactly | received a      |
|                 |                 | 1)              | share of this   |
|                 |                 |                 | payment         |
+-----------------+-----------------+-----------------+-----------------+
| →→→→→Payee      | objects         | Required(1 or   | Payee           |
|                 |                 | more)           | info→→→         |
|                 |                 |                 | →→\ ``address`` |
+-----------------+-----------------+-----------------+-----------------+
| →→→             | string          | R               | Payee           |
| →→→\ ``script`` |                 | equired(exactly | scriptPubKey    |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →→→             | number (int)    | R               | Amount received |
| →→→\ ``amount`` |                 | equired(exactly | by this payee   |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

.. code:: bash

   dash-cli -testnet masternode payments

Result (block 407822):

.. code:: json

   [
     {
       "height": 407822,
       "blockhash": "0000030ae0ca262af12918eac9069e61c481e17ac65a26c87ee44427699c3f3a",
       "amount": 1253571429,
       "masternodes": [
         {
           "proTxHash": "c865b48a09801c61dce5804f28fe994c72577254ea1859cf1c37fe92b428e757",
           "amount": 1253571429,
           "payees": [
             {
               "address": "yP72QU7PMG8wNQVTtaQrCLVKCmbuDeAK91",
               "script": "76a9141e8efb321d5cad77e28e4e6b51546932579d02f588ac",
               "amount": 1253571429
             }
           ]
         }
       ]
     }
   ]

*See also:*

-  `Masternode Winner <#masternode-winner>`__: prints info on the next
   masternode winner to vote for.
-  `Masternode Winners <#masternode-winners>`__: prints the list of
   masternode winners.

Masternode Status
-----------------

The ``masternode status`` RPC prints masternode status information.

*Parameters: none*

*Result—masternode status info*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | object          | R               | Masternode      |
|                 |                 | equired(exactly | status info     |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``outpoint`` | string          | R               | The             |
|                 |                 | equired(exactly | masternode’s    |
|                 |                 | 1)              | outpoint        |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``service``  | string          | R               | The IP          |
|                 |                 | equired(exactly | address/port of |
|                 |                 | 1)              | the masternode  |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | The             |
| \ ``proTxHash`` |                 | equired(exactly | masternode’s    |
|                 |                 | 1)              | ProRegTx hash   |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``c          | string (hex)    | R               | The             |
| ollateralHash`` |                 | equired(exactly | masternode’s    |
|                 |                 | 1)              | collateral hash |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``co         | int             | R               | Index of the    |
| llateralIndex`` |                 | equired(exactly | collateral      |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``dmnState`` | object          | R               | Deterministic   |
|                 |                 | equired(exactly | Masternode      |
|                 |                 | 1)              | State           |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | The IP          |
| →\ ``service``  |                 | equired(exactly | address/port of |
|                 |                 | 1)              | the masternode  |
+-----------------+-----------------+-----------------+-----------------+
| →               | int             | R               | Block height at |
| →\ ``reg        |                 | equired(exactly | which the       |
| isteredHeight`` |                 | 1)              | masternode was  |
|                 |                 |                 | registered      |
+-----------------+-----------------+-----------------+-----------------+
| →               | int             | R               | Block height at |
| →\ ``l          |                 | equired(exactly | which the       |
| astPaidHeight`` |                 | 1)              | masternode was  |
|                 |                 |                 | last paid       |
+-----------------+-----------------+-----------------+-----------------+
| →               | int             | R               | Current         |
| →\              |                 | equired(exactly | p               |
| ``PoSePenalty`` |                 | 1)              | roof-of-service |
|                 |                 |                 | penalty         |
+-----------------+-----------------+-----------------+-----------------+
| →               | int             | R               | Block height at |
| →\ ``PoSe       |                 | equired(exactly | which the       |
| RevivedHeight`` |                 | 1)              | masternode was  |
|                 |                 |                 | last revived    |
|                 |                 |                 | from a PoSe ban |
+-----------------+-----------------+-----------------+-----------------+
| →               | int             | R               | Block height at |
| →\ ``           |                 | equired(exactly | which the       |
| PoSeBanHeight`` |                 | 1)              | masternode was  |
|                 |                 |                 | last PoSe       |
|                 |                 |                 | banned          |
+-----------------+-----------------+-----------------+-----------------+
| →               | int             | R               | Reason code for |
| →\ ``rev        |                 | equired(exactly | of masternode   |
| ocationReason`` |                 | 1)              | operator key    |
|                 |                 |                 | revocation      |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | The owner       |
| →\ `            |                 | equired(exactly | address         |
| `ownerAddress`` |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | The voting      |
| →\ ``           |                 | equired(exactly | address         |
| votingAddress`` |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | The payout      |
| →\ ``           |                 | equired(exactly | address         |
| payoutAddress`` |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | The operator    |
| →\ ``p          |                 | equired(exactly | public key      |
| ubKeyOperator`` |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | Optional(0 or   | The operator    |
| →\ ``operator   |                 | 1)              | payout address  |
| PayoutAddress`` |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``status``   | string          | Required(1 or   | The             |
|                 |                 | more)           | masternode’s    |
|                 |                 |                 | status          |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.13.2*

.. code:: bash

   dash-cli -testnet masternode status

Result:

.. code:: json

   {
     "outpoint": "d1be3a1aa0b9516d06ed180607c168724c21d8ccf6c5a3f5983769830724c357-0",
     "service": "45.32.237.76:19999",
     "proTxHash": "04d06d16b3eca2f104ef9749d0c1c17d183eb1b4fe3a16808fd70464f03bcd63",
     "collateralHash": "d1be3a1aa0b9516d06ed180607c168724c21d8ccf6c5a3f5983769830724c357",
     "collateralIndex": 0,
     "dmnState": {
       "service": "45.32.237.76:19999",
       "registeredHeight": 7402,
       "lastPaidHeight": 59721,
       "PoSePenalty": 0,
       "PoSeRevivedHeight": 61915,
       "PoSeBanHeight": -1,
       "revocationReason": 0,
       "ownerAddress": "yT8DDY5NkX4ZtBkUVz7y1RgzbakCnMPogh",
       "votingAddress": "yMLrhooXyJtpV3R2ncsxvkrh6wRennNPoG",
       "payoutAddress": "yTsGq4wV8WF5GKLaYV2C43zrkr2sfTtysT",
       "pubKeyOperator": "02a2e2673109a5e204f8a82baf628bb5f09a8dfc671859e84d2661cae03e6c6e198a037e968253e94cd099d07b98e94e"
     },
     "state": "READY",
     "status": "Ready"
   }

Masternode Winner
-----------------

[block:callout] { “type”: “danger”, “body”: “This RPC has been
deprecated and will be removed in a future version of Dash Core”,
“title”: “Deprecated in Dash Core 0.17.0” } [/block] The
``masternode winner`` RPC prints info on the next masternode winner to
vote for.

*Parameters: none*

*Result—next masternode winner info*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | object          | R               | Winning         |
|                 |                 | equired(exactly | masternode info |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``height``   | int             | R               | Block height    |
|                 |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``IP:port``  | string          | R               | The IP          |
|                 |                 | equired(exactly | address/port of |
|                 |                 | 1)              | the masternode  |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | The             |
| \ ``proTxHash`` |                 | equired(exactly | masternode’s    |
|                 |                 | 1)              | Provider        |
|                 |                 |                 | Registration    |
|                 |                 |                 | transaction     |
|                 |                 |                 | hash            |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``outpoint`` | string          | R               | The             |
|                 |                 | equired(exactly | masternode’s    |
|                 |                 | 1)              | outpoint        |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``payee``    | string          | R               | Payee address   |
|                 |                 | equired(exactly |                 |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.14.0*

.. code:: bash

   dash-cli -testnet masternode winner

Result:

.. code:: json

   {
     "height": 76191,
     "IP:port": "34.242.53.163:26173",
     "proTxHash": "024608d03beb6a6065f14a29a837c68ae449ac1e17056819366ca0b72b6dd81f",
     "outpoint": "024608d03beb6a6065f14a29a837c68ae449ac1e17056819366ca0b72b6dd81f-1",
     "payee": "yhp182AnF7gUAyHiWgSbDrKqHKt2dzhoyW"
   }

*See also:*

-  `Masternode Payments <#masternode-payments>`__: prints an array of
   deterministic masternodes and their payments for the specified block.
-  `Masternode Winners <#masternode-winners>`__: prints the list of
   masternode winners.

Masternode Winners
------------------

The ``masternode winners`` RPC prints the list of masternode winners.

By default, the 10 previous block winners, the current block winner, and
the next 20 block winners are displayed. More past block winners can be
requested via the optional ``count`` parameter.

*Parameter #1—count*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Count           | string (hex)    | O               | Number of       |
|                 |                 | ptional(exactly | previous block  |
|                 |                 | 1)              | winners to      |
|                 |                 |                 | display         |
|                 |                 |                 | (default: 10)   |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—filter*

====== ====== =================== ============================
Name   Type   Presence            Description
====== ====== =================== ============================
Filter string Optional(exactly 1) Payment address to filter by
====== ====== =================== ============================

*Result—masternode winners*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | object          | R               | Winning         |
|                 |                 | equired(exactly | masternode info |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →Masternode     | int             | R               | Key: Block      |
| Winner          |                 | equired(exactly | heightValue:    |
|                 |                 | 1)              | payee address.  |
|                 |                 |                 | As of Dash Core |
|                 |                 |                 | 0.17.0, all     |
|                 |                 |                 | payees will be  |
|                 |                 |                 | listed          |
|                 |                 |                 | (e.g. both      |
|                 |                 |                 | owner and       |
|                 |                 |                 | operator where  |
|                 |                 |                 | applicable).    |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.17.0*

.. code:: bash

   dash-cli -testnet masternode winners

Result (current block - 37458):

.. code:: json

   {
     "37448": "ygSWwhyzU61FNEta8gDh8gfoH5EZZUvc5m,yP8A3cbdxRtLRduy5mXDsBnJtMzHWs6ZXr",
     "37449": "yjGZLzSSoFfTFgLDJrgniXfYxu3xF9xKQg",
     "37450": "yRTo1wXWoNnPFWcQVepKGXuLsoypnPkGWj",
     "37451": "yYMFRAYZ25XspHZ1EXC39wUMx9FhoC5VT2",
     "37452": "yX5y3otE4LitGYiSfZhVH4LdbwHShdzQ8v",
     "37453": "yX5y3otE4LitGYiSfZhVH4LdbwHShdzQ8v",
     "37454": "yUamtYUFhqUxCMny3JTcZJTyttVt8SYFug",
     "37455": "yU35XcdGMnj8Exa2ZZqCg4ongiNqQwpeUZ",
     "37456": "yaJc6tADbEjxQBAC69ugWNoTFpzxqkcgWd",
     "37457": "yf4WpwRX17p7YRkHJPQpHMXTwzi5s2VDcR",
     "37458": "ydbfUYWfLm6xg7Y5aBLjy38DvksrvNcHEc",
     "37459": "yYp9k2iuDptT2MB7qVZtVy6ModHtLXFjio",
     "37460": "yP1UHNx26ShYLej56SbHiTiPAUv2QppbUv",
     "37461": "yaCtZRpiYnVFMyWELHZF74v9ayLKCLPcC9",
     "37462": "ygYFnLHoVRyhRoxd6fXQ9nmEafX4eLoWkB",
     "37463": "yM5kTThWi8MnAFtZqx98Zipp1BbyypUZGK",
     "37464": "yeDY39aiqbBHbJft5F6rokR23EaZca6UTU",
     "37465": "yMME1ns1xfpGS2XbFPktsNyp7Cjr1BoJxb",
     "37466": "ycn5RWc4Ruo35FTS8bJwugVyCEkfVcrw9a",
     "37467": "yUTDkKKhbvDrnwkiaoP8HvqxTNC6rNnUe2",
     "37468": "yTstes2nSaSpvu9nTapiCGnjCLvLD5fUqt",
     "37469": "Unknown",
     "37470": "Unknown",
     "37471": "Unknown",
     "37472": "Unknown",
     "37473": "Unknown",
     "37474": "Unknown",
     "37475": "Unknown",
     "37476": "Unknown",
     "37477": "Unknown"
   }

Get a filtered list of masternode winners

.. code:: bash

   dash-cli -testnet masternode winners 150 "yTZ99"

Result:

.. code:: json

   {
     "37338": "yTZ99fCnjNu33RDRtawf81iwJ9uxXFmkgM",
     "37339": "yTZ99fCnjNu33RDRtawf81iwJ9uxXFmkgM",
     "37432": "yTZ99fCnjNu33RDRtawf81iwJ9uxXFmkgM",
     "37433": "yTZ99fCnjNu33RDRtawf81iwJ9uxXFmkgM"
   }

*See also:*

-  `MasternodeList <#masternodelist>`__: returns a list of masternodes
   in different modes.
-  `Masternode Payments <#masternode-payments>`__: prints an array of
   deterministic masternodes and their payments for the specified block.
-  `Masternode Winner <#masternode-winner>`__: prints info on the next
   masternode winner to vote for.

Masternodelist
==============

The ```masternodelist`` RPC <#masternodelist>`__ returns a list of
masternodes in different modes.

*Parameter #1—List mode*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``mode``        | string          | Optional        | The mode to run |
|                 |                 | (exactly        | list in         |
|                 |                 | 1);Required to  |                 |
|                 |                 | use ``filter``  |                 |
+-----------------+-----------------+-----------------+-----------------+

*Mode Options (Default=json)*

+-----------------------+-----------------------+-----------------------+
| Mode                  | Description           |                       |
+=======================+=======================+=======================+
| ``addr``              | Print IP address      |                       |
|                       | associated with a     |                       |
|                       | masternode (can be    |                       |
|                       | additionally          |                       |
|                       | filtered, partial     |                       |
|                       | match)                |                       |
+-----------------------+-----------------------+-----------------------+
| ``full``              | Print info in format  |                       |
|                       | ‘status payee         |                       |
|                       | lastpaidtime          |                       |
|                       | lastpaidblock IP’     |                       |
|                       | (can be additionally  |                       |
|                       | filtered, partial     |                       |
|                       | match)                |                       |
+-----------------------+-----------------------+-----------------------+
| ``info``              | Print info in format  |                       |
|                       | ‘status payee IP’     |                       |
|                       | (can be additionally  |                       |
|                       | filtered, partial     |                       |
|                       | match)                |                       |
+-----------------------+-----------------------+-----------------------+
| ``json`` (Default)    | Print info in JSON    |                       |
|                       | format (can be        |                       |
|                       | additionally          |                       |
|                       | filtered, partial     |                       |
|                       | match)                |                       |
+-----------------------+-----------------------+-----------------------+
| ``lastpaidblock``     | Print the last block  |                       |
|                       | height a node was     |                       |
|                       | paid on the network   |                       |
+-----------------------+-----------------------+-----------------------+
| ``lastpaidtime``      | Print the last time a |                       |
|                       | node was paid on the  |                       |
|                       | network               |                       |
+-----------------------+-----------------------+-----------------------+
| ``owneraddress``      | Print the masternode  |                       |
|                       | owner Dash address    |                       |
+-----------------------+-----------------------+-----------------------+
| ``payee``             | Print Dash address    |                       |
|                       | associated with a     |                       |
|                       | masternode (can be    |                       |
|                       | additionally          |                       |
|                       | filtered, partial     |                       |
|                       | match)                |                       |
+-----------------------+-----------------------+-----------------------+
| ``pubKeyOperator``    | Print the masternode  |                       |
|                       | operator public key   |                       |
+-----------------------+-----------------------+-----------------------+
| ``status``            | Print masternode      |                       |
|                       | status: ENABLED /     |                       |
|                       | POSE_BANNED (can be   |                       |
|                       | additionally          |                       |
|                       | filtered, partial     |                       |
|                       | match)                |                       |
+-----------------------+-----------------------+-----------------------+
| ``votingaddress``     | Print the masternode  |                       |
|                       | voting Dash address   |                       |
+-----------------------+-----------------------+-----------------------+

*Parameter #2—List filter*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``filter``      | string          | O               | Filter results. |
|                 |                 | ptional(exactly | Partial match   |
|                 |                 | 1)              | by outpoint by  |
|                 |                 |                 | default in all  |
|                 |                 |                 | modes,          |
|                 |                 |                 | additional      |
|                 |                 |                 | matches in some |
|                 |                 |                 | modes are also  |
|                 |                 |                 | available.      |
+-----------------+-----------------+-----------------+-----------------+

*Result—the masternode list*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object/null     | R               | Information     |
|                 |                 | equired(exactly | about the       |
|                 |                 | 1)              | masternode sync |
|                 |                 |                 | status          |
+-----------------+-----------------+-----------------+-----------------+
| →Masternode     | string          | Required(1 or   | The requested   |
| Info            |                 | more)           | masternode      |
|                 |                 |                 | info. Output    |
|                 |                 |                 | varies based on |
|                 |                 |                 | selected        |
|                 |                 |                 | ``mode`` and    |
|                 |                 |                 | ``filter``      |
|                 |                 |                 | parameters      |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 18.0.0*

Get unfiltered Masternode list in default mode

.. code:: bash

   dash-cli -testnet masternodelist

Result:

.. code:: json

   {
     "cf9840b16f0c28e39beb89e06b995a12425f6a836ed899aa8203a448b31724c6-0": {
       "proTxHash": "56948a65b01f83e37958e194840496c8a728f9f64c0335fd13e7561cfd6c14c0",
       "address": "52.36.244.225:19999",
       "payee": "yP8A3cbdxRtLRduy5mXDsBnJtMzHWs6ZXr",
       "status": "ENABLED",
       "pospenaltyscore": 0,
       "lastpaidtime": 1650381993,
       "lastpaidblock": 708881,
       "owneraddress": "yhfoDh5AmCT2psSyKyAuY7CgwzGDygPm9Y",
       "votingaddress": "yhfoDh5AmCT2psSyKyAuY7CgwzGDygPm9Y",
       "collateraladdress": "yLXmtxaxAZ18WRwcjmZwVfmLSH5TdAXPzV",
       "pubkeyoperator": "00ea87eef15f38c1a844d77348e687794c601277011c933026cdfdb649524632b055feea3539abc48472cb447d281d65"
     },
     "08ff009239143f043be80da2c501a4a505fc5b142b27a1e00590f172dd323799-0": {
       "proTxHash": "6cc91317f635db636537b9f01ae4441de5ff97bb59a9c998224080f11d7d88e0",
       "address": "52.39.164.105:19999",
       "payee": "yP8A3cbdxRtLRduy5mXDsBnJtMzHWs6ZXr",
       "status": "ENABLED",
       "pospenaltyscore": 0,
       "lastpaidtime": 1650398582,
       "lastpaidblock": 708995,
       "owneraddress": "yXay1hpiuwqdWMUoTzJknA1ZQLUHZDghS2",
       "votingaddress": "yXay1hpiuwqdWMUoTzJknA1ZQLUHZDghS2",
       "collateraladdress": "ycbvtNd6HqP6eFa9WEFeS1q9bsh1J7DG18",
       "pubkeyoperator": "03d890d1bc938b48547c8730000c4dcd5a940e55e82d1322ea600cc90c319111603fa52f928ec9d5dd29784b96f34af9"
     },
     "6f506a5dbb0e88fe83242d4f9641b6f4a2616d22c889b74f29b5bfa6291dfdca-1": {
       "proTxHash": "34f19e4ac7e1b2abbded7fe0d19991cde34eb7797d8e81fe01d6e73db2097180",
       "address": "3.20.70.18:10003",
       "payee": "ySLuZnXd8ciZNXV5FEWpqRryT4viJdwazM",
       "status": "POSE_BANNED",
       "pospenaltyscore": 365,
       "lastpaidtime": 1578387987,
       "lastpaidblock": 243103,
       "owneraddress": "yP2swcUzQ7MHtaubyg3uKrRcM7oWER3X9Q",
       "votingaddress": "yP2swcUzQ7MHtaubyg3uKrRcM7oWER3X9Q",
       "collateraladdress": "yX8n7oXabwxJHS3tDW2nfB4viPFi98NAwS",
       "pubkeyoperator": "0fb7164d86058e2b22c4a6f6917714dfa4a2cb4d54bebbf3c9300ebfe1759b33d15b0b68e32999aae19bf0dd92341e40"
     }
   }

Get a filtered Masternode list

.. code:: bash

   dash-cli -testnet masternodelist full "NEW"

Result:

.. code:: json

   {
     "cf9840b16f0c28e39beb89e06b995a12425f6a836ed899aa8203a448b31724c6-0": "           ENABLED 0 yP8A3cbdxRtLRduy5mXDsBnJtMzHWs6ZXr 1650381993 708881 52.36.244.225:19999",
     "6f506a5dbb0e88fe83242d4f9641b6f4a2616d22c889b74f29b5bfa6291dfdca-1": "       POSE_BANNED 365 ySLuZnXd8ciZNXV5FEWpqRryT4viJdwazM 1578387987 243103 3.20.70.18:10003",
     "52feab469665752944186952b361815ba53e5296457de6d1bd23baf80db36f0a-0": "           ENABLED 0 yac7gAK3cKuDnYD4RmGaJiMnCssgu7Q7A5 1650385230 708906 54.185.249.226:19999",
     "c44721bf0b5be6de4b7706eaef15c2d500bba148e21947907bd52f77d18bebbd-0": "           ENABLED 0 yP8A3cbdxRtLRduy5mXDsBnJtMzHWs6ZXr 1650397178 708981 34.219.169.55:19999",
     "893d83df0dfc05ac284b96c2b31d4db1d34552f814bd834b8c75f43c56945565-1": "           ENABLED 0 yP8A3cbdxRtLRduy5mXDsBnJtMzHWs6ZXr 1650385930 708913 54.213.219.155:19999",
     "23464abc2f724de235e69e72ef5068f1b2701521b88e7b2740b93978ff54909b-1": "       POSE_BANNED 346 yhDhNgubyF1NEmT6qtiTXTbr3KMiJwUTxk 1555111615  78830 198.199.74.241:19999",
     "d0e28cd51e674fe00af162877cb70e0ceed1906fef616b2d231ef009f6e4786a-0": "           ENABLED 0 yP8A3cbdxRtLRduy5mXDsBnJtMzHWs6ZXr 1650396597 708974 34.220.41.134:19999",
     "213a1c4beb216e8697d8d15701c248bcf91a889f4989fbb4275293b3aa697802-1": "       POSE_BANNED 0 yfzLmLJUEYcC8LEygLB6AQFxCwsF3fV9Fw 1564053511 143062 [::]:0"
   }

*See also:*

-  `Masternode <#masternode>`__: provides a set of commands for managing
   masternodes and displaying information about them.
-  `MnSync <#mnsync>`__: returns the sync status, updates to the next
   step or resets it entirely.

MnSync
======

The ```mnsync`` RPC <#mnsync>`__ returns the sync status, updates to the
next step or resets it entirely.

*Parameter #1—Command mode*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``mode``        | string          | R               | The command     |
|                 |                 | equired(exactly | mode to         |
|                 |                 | 1)              | u               |
|                 |                 |                 | se:\ ``status`` |
|                 |                 |                 | - Get           |
|                 |                 |                 | masternode sync |
|                 |                 |                 | s               |
|                 |                 |                 | tatus\ ``next`` |
|                 |                 |                 | - Move to next  |
|                 |                 |                 | sync            |
|                 |                 |                 | a               |
|                 |                 |                 | sset\ ``reset`` |
|                 |                 |                 | - Reset sync    |
|                 |                 |                 | status          |
+-----------------+-----------------+-----------------+-----------------+

**Command Mode - ``status``**

*Result—the sync status*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object/null     | R               | Information     |
|                 |                 | equired(exactly | about the       |
|                 |                 | 1)              | masternode sync |
|                 |                 |                 | status          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``AssetID``  | number (int)    | R               | The sync asset  |
|                 |                 | equired(exactly | ID              |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | The sync asset  |
| \ ``AssetName`` |                 | equired(exactly | name            |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``A          | number (int)    | R               | The sync asset  |
| ssetStartTime`` |                 | equired(exactly | start time      |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``Attempt``  | number (int)    | R               | The sync        |
|                 |                 | equired(exactly | attempt number  |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``IsBlo      | boolean         | R               | Blockchain sync |
| ckchainSynced`` |                 | equired(exactly | status          |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``IsSynced`` | boolean         | R               | Masternode sync |
|                 |                 | equired(exactly | status          |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``IsFailed`` | boolean         | R               | *Removed in     |
|                 |                 | equired(exactly | Dash Core       |
|                 |                 | 1)              | 0.16            |
|                 |                 |                 | .0*\ Masternode |
|                 |                 |                 | list sync fail  |
|                 |                 |                 | status          |
+-----------------+-----------------+-----------------+-----------------+

Sync Assets

+-----------------------+-----------------------+-----------------------+
| AssetID               | AssetName             |                       |
+=======================+=======================+=======================+
| 0                     | MA                    |                       |
|                       | STERNODE_SYNC_INITIAL |                       |
|                       | (merged with          |                       |
|                       | ``MASTERN             |                       |
|                       | ODE_SYNC_BLOCKCHAIN`` |                       |
|                       | in Dash Core 0.16.0)  |                       |
+-----------------------+-----------------------+-----------------------+
| 1                     | MASTE                 |                       |
|                       | RNODE_SYNC_BLOCKCHAIN |                       |
|                       | (previously           |                       |
|                       | ``MASTE               |                       |
|                       | RNODE_SYNC_WAITING``) |                       |
+-----------------------+-----------------------+-----------------------+
| 4                     | MASTE                 |                       |
|                       | RNODE_SYNC_GOVERNANCE |                       |
+-----------------------+-----------------------+-----------------------+
| -1                    | M                     |                       |
|                       | ASTERNODE_SYNC_FAILED |                       |
|                       | (removed in Dash Core |                       |
|                       | 0.16.0)               |                       |
+-----------------------+-----------------------+-----------------------+
| 999                   | MAS                   |                       |
|                       | TERNODE_SYNC_FINISHED |                       |
+-----------------------+-----------------------+-----------------------+

*Example from Dash Core 0.16.0*

Get Masternode sync status

.. code:: bash

   dash-cli -testnet mnsync status

Result:

.. code:: json

   {
     "AssetID": 999,
     "AssetName": "MASTERNODE_SYNC_FINISHED",
     "AssetStartTime": 1507662300,
     "Attempt": 0,
     "IsBlockchainSynced": true,
     "IsSynced": true,
   }

**Command Mode - ``next``**

*Result—next command return status*

========== ====== =================== =====================
Name       Type   Presence            Description
========== ====== =================== =====================
``result`` string Required(exactly 1) Command return status
========== ====== =================== =====================

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet mnsync next

Result:

.. code:: text

   sync updated to MASTERNODE_SYNC_GOVERNANCE

**Command Mode - ``reset``**

*Result—reset command return status*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | string          | R               | Command return  |
|                 |                 | equired(exactly | statu           |
|                 |                 | 1)              | s:\ ``success`` |
|                 |                 |                 | or ``failure``  |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet mnsync reset

Result:

.. code:: text

   success

*See also:*

-  `Masternode <#masternode>`__: provides a set of commands for managing
   masternodes and displaying information about them.
-  `MasternodeList <#masternodelist>`__: returns a list of masternodes
   in different modes.

# CoinJoin

As of Dash Core 0.12.3, this is not supported on masternodes since
wallet functionality is disabled on them for security reasons.

The ```coinjoin`` RPC <#coinjoin>`__ controls the CoinJoin process
(previously named ``privatesend`` prior to Dash Core 0.17.0).

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``mode``        | string          | R               | The command     |
|                 |                 | equired(exactly | mode to         |
|                 |                 | 1)              | use:\ ``start`` |
|                 |                 |                 | - Start         |
|                 |                 |                 | Coi             |
|                 |                 |                 | nJoin\ ``stop`` |
|                 |                 |                 | - Stop          |
|                 |                 |                 | Coin            |
|                 |                 |                 | Join\ ``reset`` |
|                 |                 |                 | - Reset         |
|                 |                 |                 | CoinJoin        |
+-----------------+-----------------+-----------------+-----------------+

**Command Mode - ``start``**

*Result—start command return status*

========== ====== =================== =====================
Name       Type   Presence            Description
========== ====== =================== =====================
``result`` string Required(exactly 1) Command return status
========== ====== =================== =====================

*Example from Dash Core 0.17.0*

.. code:: bash

   dash-cli -testnet coinjoin start

Result:

.. code:: text

   Mixing started successfully

**Command Mode - ``stop``**

*Result—stop command return status*

========== ====== =================== =====================
Name       Type   Presence            Description
========== ====== =================== =====================
``result`` string Required(exactly 1) Command return status
========== ====== =================== =====================

*Example from Dash Core 0.17.0*

.. code:: bash

   dash-cli -testnet coinjoin stop

Result:

.. code:: text

   Mixing was stopped

**Command Mode - ``reset``**

*Result—reset command return status*

========== ====== =================== =====================
Name       Type   Presence            Description
========== ====== =================== =====================
``result`` string Required(exactly 1) Command return status
========== ====== =================== =====================

*Example from Dash Core 0.17.0*

.. code:: bash

   dash-cli -testnet coinjoin reset

Result:

.. code:: text

   Mixing was reset

*See also: none*

Spork
=====

The ```spork`` RPC <#spork>`__ reads or updates spork settings on the
network.

To display the status of sporks, use the ``show`` or ``active`` syntax.

*Parameter #1—Command mode*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``mode``        | string          | R               | The command     |
|                 |                 | equired(exactly | mode to         |
|                 |                 | 1)              | use:\ ``show``  |
|                 |                 |                 | - Display spork |
|                 |                 |                 | val             |
|                 |                 |                 | ues\ ``active`` |
|                 |                 |                 | - Display spork |
|                 |                 |                 | activation      |
|                 |                 |                 | status          |
+-----------------+-----------------+-----------------+-----------------+

**Command Mode - ``show``**

*Result—spork values*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | Object          |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | status          |
+-----------------+-----------------+-----------------+-----------------+
| →\              | int64_t         | Required(1 or   | Spork value     |
| ``Spork Value`` |                 | more)           | (epoch datetime |
|                 |                 |                 | to              |
|                 |                 |                 | enable/disable) |
+-----------------+-----------------+-----------------+-----------------+

*Example from Dash Core 0.16.0*

.. code:: bash

   dash-cli -testnet spork show

Result:

.. code:: json

   {
     "SPORK_2_INSTANTSEND_ENABLED": 0,
     "SPORK_3_INSTANTSEND_BLOCK_FILTERING": 0,
     "SPORK_6_NEW_SIGS": 0,
     "SPORK_9_SUPERBLOCKS_ENABLED": 0,
     "SPORK_17_QUORUM_DKG_ENABLED": 0,
     "SPORK_19_CHAINLOCKS_ENABLED": 1,
     "SPORK_21_QUORUM_ALL_CONNECTED": 4070908800
   }

**Command Mode - ``active``**

*Result—spork active status*

+------------------+--------+------------------+------------------+
| Name             | Type   | Presence         | Description      |
+==================+========+==================+==================+
| ``result``       | object | Required(exactly | Object           |
|                  |        | 1)               | containing       |
|                  |        |                  | status           |
+------------------+--------+------------------+------------------+
| →\ ``Spork Act   | bool   | Required(1 or    | Spork activation |
| ivation Status`` |        | more)            | status           |
+------------------+--------+------------------+------------------+

*Example from Dash Core 0.14.0*

.. code:: bash

   dash-cli -testnet spork active

Result:

.. code:: json

   {
     "SPORK_2_INSTANTSEND_ENABLED": true,
     "SPORK_3_INSTANTSEND_BLOCK_FILTERING": true,
     "SPORK_6_NEW_SIGS": true,
     "SPORK_9_SUPERBLOCKS_ENABLED": true,
     "SPORK_17_QUORUM_DKG_ENABLED": true,
     "SPORK_19_CHAINLOCKS_ENABLED": true,
     "SPORK_21_QUORUM_ALL_CONNECTED": false
   }

To update the state of a spork activation, use the ``<name> [value]``
syntax.

**Command Mode - ``update``**

*Parameter #1—Spork name*

======== ====== =================== ===============================
Name     Type   Presence            Description
======== ====== =================== ===============================
``name`` string Required(exactly 1) The name of the spork to update
======== ====== =================== ===============================

*Parameter #2—Spork value*

========= ==== =================== =============================
Name      Type Presence            Description
========= ==== =================== =============================
``value`` int  Required(exactly 1) The value to assign the spork
========= ==== =================== =============================

*Result—spork update status*

+------------+--------+---------------------+----------------------+
| Name       | Type   | Presence            | Description          |
+============+========+=====================+======================+
| ``result`` | object | Required(exactly 1) | Update status        |
|            |        |                     | (``success`` or      |
|            |        |                     | ``failure``)         |
+------------+--------+---------------------+----------------------+

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet spork SPORK_2_INSTANTSEND_ENABLED 0

Result:

.. code:: bash

   failure

*See also: none*

VoteRaw
=======

The ```voteraw`` RPC <#voteraw>`__ compiles and relays a governance vote
with provided external signature instead of signing vote internally

*Parameter #1—masternode collateral transaction hash*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``m             | string (hex)    | R               | Hash of the     |
| asternode-colla |                 | equired(exactly | masternode      |
| teral-tx-hash`` |                 | 1)              | collateral      |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—masternode collateral transaction index*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``ma            | string          | R               | Index of the    |
| sternode-collat |                 | equired(exactly | masternode      |
| eral-tx-index`` |                 | 1)              | collateral      |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—governance hash*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``go            | string (hex)    | R               | Hash of the     |
| vernance-hash`` |                 | equired(exactly | governance      |
|                 |                 | 1)              | object          |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #4—vote signal*

+------------+--------+---------------------+----------------------+
| Name       | Type   | Presence            | Description          |
+============+========+=====================+======================+
| ``signal`` | string | Required(exactly 1) | Vote signal:         |
|            |        |                     | ``funding``,         |
|            |        |                     | ``valid``, or        |
|            |        |                     | ``delete``           |
+------------+--------+---------------------+----------------------+

*Parameter #5—vote outcome*

+-------------+--------+---------------------+---------------------+
| Name        | Type   | Presence            | Description         |
+=============+========+=====================+=====================+
| ``outcome`` | string | Required(exactly 1) | Vote outcome:       |
|             |        |                     | ``yes``, ``no``, or |
|             |        |                     | ``abstain``         |
+-------------+--------+---------------------+---------------------+

*Parameter #6—time*

======== ======= =================== ===========
Name     Type    Presence            Description
======== ======= =================== ===========
``time`` int64_t Required(exactly 1) Create time
======== ======= =================== ===========

*Parameter #7—vote signature*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``vote-sig``    | string (base64) | R               | The vote        |
|                 |                 | equired(exactly | signature       |
|                 |                 | 1)              | created by      |
|                 |                 |                 | external        |
|                 |                 |                 | application     |
|                 |                 |                 | (i.e. `Dash     |
|                 |                 |                 | Masternode      |
|                 |                 |                 | T               |
|                 |                 |                 | ool <https://gi |
|                 |                 |                 | thub.com/Bertra |
|                 |                 |                 | nd256/dash-mast |
|                 |                 |                 | ernode-tool>`__ |
|                 |                 |                 | or              |
|                 |                 |                 | `dashmnb <      |
|                 |                 |                 | https://github. |
|                 |                 |                 | com/chaeplin/da |
|                 |                 |                 | shmnb>`__).Must |
|                 |                 |                 | match the Dash  |
|                 |                 |                 | Core            |
|                 |                 |                 | (`governance    |
|                 |                 |                 | vote signature  |
|                 |                 |                 | format <https   |
|                 |                 |                 | ://github.com/d |
|                 |                 |                 | ashpay/dash/blo |
|                 |                 |                 | b/v0.15.x/src/g |
|                 |                 |                 | overnance/gover |
|                 |                 |                 | nance-vote.cpp# |
|                 |                 |                 | L180-L181>`__). |
+-----------------+-----------------+-----------------+-----------------+

*Result—votes for specified governance*

====== ====== =================== ===============
Name   Type   Presence            Description
====== ====== =================== ===============
Result object Required(exactly 1) The vote result
====== ====== =================== ===============

*Example from Dash Core 0.12.2*

.. code:: bash

   dash-cli -testnet voteraw \
   f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f 1 \
   65a358fefaace40fc07053350be23e519178519290f963dab8ba92f6f85f98c3 \
   funding yes 1512507255 \
   H1jXKZQp1TZWBPW11E665OwmGBYV1038FohEr0au7zp+O5BCKmVDP/3rGq38ZMy3KOpwnBu6ehd6jlas79hsRBY=

Result:

.. code:: bash

   Voted successfully

*See also:*

-  `GObject <#gobject>`__: provides a set of commands for managing
   governance objects and displaying information about them.
