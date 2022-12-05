Overview
========

Receiving notifications from Dash Core is important for a variety of
use-cases. Although polling
`RPCs <core-api-ref-remote-procedure-calls>`__ can be useful, in some
scenarios it may be more desirable to have publish-subscribe
functionality. Dash Core’s built-in ZeroMQ (ZMQ) support provides the
ability to subscribe to block, transaction, and governance related
messages.

Further information regarding ZMQ support may be found in the `ZMQ API
Reference <core-api-ref-zmq>`__.

Enabling Dash Core ZMQ Notifications
====================================

[block:callout] { “type”: “info”, “body”: “This requires a Dash Core
full node or masternode” } [/block] In the ```dash.conf`` configuration
file <core-examples-configuration-file>`__, add the following `ZMQ
notifications <core-api-ref-zmq#available-notifications>`__ and assign
the address that Dash Core should listen on. The notifications selected
here relate to InstantSend and ChainLocks.

::

   # ZMQ
   zmqpubhashchainlock=tcp://0.0.0.0:20009
   zmqpubhashtx=tcp://0.0.0.0:20009
   zmqpubhashtxlock=tcp://0.0.0.0:20009
   zmqpubrawchainlock=tcp://0.0.0.0:20009
   zmqpubrawtxlock=tcp://0.0.0.0:20009

Restart the Dash Core node once the configuration file has been updated.

JavaScript Example
==================

Requires an installation of `NodeJS <https://nodejs.org/en/download/>`__

1. Install ZeroMq
-----------------

The JavaScript zeromq package is available from
`npmjs.com <https://www.npmjs.com/package/zeromq>`__ and can be
installed from the command line by running:

.. code:: shell

   npm install zeromq@5

[block:callout] { “type”: “warning”, “title”: “ZeroMQ Version”, “body”:
“Version 5 of the zeromq package should be used for compatibility
reasons.” } [/block] ## 2. Subscribe to ZeroMQ Messages

