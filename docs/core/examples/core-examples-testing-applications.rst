Dash Core provides several network options designed to let developers
test their applications with reduced risks and limitations.

Testnet
=======

When run with no arguments, all Dash Core programs default to Dash’s
main network (<>). However, for development, it’s safer and cheaper to
use Dash’s test network (<>) where the <> spent have no real-world
value. Testnet also relaxes some restrictions (such as standard
transaction checks) so you can test functions which might currently be
disabled by default on <>.

To use testnet, use the argument ``-testnet`` with ``dash-cli``,
``dashd`` or ``dash-qt`` or add ``testnet=1`` to your ``dash.conf`` file
as `described earlier <core-examples-configuration-file>`__. To get free
duffs for testing, check the faucets listed below. Some are community
supported and due to potentially frequent Testnet changes, one or more
of them may be unavailable at a given time:

-  `Testnet Faucet - Dash Core
   Group <https://testnet-faucet.dash.org/>`__
-  `Testnet Faucet -
   Crowdnode.io <http://faucet.test.dash.crowdnode.io/>`__

Testnet is a public resource provided for free by Dash Core Group and
members of the community, so please don’t abuse it.

Regtest mode
============

For situations where interaction with random <> and <> is unnecessary or
unwanted, Dash Core’s <> (regtest mode) lets you instantly create a
brand-new private <> with the same basic rules as testnet—but one major
difference: you choose when to create new blocks, so you have complete
control over the environment.

Many developers consider regtest mode the preferred way to develop new
applications. The following example will let you create a regtest
environment after you first `configure
dashd <core-examples-configuration-file>`__.

.. code:: bash

   > dashd -regtest -daemon
   Dash Core server starting

Start ``dashd`` in regtest mode to create a private block chain.

.. code:: text

   ## Dash Core
   dash-cli -regtest generate 101

Generate 101 blocks using a special RPC which is only available in
regtest mode. This takes less than a second on a generic PC. Because
this is a new block chain using Dash’s default rules, the first blocks
pay a <> of 500 dash. Unlike <>, in regtest mode only the first 150
blocks pay a reward of 500 dash. However, a block must have 100 <>
before that reward can be spent, so we generate 101 blocks to get access
to the <> from block #1.

.. code:: bash

   dash-cli -regtest getbalance
   500.00000000

Verify that we now have 500 dash available to spend.

You can now use Dash Core RPCs prefixed with ``dash-cli -regtest``.

Regtest wallets and block chain state (chainstate) are saved in the
``regtest`` subdirectory of the Dash Core configuration directory. You
can safely delete the ``regtest`` subdirectory and restart Dash Core to
start a new regtest. (See the `Developer Examples
Introduction <core-examples-introduction>`__ for default configuration
directory locations on various operating systems. **Always back up
mainnet wallets before performing dangerous operations such as
deleting**.)

The complete set of regtest-specific arguments can be found on the
```dashd`` Arguments and Commands
page <dash-core-wallet-arguments-and-commands-dashd#regtest-options>`__.

Devnet mode
===========

Overview
--------

Developer networks (devnets) have some aspects of testnet and some
aspects of regtest. Unlike testnet, multiple independent devnets can be
created and coexist without interference. Devnets can consist of nodes
running on the same computer, on a small private network, or distributed
across the internet.

Each devnet is identified by a name which is hardened into a “devnet
genesis” block that is automatically positioned at height 1. Validation
rules ensure that a <> from ``devnet=test1`` will not accept blocks from
``devnet=test2``. This is done by checking the expected devnet <>. Also,
the devnet name is put into the sub-version field of the ```version``
message <core-ref-p2p-network-control-messages#version>`__. If a node
connects to the wrong <>, it will immediately be disconnected.

The genesis block of the devnet is the same as the one from regtest.
This starts the devnet with a very low <>, allowing quick generation of
a sufficient balance to create a <>.

Configuration
-------------

To use devnet, use the argument ``-devnet=<name>`` with ``dash-cli``,
``dashd``\ or ``dash-qt`` or add ``devnet=<name>`` to your ``dash.conf``
file as `described earlier <core-examples-configuration-file>`__.

Devnets must be assigned both ``-port`` and ``-rpcport`` unless they are
not listening (``-listen=0``). It is possible to run a devnet on a
private (RFC1918) network by using the ``-allowprivatenet=1`` argument.

Example devnet start command:

.. code:: bash

   > dashd -devnet=mydevnet -rpcport=18998 -port=18999 -daemon
   Dash Core server starting

Devnet-specific options
~~~~~~~~~~~~~~~~~~~~~~~

Devnets can use 3 devnet-specific options to enable quickly mining large
amounts of Dash. This enables quick establishment of test masternodes,
etc. The following ``dash.conf`` excerpt shows these configuration
options in use:

