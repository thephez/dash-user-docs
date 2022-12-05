For the ```merkleblock``
message <core-ref-p2p-network-data-messages#merkleblock>`__
documentation on the reference page, an actual <> was retrieved from the
<> and manually processed. This section walks through each step of the
process, demonstrating basic network communication and merkle block
processing. [block:code] { “codes”: [ { “code”: "#!/usr/bin/env
python:raw-latex:`\n`:raw-latex:`\nfrom `time import
sleep:raw-latex:`\nfrom `hashlib import
sha256:raw-latex:`\nimport `struct:raw-latex:`\nimport `sys:raw-latex:`\n`:raw-latex:`\nnetwork`\_string
= "f9beb4d9".decode("hex") #
Mainnet:raw-latex:`\n`:raw-latex:`\ndef `send(msg,payload)::raw-latex:`\n    `##
Command is ASCII text, null padded to 12 bytes:raw-latex:`\n    `command
= msg + ( ( 12 - len(msg) ) \* "\00"
):raw-latex:`\n`:raw-latex:`\n    `## Payload length is a
uint32_t:raw-latex:`\n    `payload_raw =
payload.decode("hex"):raw-latex:`\n    `payload_len = struct.pack("I",
len(payload_raw)):raw-latex:`\n`:raw-latex:`\n    `## Checksum is first
4 bytes of SHA256(SHA256()):raw-latex:`\n    `checksum =
sha256(sha256(payload_raw).digest()).digest()[:4]:raw-latex:`\n`:raw-latex:`\n    `sys.stdout.write(:raw-latex:`\n        `network_string:raw-latex:`\n        `+
command:raw-latex:`\n        `+ payload_len:raw-latex:`\n        `+
checksum:raw-latex:`\n        `+
payload_raw:raw-latex:`\n    `):raw-latex:`\n    `sys.stdout.flush()“,”language“:”python"
} ] } [/block]

To connect to the P2P <>, the trivial Python function above was
developed to compute message headers and send payloads decoded from hex.
[block:code] { “codes”: [ { “code”: “## Create a version
message:raw-latex:`\nsend`("version",:raw-latex:`\n      `"71110100" #
…………………… Protocol Version: 70001:raw-latex:`\n    `+ "0000000000000000"
# ……………. Services: Headers Only (SPV):raw-latex:`\n    `+
"c6925e5400000000" # ……………. Time: 1415484102:raw-latex:`\n    `+
"00000000000000000000000000000000":raw-latex:`\n    `+
"0000ffff7f000001208d" # ………… Receiver IP
Address/Port:raw-latex:`\n    `+
"00000000000000000000000000000000":raw-latex:`\n    `+
"0000ffff7f000001208d" # ………… Sender IP Address/Port:raw-latex:`\n    `+
"0000000000000000" # ……………. Nonce (not used here):raw-latex:`\n    `+
"1b" # ………………………… Bytes in version string:raw-latex:`\n    `+
"2f426974636f696e2e6f726720457861":raw-latex:`\n    `+
"6d706c653a302e392e332f" # ………. Version string:raw-latex:`\n    `+
"93050500" # …………………… Starting block height: 329107:raw-latex:`\n    `+
"00" # ………………………… Relay transactions: false:raw-latex:`\n`)”,
“language”: “python” } ] } [/block]

Peers on the network will not accept any requests until you send them a
```version`` message <core-ref-p2p-network-control-messages#version>`__.
The receiving node will reply with their ```version``
message <core-ref-p2p-network-control-messages#version>`__ and a
```verack`` message <core-ref-p2p-network-control-messages#verack>`__.

.. code:: python

   sleep(1)
   send("verack", "")

We’re not going to validate their ```version``
message <core-ref-p2p-network-control-messages#version>`__ with this
simple script, but we will sleep a short bit and send back our own
```verack`` message <core-ref-p2p-network-control-messages#verack>`__ as
if we had accepted their ```version``
message <core-ref-p2p-network-control-messages#version>`__.

.. code:: python

   send("filterload",
         "02"  # ........ Filter bytes: 2
       + "b50f" # ....... Filter: 1010 1101 1111 0000
       + "0b000000" # ... nHashFuncs: 11
       + "00000000" # ... nTweak: 0/none
       + "00" # ......... nFlags: BLOOM_UPDATE_NONE
   )

We set a <> with the ```filterload``
message <core-ref-p2p-network-control-messages#filterload>`__. This
filter is described in the preceding sections.

.. code:: python

   send("getdata",
         "01" # ................................. Number of inventories: 1
       + "03000000" # ........................... Inventory type: filtered block
       + "a4deb66c0d726b0aefb03ed51be407fb"
       + "ad7331c6e8f9eef231b7000000000000" # ... Block header hash
   )

We request a merkle block for transactions matching our filter,
completing our script.

To run the script, we simply pipe it to the Unix ```netcat``
command <https://en.wikipedia.org/wiki/Netcat>`__ or one of its many
clones, one of which is available for practically any platform. For
example, with the original netcat and using hexdump (``hd``) to display
the output:

.. code:: bash

   ## Connect to the Bitcoin Core peer running on localhost
   python get-merkle.py | nc localhost 8333 | hd

Part of the response is shown in the `Parsing a
MerkleBlock <core-examples-p2p-network-parsing-a-merkleblock>`__
section.
