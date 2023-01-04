Arguments and Commands
**********************

Overview
========

All command-line options (except for ``-conf``) may be specified in a
configuration file, and all configuration file options may also be
specified on the command line. Command-line options override values set
in the configuration file. The configuration file is a list of
``<setting>=<value>`` pairs, one per line, with optional comments
starting with the ``#`` character.

The configuration file is not automatically created; you can create it
using your favorite plain-text editor. By default, dash-qt (or dashd)
will look for a file named ``dash.conf`` in the Dash data directory, but
both the data directory and the configuration file path may be changed
using the ``-datadir`` and ``-conf`` command-line arguments.

+-----------------------+-----------------------+-----------------------+
| Platform              | Path to data folder   | Typical path to       |
|                       |                       | configuration file    |
+=======================+=======================+=======================+
| Linux                 | ~/                    | /home/usernam         |
|                       |                       | e/.dashcore/dash.conf |
+-----------------------+-----------------------+-----------------------+
| macOS                 | ~/Library/Application | /Users/usernam        |
|                       | Support/              | e/Library/Application |
|                       |                       | Suppo                 |
|                       |                       | rt/DashCore/dash.conf |
+-----------------------+-----------------------+-----------------------+
| Windows               | %APPDATA%             | *(Vista-10)*          |
|                       |                       | C:\Users\u            |
|                       |                       | sername\AppData\Roami |
|                       |                       | ng\DashCore\dash.conf |
+-----------------------+-----------------------+-----------------------+
| Windows               | %APPDATA%             | *(2000-XP)*           |
|                       |                       | C:\Documents and      |
|                       |                       | Settings              |
|                       |                       | \username\Application |
|                       |                       | Da                    |
|                       |                       | ta\DashCore\dash.conf |
+-----------------------+-----------------------+-----------------------+

..

   📘 Testnet/Devnet modes

   Note: if running Dash in testnet mode, the sub-folder ``testnet3``
   will be appended to the data directory automatically. Likewise, if
   running in devnet mode, the subfolder ``devnet-"devnet name"`` will
   be appended to the data directory.

Command Line Arguments
======================

The following sections provide details of the command line arguments for
each of the four components distributed in Dash Core releases.

========= =============================
Component Description
========= =============================
dashd     Dash Core daemon
dash-qt   Dash Core wallet GUI
dash-cli  Dash Core RPC Client
dash-tx   Dash Core transaction utility
========= =============================

dashd
-----

See `here <dash-core-wallet-arguments-and-commands-dashd>`__ for all
option details.

.. code:: bash

   Usage:
     dashd [options]                     Start Dash Core Daemon

dash-qt
-------

See `here <dash-core-wallet-arguments-and-commands-dash-qt>`__ for all
option details.

.. code:: bash

   Usage:
     dash-qt [command-line options]                     

dash-cli
--------

See `here <dash-core-wallet-arguments-and-commands-dash-cli>`__ for all
option details.

.. code:: bash

   Usage:
     dash-cli [options] <command> [params]  Send command to Dash Core
     dash-cli [options] -named <command> [name=value] ... Send command to Dash Core (with named arguments)
     dash-cli [options] help                List commands
     dash-cli [options] help <command>      Get help for a command

dash-tx
-------

See `here <dash-core-wallet-arguments-and-commands-dash-tx>`__ for all
option details.

.. code:: bash

   Usage:
     dash-tx [options] <hex-tx> [commands]  Update hex-encoded dash transaction
     dash-tx [options] -create [commands]   Create hex-encoded dash transaction

.. toctree::
   :maxdepth: 2
   :titlesonly: 

   dash-core-wallet-arguments-and-commands-dashd
   dash-core-wallet-arguments-and-commands-dash-qt
   dash-core-wallet-arguments-and-commands-dash-cli
   dash-core-wallet-arguments-and-commands-dash-tx
   dash-core-wallet-arguments-and-commands-dash-wallet