Create a file with the following contents. Then run it by typing
``node <your-filename.js>`` from the command line: [block:code] {
“codes”: [ { “code”: “const zmq =
require(‘zeromq’);:raw-latex:`\nconst `sock =
zmq.socket(‘sub’);:raw-latex:`\nconst `zmqPort =
20009;:raw-latex:`\n`:raw-latex:`\nsock`.connect(‘tcp://127.0.0.1:’ +
zmqPort);:raw-latex:`\n`:raw-latex:`\n`// Subscribe to transaction
notifications:raw-latex:`\nsock`.subscribe(‘hashtx’); // Note: this will
subscribe to hashtxlock also:raw-latex:`\n`:raw-latex:`\n`// Subscribe
to InstantSend/ChainLock
notifications:raw-latex:`\nsock`.subscribe(‘hashchainlock’);:raw-latex:`\nsock`.subscribe(‘hashtxlock’);:raw-latex:`\nsock`.subscribe(‘rawchainlock’);
// Note: this will subscribe to rawchainlocksig
also:raw-latex:`\nsock`.subscribe(‘rawtxlock’); // Note: this will
subscribe to rawtxlocksig
also:raw-latex:`\n`:raw-latex:`\nconsole`.log(‘Subscriber connected to
port %d’, zmqPort);:raw-latex:`\n`:raw-latex:`\nsock`.on(‘message’,
function(topic, message)
{:raw-latex:`\n  `console.log(:raw-latex:`\n    `‘Received’,:raw-latex:`\n    `topic.toString().toUpperCase(),:raw-latex:`\n    `‘containing:\n’,:raw-latex:`\n    `message.toString(‘hex’),:raw-latex:`\n    `‘\\n’:raw-latex:`\n  `);:raw-latex:`\n`});”,
“language”: “javascript” }, { “code”: “import
binascii:raw-latex:`\nimport `asyncio:raw-latex:`\nimport `zmq:raw-latex:`\nimport `zmq.asyncio:raw-latex:`\nimport `signal:raw-latex:`\n`:raw-latex:`\nport `=
20009:raw-latex:`\n`:raw-latex:`\nclass `ZMQHandler()::raw-latex:`\n    `def
**init**\ (self)::raw-latex:`\n        `self.loop =
asyncio.get_event_loop():raw-latex:`\n        `self.zmqContext =
zmq.asyncio.Context():raw-latex:`\n`:raw-latex:`\n        `self.zmqSubSocket
=
self.zmqContext.socket(zmq.SUB):raw-latex:`\n        `self.zmqSubSocket.connect("tcp://127.0.0.1:%i"
% port):raw-latex:`\n`:raw-latex:`\n        `# Subscribe to transaction
notifications:raw-latex:`\n        `self.zmqSubSocket.setsockopt_string(zmq.SUBSCRIBE,
"hashtx"):raw-latex:`\n`:raw-latex:`\n        `# Subscribe to
InstantSend/ChainLock
notifications:raw-latex:`\n        `self.zmqSubSocket.setsockopt_string(zmq.SUBSCRIBE,
"hashtxlock"):raw-latex:`\n        `self.zmqSubSocket.setsockopt_string(zmq.SUBSCRIBE,
"hashchainlock"):raw-latex:`\n        `self.zmqSubSocket.setsockopt_string(zmq.SUBSCRIBE,
"rawchainlock"):raw-latex:`\n        `self.zmqSubSocket.setsockopt_string(zmq.SUBSCRIBE,
"rawtxlock"):raw-latex:`\n`:raw-latex:`\n        `print(‘Subscriber
connected to port
{}’.format(port)):raw-latex:`\n`:raw-latex:`\n    `@asyncio.coroutine:raw-latex:`\n    `def
handle(self) ::raw-latex:`\n        `msg = yield from
self.zmqSubSocket.recv_multipart():raw-latex:`\n        `topic =
msg[0]:raw-latex:`\n        `body =
msg[1]:raw-latex:`\n        `sequence =
"Unknown":raw-latex:`\n`:raw-latex:`\n        `print(‘Received {}
containing:\n{}\n’.format(:raw-latex:`\n            `topic.decode("utf-8"),
:raw-latex:`\n            `binascii.hexlify(body).decode("utf-8"))):raw-latex:`\n`:raw-latex:`\n        `#
schedule ourselves to receive the next
message:raw-latex:`\n        `asyncio.ensure_future(self.handle()):raw-latex:`\n`:raw-latex:`\n    `def
start(self)::raw-latex:`\n        `self.loop.add_signal_handler(signal.SIGINT,
self.stop):raw-latex:`\n        `self.loop.create_task(self.handle()):raw-latex:`\n        `self.loop.run_forever():raw-latex:`\n`:raw-latex:`\n    `def
stop(self)::raw-latex:`\n        `self.loop.stop():raw-latex:`\n        `self.zmqContext.destroy():raw-latex:`\n`:raw-latex:`\ndaemon `=
ZMQHandler():raw-latex:`\ndaemon`.start()”, “language”: “python” } ] }
[/block]

Example Response
----------------

The following response demonstrates the notification provided by Dash
Core when it receives a transaction and then receives the associated
InstantSend lock. The four notifications represent: 1. The TXID of the
transaction is received (``HASHTX``) - at this point the transaction is
not locked 2. The TXID of a locked transaction is received
(``HASHTXLOCK``). Since this is the same value as the ``HASHTX`` already
received, we know that the transaction has now received an InstantSend
lock. 3. The raw transaction (``RAWTXLOCK``) (this could be decoded
using the ```decoderawtransaction``
RPC <core-api-ref-remote-procedure-calls-raw-transactions#decoderawtransaction>`__
for example) 4. A combination of the raw transaction and the InstantSend
`lock signature <core-ref-p2p-network-instantsend-messages#islock>`__
(``RAWTXLOCKSIG``)

::

   Received HASHTX containing:
    b2e128661e3679c3d00cd081e32fdc9a12f44e486e083e6eab998bdfd6f64a9b

   Received HASHTXLOCK containing:
    b2e128661e3679c3d00cd081e32fdc9a12f44e486e083e6eab998bdfd6f64a9b

   Received RAWTXLOCK containing:
    02000000025a4d18da609107e9ea3dc6 ... 5a32ea917a30147d6c9788ac6ea90400

   Received RAWTXLOCKSIG containing:
    02000000025a4d18da609107e9ea3dc6 ... 9e889cee7ba48981ca002e6962a20236
