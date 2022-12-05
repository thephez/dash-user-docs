Take note that for both types of broadcasting, mechanisms are in place
to punish misbehaving <> who take up bandwidth and computing resources
by sending false information. If a peer gets a banscore above the
``-banscore=<n>`` threshold (100 by default), they will be banned for
the number of seconds defined by ``-bantime=<n>``, which is 86,400 by
default (24 hours).

+-------+---------------------+-----------------+---------------------+
| Type  | Misbehavior         | Ban Score       | Description         |
+=======+=====================+=================+=====================+
| Net   | GetBlockTxn Index   | **100**         | Peer relayed a      |
|       | Error               |                 | ```getblocktxn``    |
|       |                     |                 | me                  |
|       |                     |                 | ssage <core-ref-p2p |
|       |                     |                 | -network-data-messa |
|       |                     |                 | ges#getblocktxn>`__ |
|       |                     |                 | with out-of-bound   |
|       |                     |                 | indices             |
+-------+---------------------+-----------------+---------------------+
| Net   | Bloom Filter        | **100**         | Bloom filter        |
|       | Service             |                 | message received    |
|       |                     |                 | from peer that has  |
|       |                     |                 | bloom filter        |
|       |                     |                 | commands disabled   |
|       |                     |                 | by default          |
|       |                     |                 | (protocol version > |
|       |                     |                 | 70201)              |
|       |                     |                 | (``filterload``     |
|       |                     |                 | message,            |
|       |                     |                 | ```filteradd``      |
|       |                     |                 | mess                |
|       |                     |                 | age <core-ref-p2p-n |
|       |                     |                 | etwork-control-mess |
|       |                     |                 | ages#filteradd>`__, |
|       |                     |                 | or ```filterclear`` |
|       |                     |                 | messag              |
|       |                     |                 | e <core-ref-p2p-net |
|       |                     |                 | work-control-messag |
|       |                     |                 | es#filterclear>`__) |
+-------+---------------------+-----------------+---------------------+
| Net   | Block Rejected      | 1               | Peer rejected the   |
|       |                     |                 | block it requested  |
|       |                     |                 | from us             |
+-------+---------------------+-----------------+---------------------+
| Net   | Duplicate Version   | 1               | Duplicate           |
|       |                     |                 | ```version``        |
|       |                     |                 | m                   |
|       |                     |                 | essage <core-ref-p2 |
|       |                     |                 | p-network-control-m |
|       |                     |                 | essages#version>`__ |
|       |                     |                 | received            |
+-------+---------------------+-----------------+---------------------+
| Net   | Wrong Devnet        | **100**         | Peer responded with |
|       |                     |                 | the wrong devnet    |
|       |                     |                 | version             |
|       |                     |                 | (``version``        |
|       |                     |                 | message)            |
+-------+---------------------+-----------------+---------------------+
| Net   | Wrong Devnet        | 1               | Peer connected      |
|       |                     |                 | using the wrong     |
|       |                     |                 | devnet version      |
|       |                     |                 | (``version``        |
|       |                     |                 | message)            |
+-------+---------------------+-----------------+---------------------+
| Net   | No Version          | 1               | Received a message  |
|       |                     |                 | prior to receiving  |
|       |                     |                 | a ```version``      |
|       |                     |                 | m                   |
|       |                     |                 | essage <core-ref-p2 |
|       |                     |                 | p-network-control-m |
|       |                     |                 | essages#version>`__ |
+-------+---------------------+-----------------+---------------------+
| Net   | No Verack           | 1               | After sending       |
|       |                     |                 | ```version``        |
|       |                     |                 | me                  |
|       |                     |                 | ssage <core-ref-p2p |
|       |                     |                 | -network-control-me |
|       |                     |                 | ssages#version>`__, |
|       |                     |                 | received a message  |
|       |                     |                 | other than a        |
|       |                     |                 | ```verack``         |
|       |                     |                 | message <core-ref-p |
|       |                     |                 | 2p-network-control- |
|       |                     |                 | messages#verack>`__ |
|       |                     |                 | back first          |
+-------+---------------------+-----------------+---------------------+
| Net   | Address List Size   | 20              | More than 1000      |
|       |                     |                 | addresses received  |
|       |                     |                 | (``addr`` message)  |
+-------+---------------------+-----------------+---------------------+
| Net   | Inventory List      | 20              | More than           |
|       |                     |                 | ``MAX_INV_SZ``      |
|       |                     |                 | (50000) inventories |
|       |                     |                 | received (``inv``   |
|       |                     |                 | message)            |
+-------+---------------------+-----------------+---------------------+
| Net   | Get Data Size       | 20              | More than           |
|       |                     |                 | ``MAX_INV_SZ``      |
|       |                     |                 | (50000) inventories |
|       |                     |                 | requested           |
|       |                     |                 | (``getdata``        |
|       |                     |                 | message)            |
+-------+---------------------+-----------------+---------------------+
| Net   | Orphan Transaction  | **Varies**      | Peer relayed an     |
|       |                     |                 | invalid orphan      |
|       |                     |                 | transaction. Ban    |
|       |                     |                 | score varies from   |
|       |                     |                 | 0-100 based on the  |
|       |                     |                 | specific reason     |
|       |                     |                 | (values set by      |
|       |                     |                 | ``AcceptToMe        |
|       |                     |                 | moryPoolWorker()``) |
+-------+---------------------+-----------------+---------------------+
| Net   | Bad Transaction     | **Varies**      | Transaction         |
|       |                     |                 | rejected from the   |
|       |                     |                 | mempool             |
+-------+---------------------+-----------------+---------------------+
| Net   | Invalid Header      | **Varies**      | Invalid block       |
|       |                     |                 | header received     |
|       |                     |                 | from peer           |
|       |                     |                 | (``cmpctblock``     |
|       |                     |                 | message)            |
+-------+---------------------+-----------------+---------------------+
| Net   | Invalid             | **100**         | Invalid compact     |
|       | CompactBlock        |                 | block /non-matching |
|       |                     |                 | block transactions  |
|       |                     |                 | received from peer  |
|       |                     |                 | (``cmpctblock``     |
|       |                     |                 | message)            |
+-------+---------------------+-----------------+---------------------+
| Net   | Header List Size    | 20              | More than           |
|       |                     |                 | ``MA                |
|       |                     |                 | X_HEADERS_RESULTS`` |
|       |                     |                 | (2000) headers      |
|       |                     |                 | received            |
|       |                     |                 | (``headers``        |
|       |                     |                 | message)            |
+-------+---------------------+-----------------+---------------------+
| Net   | Header List         | 20              | Non-continous       |
|       | Sequence            |                 | headers sequence    |
|       |                     |                 | received            |
|       |                     |                 | (``headers``        |
|       |                     |                 | message)            |
+-------+---------------------+-----------------+---------------------+
| Net   | Invalid Block       | **Varies**      | Invalid block       |
|       |                     |                 | header received     |
|       |                     |                 | from peer           |
+-------+---------------------+-----------------+---------------------+
| Net   | Bloom Filter Size   | **100**         | Maximum script      |
|       |                     |                 | element size (520)  |
|       |                     |                 | exceeded            |
|       |                     |                 | (``filterload``     |
|       |                     |                 | message or          |
|       |                     |                 | ```filteradd``      |
|       |                     |                 | mess                |
|       |                     |                 | age <core-ref-p2p-n |
|       |                     |                 | etwork-control-mess |
|       |                     |                 | ages#filteradd>`__) |
+-------+---------------------+-----------------+---------------------+
| Net   | MN List Diff        | 1               | Failed to get       |
|       |                     |                 | masternode list     |
|       |                     |                 | diff                |
|       |                     |                 | (``getmnlistd``     |
|       |                     |                 | message)            |
+-------+---------------------+-----------------+---------------------+
| Net   | Unrequested MN List | **100**         | Peer provided an    |
|       | Diff                |                 | unrequested         |
|       |                     |                 | masternode list     |
|       |                     |                 | diff                |
|       |                     |                 | (``mnlistdiff``     |
|       |                     |                 | message)            |
+-------+---------------------+-----------------+---------------------+
| I     | Invalid Lock        | **100**         | Invalid TXID or     |
| nstan | Message             |                 | inputs in lock      |
| tSend |                     |                 | message (``islock`` |
|       |                     |                 | message)            |
+-------+---------------------+-----------------+---------------------+
| I     | Verify Error        | 20              | Peer relayed a      |
| nstan |                     |                 | message that failed |
| tSend |                     |                 | to verify           |
+-------+---------------------+-----------------+---------------------+
| LLMQ  | Invalid             | 10              | Invalid ChainLock   |
| Chai  |                     |                 | message (``clsig``  |
| nLock |                     |                 | message)            |
+-------+---------------------+-----------------+---------------------+
| LLMQ  | Null QcTx           | **100**         | Peer relayed a      |
| Commi |                     |                 | block with a null   |
| tment |                     |                 | commitment          |
+-------+---------------------+-----------------+---------------------+
| LLMQ  | Invalid LLMQ Type   | **100**         | Peer relayed a      |
| Commi |                     |                 | block containing an |
| tment |                     |                 | invalid LLMQ Type   |
+-------+---------------------+-----------------+---------------------+
| LLMQ  | Invalid Height      | **100**         | Peer relayed a      |
| Commi |                     |                 | block that is not   |
| tment |                     |                 | the first block in  |
|       |                     |                 | the DKG interval    |
+-------+---------------------+-----------------+---------------------+
| LLMQ  | Invalid Commitment  | **100**         | Peer relayed a      |
| Commi |                     |                 | block with an       |
| tment |                     |                 | invalid quorum      |
|       |                     |                 | commitment          |
+-------+---------------------+-----------------+---------------------+
| LLMQ  | Empty Message       | **100**         | Peer relayed a      |
| DKG   |                     |                 | message with no     |
|       |                     |                 | payload             |
+-------+---------------------+-----------------+---------------------+
| LLMQ  | Invalid LLMQ Type   | **100**         | Peer relayed a      |
| DKG   |                     |                 | message for an      |
|       |                     |                 | incorrect LLMQ Type |
+-------+---------------------+-----------------+---------------------+
| LLMQ  | Invalid Message     | **100**         | Peer relayed a      |
| DKG   |                     |                 | message that could  |
|       |                     |                 | not be deserialized |
+-------+---------------------+-----------------+---------------------+
| LLMQ  | Preverify Failed    | **100**         | Peer relayed a      |
| DKG   |                     |                 | message that could  |
|       |                     |                 | not be pre-verified |
+-------+---------------------+-----------------+---------------------+
| LLMQ  | Signature           | **100**         | Peer relayed a      |
| DKG   |                     |                 | message with an     |
|       |                     |                 | invalid signature   |
+-------+---------------------+-----------------+---------------------+
| LLMQ  | Full Verify Failed  | **100**         | Peer relayed a      |
| DKG   |                     |                 | message that failed |
|       |                     |                 | full verification   |
+-------+---------------------+-----------------+---------------------+
| LLMQ  | Too Many Messages   | **100**         | Maximum message     |
| Si    |                     |                 | count exceed in     |
| gning |                     |                 | ```qsigsesann``     |
|       |                     |                 | mess                |
|       |                     |                 | age <core-ref-p2p-n |
|       |                     |                 | etwork-quorum-messa |
|       |                     |                 | ges#qsigsesann>`__, |
|       |                     |                 | ```qsigsinv``       |
|       |                     |                 | me                  |
|       |                     |                 | ssage <core-ref-p2p |
|       |                     |                 | -network-quorum-mes |
|       |                     |                 | sages#qsigsinv>`__, |
|       |                     |                 | ```qgetsigs``       |
|       |                     |                 | me                  |
|       |                     |                 | ssage <core-ref-p2p |
|       |                     |                 | -network-quorum-mes |
|       |                     |                 | sages#qgetsigs>`__, |
|       |                     |                 | or ```qbsigs``      |
|       |                     |                 | message <core-ref-  |
|       |                     |                 | p2p-network-quorum- |
|       |                     |                 | messages#qbsigs>`__ |
+-------+---------------------+-----------------+---------------------+
| LLMQ  | Signature           | **100**         | Peer relayed a      |
| Si    |                     |                 | message with an     |
| gning |                     |                 | invalid recovered   |
|       |                     |                 | signature or        |
|       |                     |                 | signature share     |
+-------+---------------------+-----------------+---------------------+
| Maste | Duplicate Message   | **100**         | Only 1 message      |
| rnode |                     |                 | allowed (``mnauth`` |
| Auth  |                     |                 | message)            |
| entic |                     |                 |                     |
| ation |                     |                 |                     |
+-------+---------------------+-----------------+---------------------+
| Maste | Invalid Services    | **100**         | Peer not            |
| rnode |                     |                 | advertising         |
| Auth  |                     |                 | ``NODE_NETWORK`` or |
| entic |                     |                 | ``NODE_BLOOM``      |
| ation |                     |                 | services            |
|       |                     |                 | (``mnauth``         |
|       |                     |                 | message)            |
+-------+---------------------+-----------------+---------------------+
| Maste | Empty Hash          | **100**         | Peer relayed a      |
| rnode |                     |                 | message with a null |
| Auth  |                     |                 | ProRegTx hash       |
| entic |                     |                 | (``mnauth``         |
| ation |                     |                 | message)            |
+-------+---------------------+-----------------+---------------------+
| Maste | Signature           | **100**         | Peer relayed a      |
| rnode |                     |                 | message with an     |
| Auth  |                     |                 | invalid signature   |
| entic |                     |                 | (``mnauth``         |
| ation |                     |                 | message)            |
+-------+---------------------+-----------------+---------------------+
| Maste | Invalid MN          | 10              | Peer not in the     |
| rnode |                     |                 | valid masternode    |
| Auth  |                     |                 | list (``mnauth``    |
| entic |                     |                 | message)            |
| ation |                     |                 |                     |
+-------+---------------------+-----------------+---------------------+
| Maste | Invalid Signature   | 10              | Signature           |
| rnode |                     |                 | verification failed |
| Auth  |                     |                 | (``mnauth``         |
| entic |                     |                 | message)            |
| ation |                     |                 |                     |
+-------+---------------------+-----------------+---------------------+
| Gover | Sync                | 20              | Requesting a        |
| nance |                     |                 | governance sync too |
|       |                     |                 | frequently          |
|       |                     |                 | (``govsync``        |
|       |                     |                 | message with empty  |
|       |                     |                 | hash)               |
+-------+---------------------+-----------------+---------------------+
| Gover | Invalid Object      | 20              | Peer relayed an     |
| nance |                     |                 | invalid governance  |
|       |                     |                 | object (``govobj``  |
|       |                     |                 | message)            |
+-------+---------------------+-----------------+---------------------+
| Gover | Invalid Vote        | 20              | Peer relayed an     |
| nance |                     |                 | invalid/invalid old |
|       |                     |                 | vote(``govobjvote`` |
|       |                     |                 | message)            |
+-------+---------------------+-----------------+---------------------+
| Gover | Unsupported Vote    | 20              | Vote signal outside |
| nance | Signal              |                 | the accepted range  |
|       |                     |                 | (see                |
|       |                     |                 | ```govobjvote``     |
|       |                     |                 | message             |
|       |                     |                 | <core-ref-p2p-netwo |
|       |                     |                 | rk-governance-messa |
|       |                     |                 | ges#govobjvote>`__) |
+-------+---------------------+-----------------+---------------------+
| Coi   | Signature           | 10              | Peer relayed a      |
| nJoin |                     |                 | message with an     |
|       |                     |                 | invalid signature   |
|       |                     |                 | (``dsq`` message)   |
+-------+---------------------+-----------------+---------------------+
| Spork | Invalid Time        | **100**         | Peer relayed a      |
|       |                     |                 | spork with a        |
|       |                     |                 | timestamp too far   |
|       |                     |                 | in the future       |
|       |                     |                 | (``spork`` message) |
+-------+---------------------+-----------------+---------------------+
| Spork | Signature           | **100**         | Peer relayed a      |
|       |                     |                 | spork with an       |
|       |                     |                 | invalid signature   |
|       |                     |                 | (``spork`` message) |
+-------+---------------------+-----------------+---------------------+