::

   # First 1000 blocks mined with the lowest difficulty (like regtest)
   # and first 500 blocks mined with a block subsidity multiplied by 10
   # This allows immediate MN registration (DIP3 activates on block 2)
   minimumdifficultyblocks=1000
   highsubsidyblocks=500
   highsubsidyfactor=10

The complete set of devnet-specific arguments can be found on the
```dashd`` Arguments and Commands
page <dash-core-wallet-arguments-and-commands-dashd#devnet-options>`__.

Management
----------

Devnet wallets and block chain state (chainstate) are saved in the
``devnet-<name>`` subdirectory of the Dash Core configuration directory.
You can safely delete the ``devnet-<name>`` subdirectory and restart
Dash Core to start a new devnet. (See the `Developer Examples
Introduction <core-examples-introduction>`__ for default configuration
directory locations on various operating systems. **Always back up
mainnet wallets before performing dangerous operations such as
deleting.**)

An old devnet can be easily dropped and a new one started just by
destroying all nodes and recreating them with a new devnet name. This
works best in combination with an automated deployment using something
like Ansible and Terraform. The `Dash Network
Deploy <https://github.com/dashevo/dash-network-deploy>`__ tool provides
a way to do this.

Network type comparison
=======================

Each network type has some unique characteristics to support development
and testing. The tables below summarize some of the significant
differences between the 4 network types.

Network characteristics
-----------------------

+--------------+---------+--------------+--------------+--------------+
|              | Mainnet | `Testnet <   | `Re          | `            |
|              |         | #testnet>`__ | gtest <#regt | Devnet <#dev |
|              |         |              | est-mode>`__ | net-mode>`__ |
+==============+=========+==============+==============+==============+
| Public       | Yes     | Yes          | No           | Optional     |
| network      |         |              |              |              |
+--------------+---------+--------------+--------------+--------------+
| Private      | No      | No           | Yes          | Optional     |
| network      |         |              |              |              |
+--------------+---------+--------------+--------------+--------------+
| Number of    | 1       | 1            | Unlimited    | Unlimited /  |
| networks     |         |              |              | Unique       |
|              |         |              |              | (named)      |
+--------------+---------+--------------+--------------+--------------+

..

   📘 Using sporks

   To enable or disable sporks on a regtest or devnet, set ``sporkaddr``
   and ``sporkkey`` in the ``dash.conf`` config file. Any valid Dash
   address / private key can be used. You can get an address using the
   ```getnewaddress``
   RPC <core-api-ref-remote-procedure-calls-wallet#getnewaddress>`__ and
   retrieve its private key using the ```dumpprivkey``
   RPC <core-api-ref-remote-procedure-calls-wallet#dumpprivkey>`__.

Mining characteristics
----------------------

+-----------------+-----------------+-----------------+-----------------+
| Network Type    | Difficulty      |                 |                 |
|                 | adjustment      |                 |                 |
|                 | algorithm       |                 |                 |
+=================+=================+=================+=================+
| `Testne         | Mainnet         |                 |                 |
| t <#testnet>`__ | algorithm, but  |                 |                 |
|                 | `allows minimum |                 |                 |
|                 | difficulty      |                 |                 |
|                 | block           |                 |                 |
|                 | s <https://gith |                 |                 |
|                 | ub.com/dashpay/ |                 |                 |
|                 | dash/blob/v0.17 |                 |                 |
|                 | .0.3/src/pow.cp |                 |                 |
|                 | p#L142-L146>`__ |                 |                 |
|                 | if no blocks    |                 |                 |
|                 | are created for |                 |                 |
|                 | 5 minutes       |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| `Regtest <#r    | Mines blocks at |                 |                 |
| egtest-mode>`__ | the `minimum    |                 |                 |
|                 | difficulty      |                 |                 |
|                 | level <         |                 |                 |
|                 | https://github. |                 |                 |
|                 | com/dashpay/das |                 |                 |
|                 | h/blob/v0.17.0. |                 |                 |
|                 | 3/src/chainpara |                 |                 |
|                 | ms.cpp#L925>`__ |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| `Devnet <#      | Mainnet         |                 |                 |
| devnet-mode>`__ | algorithm after |                 |                 |
|                 | `4001           |                 |                 |
|                 | blocks <        |                 |                 |
|                 | https://github. |                 |                 |
|                 | com/dashpay/das |                 |                 |
|                 | h/blob/v0.17.0. |                 |                 |
|                 | 3/src/chainpara |                 |                 |
|                 | ms.cpp#L749>`__ |                 |                 |
|                 | unless          |                 |                 |
|                 | overridden by   |                 |                 |
|                 | `               |                 |                 |
|                 | devnet-specific |                 |                 |
|                 | options         |                 |                 |
|                 |  <#devnet-speci |                 |                 |
|                 | fic-options>`__ |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

..

   📘

   See
   `chainparams.cpp <https://github.com/dashpay/dash/blob/master/src/chainparams.cpp>`__
   for details on other differences
