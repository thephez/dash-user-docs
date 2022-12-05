GET Block
=========

The ``GET block`` operation gets a block with a particular header hash
from the local block database either as a JSON object or as a serialized
block.

*Request*

.. code:: text

   GET /block/<hash>.<format>

*Parameter #1—the header hash of the block to retrieve*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Header Hash     | path (hex)      | R               | The hash of the |
|                 |                 | equired(exactly | header of the   |
|                 |                 | 1)              | block to get,   |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the output format*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Format          | suffix          | R               | Set to          |
|                 |                 | equired(exactly | ``.json`` for   |
|                 |                 | 1)              | decoded block   |
|                 |                 |                 | contents in     |
|                 |                 |                 | JSON, or        |
|                 |                 |                 | ``.bin`` or     |
|                 |                 |                 | ``hex`` for a   |
|                 |                 |                 | serialized      |
|                 |                 |                 | block in binary |
|                 |                 |                 | or hex          |
+-----------------+-----------------+-----------------+-----------------+

*Response as JSON*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | object          | R               | An object       |
|                 |                 | equired(exactly | containing the  |
|                 |                 | 1)              | requested block |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``hash``     | string (hex)    | R               | The hash of     |
|                 |                 | equired(exactly | this block’s    |
|                 |                 | 1)              | block header    |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order. This is  |
|                 |                 |                 | the same as the |
|                 |                 |                 | hash provided   |
|                 |                 |                 | in parameter #1 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | number (int)    | R               | The number of   |
| confirmations`` |                 | equired(exactly | confirmations   |
|                 |                 | 1)              | the             |
|                 |                 |                 | transactions in |
|                 |                 |                 | this block      |
|                 |                 |                 | have, starting  |
|                 |                 |                 | at 1 when this  |
|                 |                 |                 | block is at the |
|                 |                 |                 | tip of the best |
|                 |                 |                 | block chain.    |
|                 |                 |                 | This score will |
|                 |                 |                 | be -1 if the    |
|                 |                 |                 | the block is    |
|                 |                 |                 | not part of the |
|                 |                 |                 | best block      |
|                 |                 |                 | chain           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``size``     | number (int)    | R               | The size of     |
|                 |                 | equired(exactly | this block in   |
|                 |                 | 1)              | serialized      |
|                 |                 |                 | block format,   |
|                 |                 |                 | counted in      |
|                 |                 |                 | bytes           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``height``   | number (int)    | R               | The height of   |
|                 |                 | equired(exactly | this block on   |
|                 |                 | 1)              | its block chain |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``version``  | number (int)    | R               | This block’s    |
|                 |                 | equired(exactly | version number. |
|                 |                 | 1)              | See `block      |
|                 |                 |                 | version         |
|                 |                 |                 | nu              |
|                 |                 |                 | mbers <core-ref |
|                 |                 |                 | -block-chain-bl |
|                 |                 |                 | ock-headers#blo |
|                 |                 |                 | ck-versions>`__ |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (int)    | R               | This block’s    |
|  ``versionHex`` |                 | equired(exactly | version number  |
|                 |                 | 1)              | formatted in    |
|                 |                 |                 | hexadecimal.    |
+-----------------+-----------------+-----------------+-----------------+
| →\              | string (hex)    | R               | The merkle root |
|  ``merkleroot`` |                 | equired(exactly | for this block, |
|                 |                 | 1)              | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``tx``       | array           | R               | An array        |
|                 |                 | equired(exactly | containing all  |
|                 |                 | 1)              | transactions in |
|                 |                 |                 | this block. The |
|                 |                 |                 | transactions    |
|                 |                 |                 | appear in the   |
|                 |                 |                 | array in the    |
|                 |                 |                 | same order they |
|                 |                 |                 | appear in the   |
|                 |                 |                 | serialized      |
|                 |                 |                 | block           |
+-----------------+-----------------+-----------------+-----------------+
| → →Transaction  | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing a    |
|                 |                 |                 | particular      |
|                 |                 |                 | transaction     |
|                 |                 |                 | within this     |
|                 |                 |                 | block           |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``txid`` | string (hex)    | R               | The             |
|                 |                 | equired(exactly | transaction’s   |
|                 |                 | 1)              | TXID encoded as |
|                 |                 |                 | hex in RPC byte |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``size`` | number (int)    | R               | *Added in       |
|                 |                 | equired(exactly | Bitcoin Core    |
|                 |                 | 1)              | 0.12.0*\ The    |
|                 |                 |                 | serialized      |
|                 |                 |                 | transaction     |
|                 |                 |                 | size            |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (int)    | R               | The transaction |
| →\ ``version``  |                 | equired(exactly | format version  |
|                 |                 | 1)              | number          |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``type`` | number (int)    | R               | *Added in Dash  |
|                 |                 | equired(exactly | Core            |
|                 |                 | 1)              | 0.13.0.0*\ The  |
|                 |                 |                 | transaction     |
|                 |                 |                 | format type     |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (int)    | R               | The             |
| →\ ``locktime`` |                 | equired(exactly | transaction’s   |
|                 |                 | 1)              | locktime:       |
|                 |                 |                 | either a Unix   |
|                 |                 |                 | epoch date or   |
|                 |                 |                 | block height;   |
|                 |                 |                 | see the         |
|                 |                 |                 | `locktime       |
|                 |                 |                 | parsing         |
|                 |                 |                 | rules <core     |
|                 |                 |                 | -guide-transact |
|                 |                 |                 | ions-locktime-a |
|                 |                 |                 | nd-sequence-num |
|                 |                 |                 | ber#locktime_pa |
|                 |                 |                 | rsing_rules>`__ |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``vin``  | array           | R               | An array of     |
|                 |                 | equired(exactly | objects with    |
|                 |                 | 1)              | each object     |
|                 |                 |                 | being an input  |
|                 |                 |                 | vector (vin)    |
|                 |                 |                 | for this        |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Input objects   |
|                 |                 |                 | will have the   |
|                 |                 |                 | same order      |
|                 |                 |                 | within the      |
|                 |                 |                 | array as they   |
|                 |                 |                 | have in the     |
|                 |                 |                 | transaction, so |
|                 |                 |                 | the first input |
|                 |                 |                 | listed will be  |
|                 |                 |                 | input 0         |
+-----------------+-----------------+-----------------+-----------------+
| → → → →Input    | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing one  |
|                 |                 |                 | of this         |
|                 |                 |                 | transaction’s   |
|                 |                 |                 | inputs. May be  |
|                 |                 |                 | a regular input |
|                 |                 |                 | or a coinbase   |
+-----------------+-----------------+-----------------+-----------------+
| → → → →         | string          | Optional(0 or   | The TXID of the |
| →\ ``txid``     |                 | 1)              | outpoint being  |
|                 |                 |                 | spent, encoded  |
|                 |                 |                 | as hex in RPC   |
|                 |                 |                 | byte order. Not |
|                 |                 |                 | present if this |
|                 |                 |                 | is a coinbase   |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → → → →         | number (int)    | Optional(0 or   | The output      |
| →\ ``vout``     |                 | 1)              | index number    |
|                 |                 |                 | (vout) of the   |
|                 |                 |                 | outpoint being  |
|                 |                 |                 | spent. The      |
|                 |                 |                 | first output in |
|                 |                 |                 | a transaction   |
|                 |                 |                 | has an index of |
|                 |                 |                 | ``0``. Not      |
|                 |                 |                 | present if this |
|                 |                 |                 | is a coinbase   |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → → → →         | object          | Optional(0 or   | An object       |
| →               |                 | 1)              | describing the  |
| \ ``scriptSig`` |                 |                 | signature       |
|                 |                 |                 | script of this  |
|                 |                 |                 | input. Not      |
|                 |                 |                 | present if this |
|                 |                 |                 | is a coinbase   |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → → → → →       | string          | R               | The signature   |
| →\ ``asm``      |                 | equired(exactly | script in       |
|                 |                 | 1)              | decoded form    |
|                 |                 |                 | with            |
|                 |                 |                 | n               |
|                 |                 |                 | on-data-pushing |
|                 |                 |                 | opcodes listed  |
+-----------------+-----------------+-----------------+-----------------+
| → → → → →       | string (hex)    | R               | The signature   |
| →\ ``hex``      |                 | equired(exactly | script encoded  |
|                 |                 | 1)              | as hex          |
+-----------------+-----------------+-----------------+-----------------+
| → → → →         | string (hex)    | Optional(0 or   | The coinbase    |
| →\ ``coinbase`` |                 | 1)              | (similar to the |
|                 |                 |                 | hex field of a  |
|                 |                 |                 | scriptSig)      |
|                 |                 |                 | encoded as hex. |
|                 |                 |                 | Only present if |
|                 |                 |                 | this is a       |
|                 |                 |                 | coinbase        |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → → → →         | number (Dash)   | O               | The number of   |
| →\ ``value``    |                 | ptional(exactly | Dash paid to    |
|                 |                 | 1)              | this output.    |
|                 |                 |                 | May be          |
|                 |                 |                 | ``0``.Only      |
|                 |                 |                 | present if      |
|                 |                 |                 | ``spentindex``  |
|                 |                 |                 | enabled         |
+-----------------+-----------------+-----------------+-----------------+
| → → → →         | number (duffs)  | O               | The number of   |
| →\ ``valueSat`` |                 | ptional(exactly | duffs paid to   |
|                 |                 | 1)              | this output.    |
|                 |                 |                 | May be          |
|                 |                 |                 | ``0``.Only      |
|                 |                 |                 | present if      |
|                 |                 |                 | ``spentindex``  |
|                 |                 |                 | enabled         |
+-----------------+-----------------+-----------------+-----------------+
| → → → → →       | string : array  | Optional(0 or   | The P2PKH or    |
| →               |                 | 1)              | P2SH addresses  |
| \ ``addresses`` |                 |                 | used in this    |
|                 |                 |                 | transaction, or |
|                 |                 |                 | the computed    |
|                 |                 |                 | P2PKH address   |
|                 |                 |                 | of any pubkeys  |
|                 |                 |                 | in this         |
|                 |                 |                 | transaction.    |
|                 |                 |                 | This array will |
|                 |                 |                 | not be returned |
|                 |                 |                 | for             |
|                 |                 |                 | ``nulldata`` or |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | script          |
|                 |                 |                 | types.Only      |
|                 |                 |                 | present if      |
|                 |                 |                 | ``spentindex``  |
|                 |                 |                 | enabled         |
+-----------------+-----------------+-----------------+-----------------+
| → → → → → →     | string          | Required(1 or   | A P2PKH or P2SH |
| →Address        |                 | more)           | address         |
+-----------------+-----------------+-----------------+-----------------+
| → → → →         | number (int)    | R               | The input       |
| →\ ``sequence`` |                 | equired(exactly | sequence number |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``vout`` | array           | R               | An array of     |
|                 |                 | equired(exactly | objects each    |
|                 |                 | 1)              | describing an   |
|                 |                 |                 | output vector   |
|                 |                 |                 | (vout) for this |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Output objects  |
|                 |                 |                 | will have the   |
|                 |                 |                 | same order      |
|                 |                 |                 | within the      |
|                 |                 |                 | array as they   |
|                 |                 |                 | have in the     |
|                 |                 |                 | transaction, so |
|                 |                 |                 | the first       |
|                 |                 |                 | output listed   |
|                 |                 |                 | will be output  |
|                 |                 |                 | 0               |
+-----------------+-----------------+-----------------+-----------------+
| → → → →Output   | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing one  |
|                 |                 |                 | of this         |
|                 |                 |                 | transaction’s   |
|                 |                 |                 | outputs         |
+-----------------+-----------------+-----------------+-----------------+
| → → → →         | number (Dash)   | R               | The number of   |
| →\ ``value``    |                 | equired(exactly | Dash paid to    |
|                 |                 | 1)              | this output.    |
|                 |                 |                 | May be ``0``    |
+-----------------+-----------------+-----------------+-----------------+
| → → → →         | number (duffs)  | R               | The number of   |
| →\ ``valueSat`` |                 | equired(exactly | duffs paid to   |
|                 |                 | 1)              | this output.    |
|                 |                 |                 | May be ``0``    |
+-----------------+-----------------+-----------------+-----------------+
| → → → →         | number (int)    | R               | The output      |
| →\ ``n``        |                 | equired(exactly | index number of |
|                 |                 | 1)              | this output     |
|                 |                 |                 | within this     |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → → → →         | object          | R               | An object       |
| →\ `            |                 | equired(exactly | describing the  |
| `scriptPubKey`` |                 | 1)              | pubkey script   |
+-----------------+-----------------+-----------------+-----------------+
| → → → → →       | string          | R               | The pubkey      |
| →\ ``asm``      |                 | equired(exactly | script in       |
|                 |                 | 1)              | decoded form    |
|                 |                 |                 | with            |
|                 |                 |                 | n               |
|                 |                 |                 | on-data-pushing |
|                 |                 |                 | opcodes listed  |
+-----------------+-----------------+-----------------+-----------------+
| → → → → →       | string (hex)    | R               | The pubkey      |
| →\ ``hex``      |                 | equired(exactly | script encoded  |
|                 |                 | 1)              | as hex          |
+-----------------+-----------------+-----------------+-----------------+
| → → → → →       | number (int)    | Optional(0 or   | The number of   |
| →\ ``reqSigs``  |                 | 1)              | signatures      |
|                 |                 |                 | required; this  |
|                 |                 |                 | is always ``1`` |
|                 |                 |                 | for P2PK,       |
|                 |                 |                 | P2PKH, and P2SH |
|                 |                 |                 | (including P2SH |
|                 |                 |                 | multisig        |
|                 |                 |                 | because the     |
|                 |                 |                 | redeem script   |
|                 |                 |                 | is not          |
|                 |                 |                 | available in    |
|                 |                 |                 | the pubkey      |
|                 |                 |                 | script). It may |
|                 |                 |                 | be greater than |
|                 |                 |                 | 1 for bare      |
|                 |                 |                 | multisig. This  |
|                 |                 |                 | value will not  |
|                 |                 |                 | be returned for |
|                 |                 |                 | ``nulldata`` or |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | script types    |
|                 |                 |                 | (see the        |
|                 |                 |                 | ``type`` key    |
|                 |                 |                 | below)          |
+-----------------+-----------------+-----------------+-----------------+
| → → → → →       | string          | Optional(0 or   | The type of     |
| →\ ``type``     |                 | 1)              | script. This    |
|                 |                 |                 | will be one of  |
|                 |                 |                 | the following:• |
|                 |                 |                 | ``pubkey`` for  |
|                 |                 |                 | a P2PK script•  |
|                 |                 |                 | ``pubkeyhash``  |
|                 |                 |                 | for a P2PKH     |
|                 |                 |                 | script•         |
|                 |                 |                 | ``scripthash``  |
|                 |                 |                 | for a P2SH      |
|                 |                 |                 | script•         |
|                 |                 |                 | ``multisig``    |
|                 |                 |                 | for a bare      |
|                 |                 |                 | multisig        |
|                 |                 |                 | script•         |
|                 |                 |                 | ``nulldata``    |
|                 |                 |                 | for nulldata    |
|                 |                 |                 | scripts•        |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | for unknown     |
|                 |                 |                 | scripts         |
+-----------------+-----------------+-----------------+-----------------+
| → → → → →       | string : array  | Optional(0 or   | The P2PKH or    |
| →               |                 | 1)              | P2SH addresses  |
| \ ``addresses`` |                 |                 | used in this    |
|                 |                 |                 | transaction, or |
|                 |                 |                 | the computed    |
|                 |                 |                 | P2PKH address   |
|                 |                 |                 | of any pubkeys  |
|                 |                 |                 | in this         |
|                 |                 |                 | transaction.    |
|                 |                 |                 | This array will |
|                 |                 |                 | not be returned |
|                 |                 |                 | for             |
|                 |                 |                 | ``nulldata`` or |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | script types    |
+-----------------+-----------------+-----------------+-----------------+
| → → → → → →     | string          | Required(1 or   | A P2PKH or P2SH |
| →Address        |                 | more)           | address         |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (int)    | Optional(0 or   | *Added in Dash  |
| →\ ``ext        |                 | 1)              | Core            |
| raPayloadSize`` |                 |                 | 0.13.0.0*\ Size |
|                 |                 |                 | of the DIP2     |
|                 |                 |                 | extra payload.  |
|                 |                 |                 | Only present if |
|                 |                 |                 | it’s a DIP2     |
|                 |                 |                 | special         |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string (hex)    | Optional(0 or   | *Added in Dash  |
| →\ `            |                 | 1)              | Core            |
| `extraPayload`` |                 |                 | 0.13.0.0*\ Hex  |
|                 |                 |                 | encoded DIP2    |
|                 |                 |                 | extra payload   |
|                 |                 |                 | data. Only      |
|                 |                 |                 | present if it’s |
|                 |                 |                 | a DIP2 special  |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``time``     | number (int)    | R               | The value of    |
|                 |                 | equired(exactly | the *time*      |
|                 |                 | 1)              | field in the    |
|                 |                 |                 | block header,   |
|                 |                 |                 | indicating      |
|                 |                 |                 | approximately   |
|                 |                 |                 | when the block  |
|                 |                 |                 | was created     |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (int)    | R               | *Added in       |
|  ``mediantime`` |                 | equired(exactly | Bitcoin Core    |
|                 |                 | 1)              | 0.12.0*\ The    |
|                 |                 |                 | median time of  |
|                 |                 |                 | the 11 blocks   |
|                 |                 |                 | before the most |
|                 |                 |                 | recent block on |
|                 |                 |                 | the blockchain. |
|                 |                 |                 | Used for        |
|                 |                 |                 | validating      |
|                 |                 |                 | transaction     |
|                 |                 |                 | locktime under  |
|                 |                 |                 | BIP113          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``nonce``    | number (int)    | R               | The nonce which |
|                 |                 | equired(exactly | was successful  |
|                 |                 | 1)              | at turning this |
|                 |                 |                 | particular      |
|                 |                 |                 | block into one  |
|                 |                 |                 | that could be   |
|                 |                 |                 | added to the    |
|                 |                 |                 | best block      |
|                 |                 |                 | chain           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``bits``     | string (hex)    | R               | The value of    |
|                 |                 | equired(exactly | the *nBits*     |
|                 |                 | 1)              | field in the    |
|                 |                 |                 | block header,   |
|                 |                 |                 | indicating the  |
|                 |                 |                 | target          |
|                 |                 |                 | threshold this  |
|                 |                 |                 | block’s header  |
|                 |                 |                 | had to pass     |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (real)   | R               | The estimated   |
|  ``difficulty`` |                 | equired(exactly | amount of work  |
|                 |                 | 1)              | done to find    |
|                 |                 |                 | this block      |
|                 |                 |                 | relative to the |
|                 |                 |                 | estimated       |
|                 |                 |                 | amount of work  |
|                 |                 |                 | done to find    |
|                 |                 |                 | block 0         |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | The estimated   |
| \ ``chainwork`` |                 | equired(exactly | number of block |
|                 |                 | 1)              | header hashes   |
|                 |                 |                 | miners had to   |
|                 |                 |                 | check from the  |
|                 |                 |                 | genesis block   |
|                 |                 |                 | to this block,  |
|                 |                 |                 | encoded as      |
|                 |                 |                 | big-endian hex  |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``prev       | string (hex)    | R               | The hash of the |
| iousblockhash`` |                 | equired(exactly | header of the   |
|                 |                 | 1)              | previous block, |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | string (hex)    | Optional(0 or   | The hash of the |
| nextblockhash`` |                 | 1)              | next block on   |
|                 |                 |                 | the best block  |
|                 |                 |                 | chain, if       |
|                 |                 |                 | known, encoded  |
|                 |                 |                 | as hex in RPC   |
|                 |                 |                 | byte order      |
+-----------------+-----------------+-----------------+-----------------+

*Examples from Dash Core 0.12.2*

Request a block in hex-encoded serialized block format:

.. code:: bash

   curl http://localhost:19998/rest/block/0000000000ccbf46cf6b78827ac1019f82598be839bce08bff00d188e75fb451.hex

Result (wrapped):

.. code:: bash

   0000002097e8135d73afa52145f6d0b4d0f957030cd598837ddc6750271fb109\
   000000008478305a7abf2f7cb21a889fb68d53c3e51685349e18e1b104b5956c\
   100bfea2c72d285a84030a1cd0041ed701010000000100000000000000000000\
   00000000000000000000000000000000000000000000ffffffff13037a94000e\
   2f5032506f6f6c2d74444153482fffffffff06a1f9ef04000000001976a91414\
   e3832cd7192ffb358a31d842636c4db8dfb1ac88ac6c357f3c000000001976a9\
   149262f2289e1f021dca954d8cf07a7ad72c2cc24d88ac31f49e010000000019\
   76a914d93f7ffa324b77d361e89a3c9c8df46ccdb4b39288ac40230e43000000\
   001976a914c4541983721b26ada79770bf22de4885e19f566188ac0200000000\
   0000004341047559d13c3f81b1fadbd8dd03e4b5a1c73b05e2b980e00d467aa9\
   440b29c7de23664dde6428d75cafed22ae4f0d302e26c5c5a5dd4d3e1b796d72\
   81bdc9430f35ac00000000000000002a6a28c855abe6461b1003ea36feb88a3b\
   d50c5696e5784d11f8cd5e892978685de1d6000000000100000000000000

Get the same block in JSON:

.. code:: bash

   curl http://localhost:19998/rest/block/0000000000ccbf46cf6b78827ac1019f82598be839bce08bff00d188e75fb451.json

Result (whitespace added):

.. code:: json

   {  
      "hash":"0000000000ccbf46cf6b78827ac1019f82598be839bce08bff00d188e75fb451",
      "confirmations":20,
      "size":414,
      "height":38010,
      "version":536870912,
      "merkleroot":"a2fe0b106c95b504b1e1189e348516e5c3538db69f881ab27c2fbf7a5a307884",
      "tx":[  
         {  
            "txid":"a2fe0b106c95b504b1e1189e348516e5c3538db69f881ab27c2fbf7a5a307884",
            "size":333,
            "version":1,
            "locktime":0,
            "vin":[  
               {  
                  "coinbase":"037a94000e2f5032506f6f6c2d74444153482f",
                  "sequence":4294967295
               }
            ],
            "vout":[  
               {  
                  "value":0.82835873,
                  "valueSat":82835873,
                  "n":0,
                  "scriptPubKey":{  
                     "asm":"OP_DUP OP_HASH160 14e3832cd7192ffb358a31d842636c4db8dfb1ac OP_EQUALVERIFY OP_CHECKSIG",
                     "hex":"76a91414e3832cd7192ffb358a31d842636c4db8dfb1ac88ac",
                     "reqSigs":1,
                     "type":"pubkeyhash",
                     "addresses":[  
                        "yNDtusuhm6otr3eeGh3SqdpNczV4aZSx1b"
                     ]
                  }
               },
               {  
                  "value":10.14969708,
                  "valueSat":1014969708,
                  "n":1,
                  "scriptPubKey":{  
                     "asm":"OP_DUP OP_HASH160 9262f2289e1f021dca954d8cf07a7ad72c2cc24d OP_EQUALVERIFY OP_CHECKSIG",
                     "hex":"76a9149262f2289e1f021dca954d8cf07a7ad72c2cc24d88ac",
                     "reqSigs":1,
                     "type":"pubkeyhash",
                     "addresses":[  
                        "yZfU36R8dhdnFaK3AwfnubrLXAG2G1WiVn"
                     ]
                  }
               },
               {  
                  "value":0.27194417,
                  "valueSat":27194417,
                  "n":2,
                  "scriptPubKey":{  
                     "asm":"OP_DUP OP_HASH160 d93f7ffa324b77d361e89a3c9c8df46ccdb4b392 OP_EQUALVERIFY OP_CHECKSIG",
                     "hex":"76a914d93f7ffa324b77d361e89a3c9c8df46ccdb4b39288ac",
                     "reqSigs":1,
                     "type":"pubkeyhash",
                     "addresses":[  
                        "yg89Yt5Tjzs9nRpX3wJCuvr7KuQvgkvmeC"
                     ]
                  }
               },
               {  
                  "value":11.25000000,
                  "valueSat":1125000000,
                  "n":3,
                  "scriptPubKey":{  
                     "asm":"OP_DUP OP_HASH160 c4541983721b26ada79770bf22de4885e19f5661 OP_EQUALVERIFY OP_CHECKSIG",
                     "hex":"76a914c4541983721b26ada79770bf22de4885e19f566188ac",
                     "reqSigs":1,
                     "type":"pubkeyhash",
                     "addresses":[  
                        "yeDY39aiqbBHbJft5F6rokR23EaZca6UTU"
                     ]
                  }
               },
               {  
                  "value":0.00000002,
                  "valueSat":2,
                  "n":4,
                  "scriptPubKey":{  
                     "asm":"047559d13c3f81b1fadbd8dd03e4b5a1c73b05e2b980e00d467aa9440b29c7de23664dde6428d75cafed22ae4f0d302e26c5c5a5dd4d3e1b796d7281bdc9430f35 OP_CHECKSIG",
                     "hex":"41047559d13c3f81b1fadbd8dd03e4b5a1c73b05e2b980e00d467aa9440b29c7de23664dde6428d75cafed22ae4f0d302e26c5c5a5dd4d3e1b796d7281bdc9430f35ac",
                     "reqSigs":1,
                     "type":"pubkey",
                     "addresses":[  
                        "yb21342iADyqAotjwcn4imqjvAcdYhnzeH"
                     ]
                  }
               },
               {  
                  "value":0.00000000,
                  "valueSat":0,
                  "n":5,
                  "scriptPubKey":{  
                     "asm":"OP_RETURN c855abe6461b1003ea36feb88a3bd50c5696e5784d11f8cd5e892978685de1d60000000001000000",
                     "hex":"6a28c855abe6461b1003ea36feb88a3bd50c5696e5784d11f8cd5e892978685de1d60000000001000000",
                     "type":"nulldata"
                  }
               }
            ]
         }
      ],
      "time":1512582599,
      "mediantime":1512582025,
      "nonce":3609068752,
      "bits":"1c0a0384",
      "difficulty":25.56450187425715,
      "chainwork":"00000000000000000000000000000000000000000000000000092fc476457b68",
      "previousblockhash":"0000000009b11f275067dc7d8398d50c0357f9d0b4d0f64521a5af735d13e897",
      "nextblockhash":"0000000000a9baff28a79db2a50e13af8f313138f4568339f58d73eda14a4d51"
   }

*See also*

-  `GET
   Block/NoTxDetails </docs/core-api-ref-http-rest-requests#get-blocknotxdetails>`__
   gets a block with a particular header hash from the local block
   database either as a JSON object or as a serialized block. The JSON
   object includes TXIDs for transactions within the block rather than
   the complete transactions `GET
   block </docs/core-api-ref-http-rest-requests#get-block>`__ returns.
-  `GetBestBlockHash </docs/core-api-ref-remote-procedure-calls-blockchain#getbestblockhash>`__
   RPC: returns the header hash of the most recent block on the best
   block chain.
-  `GetBlock </docs/core-api-ref-remote-procedure-calls-blockchain#getblock>`__
   RPC: gets a block with a particular header hash from the local block
   database either as a JSON object or as a serialized block.
-  `GetBlockHash </docs/core-api-ref-remote-procedure-calls-blockchain#getblockhash>`__
   RPC: returns the header hash of a block at the given height in the
   local best block chain.

GET Block/NoTxDetails
=====================

The ``GET block/notxdetails`` operation gets a block with a particular
header hash from the local block database either as a JSON object or as
a serialized block. The JSON object includes TXIDs for transactions
within the block rather than the complete transactions `GET
block </docs/core-api-ref-http-rest-requests#get-block>`__ returns.

*Request*

.. code:: text

   GET /block/notxdetails/<hash>.<format>

*Parameter #1—the header hash of the block to retrieve*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Header Hash     | path (hex)      | R               | The hash of the |
|                 |                 | equired(exactly | header of the   |
|                 |                 | 1)              | block to get,   |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the output format*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Format          | suffix          | R               | Set to          |
|                 |                 | equired(exactly | ``.json`` for   |
|                 |                 | 1)              | decoded block   |
|                 |                 |                 | contents in     |
|                 |                 |                 | JSON, or        |
|                 |                 |                 | ``.bin`` or     |
|                 |                 |                 | ``hex`` for a   |
|                 |                 |                 | serialized      |
|                 |                 |                 | block in binary |
|                 |                 |                 | or hex          |
+-----------------+-----------------+-----------------+-----------------+

*Response as JSON*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | object          | R               | An object       |
|                 |                 | equired(exactly | containing the  |
|                 |                 | 1)              | requested block |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``hash``     | string (hex)    | R               | The hash of     |
|                 |                 | equired(exactly | this block’s    |
|                 |                 | 1)              | block header    |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order. This is  |
|                 |                 |                 | the same as the |
|                 |                 |                 | hash provided   |
|                 |                 |                 | in parameter #1 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | number (int)    | R               | The number of   |
| confirmations`` |                 | equired(exactly | confirmations   |
|                 |                 | 1)              | the             |
|                 |                 |                 | transactions in |
|                 |                 |                 | this block      |
|                 |                 |                 | have, starting  |
|                 |                 |                 | at 1 when this  |
|                 |                 |                 | block is at the |
|                 |                 |                 | tip of the best |
|                 |                 |                 | block chain.    |
|                 |                 |                 | This score will |
|                 |                 |                 | be -1 if the    |
|                 |                 |                 | the block is    |
|                 |                 |                 | not part of the |
|                 |                 |                 | best block      |
|                 |                 |                 | chain           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``size``     | number (int)    | R               | The size of     |
|                 |                 | equired(exactly | this block in   |
|                 |                 | 1)              | serialized      |
|                 |                 |                 | block format,   |
|                 |                 |                 | counted in      |
|                 |                 |                 | bytes           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``height``   | number (int)    | R               | The height of   |
|                 |                 | equired(exactly | this block on   |
|                 |                 | 1)              | its block chain |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``version``  | number (int)    | R               | This block’s    |
|                 |                 | equired(exactly | version number. |
|                 |                 | 1)              | See `block      |
|                 |                 |                 | version         |
|                 |                 |                 | nu              |
|                 |                 |                 | mbers <core-ref |
|                 |                 |                 | -block-chain-bl |
|                 |                 |                 | ock-headers#blo |
|                 |                 |                 | ck-versions>`__ |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (int)    | R               | *Added in       |
|  ``versionHex`` |                 | equired(exactly | Bitcoin Core    |
|                 |                 | 1)              | 0.13.0*\ This   |
|                 |                 |                 | block’s version |
|                 |                 |                 | number          |
|                 |                 |                 | formatted in    |
|                 |                 |                 | hexadecimal.    |
|                 |                 |                 | See [BIP9       |
|                 |                 |                 | assignments]    |
+-----------------+-----------------+-----------------+-----------------+
| →\              | string (hex)    | R               | The merkle root |
|  ``merkleroot`` |                 | equired(exactly | for this block, |
|                 |                 | 1)              | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``tx``       | array           | R               | An array        |
|                 |                 | equired(exactly | containing all  |
|                 |                 | 1)              | transactions in |
|                 |                 |                 | this block. The |
|                 |                 |                 | transactions    |
|                 |                 |                 | appear in the   |
|                 |                 |                 | array in the    |
|                 |                 |                 | same order they |
|                 |                 |                 | appear in the   |
|                 |                 |                 | serialized      |
|                 |                 |                 | block           |
+-----------------+-----------------+-----------------+-----------------+
| → →TXID         | string (hex)    | Required(1 or   | The TXID of a   |
|                 |                 | more)           | transaction in  |
|                 |                 |                 | this block,     |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``time``     | number (int)    | R               | The value of    |
|                 |                 | equired(exactly | the *time*      |
|                 |                 | 1)              | field in the    |
|                 |                 |                 | block header,   |
|                 |                 |                 | indicating      |
|                 |                 |                 | approximately   |
|                 |                 |                 | when the block  |
|                 |                 |                 | was created     |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (int)    | R               | *Added in       |
|  ``mediantime`` |                 | equired(exactly | Bitcoin Core    |
|                 |                 | 1)              | 0.12.0*\ The    |
|                 |                 |                 | median time of  |
|                 |                 |                 | the 11 blocks   |
|                 |                 |                 | before the most |
|                 |                 |                 | recent block on |
|                 |                 |                 | the blockchain. |
|                 |                 |                 | Used for        |
|                 |                 |                 | validating      |
|                 |                 |                 | transaction     |
|                 |                 |                 | locktime under  |
|                 |                 |                 | BIP113          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``nonce``    | number (int)    | R               | The nonce which |
|                 |                 | equired(exactly | was successful  |
|                 |                 | 1)              | at turning this |
|                 |                 |                 | particular      |
|                 |                 |                 | block into one  |
|                 |                 |                 | that could be   |
|                 |                 |                 | added to the    |
|                 |                 |                 | best block      |
|                 |                 |                 | chain           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``bits``     | string (hex)    | R               | The value of    |
|                 |                 | equired(exactly | the *nBits*     |
|                 |                 | 1)              | field in the    |
|                 |                 |                 | block header,   |
|                 |                 |                 | indicating the  |
|                 |                 |                 | target          |
|                 |                 |                 | threshold this  |
|                 |                 |                 | block’s header  |
|                 |                 |                 | had to pass     |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (real)   | R               | The estimated   |
|  ``difficulty`` |                 | equired(exactly | amount of work  |
|                 |                 | 1)              | done to find    |
|                 |                 |                 | this block      |
|                 |                 |                 | relative to the |
|                 |                 |                 | estimated       |
|                 |                 |                 | amount of work  |
|                 |                 |                 | done to find    |
|                 |                 |                 | block 0         |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | The estimated   |
| \ ``chainwork`` |                 | equired(exactly | number of block |
|                 |                 | 1)              | header hashes   |
|                 |                 |                 | miners had to   |
|                 |                 |                 | check from the  |
|                 |                 |                 | genesis block   |
|                 |                 |                 | to this block,  |
|                 |                 |                 | encoded as      |
|                 |                 |                 | big-endian hex  |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``prev       | string (hex)    | R               | The hash of the |
| iousblockhash`` |                 | equired(exactly | header of the   |
|                 |                 | 1)              | previous block, |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | string (hex)    | Optional(0 or   | The hash of the |
| nextblockhash`` |                 | 1)              | next block on   |
|                 |                 |                 | the best block  |
|                 |                 |                 | chain, if       |
|                 |                 |                 | known, encoded  |
|                 |                 |                 | as hex in RPC   |
|                 |                 |                 | byte order      |
+-----------------+-----------------+-----------------+-----------------+

*Examples from Dash Core 0.12.2*

Request a block in hex-encoded serialized block format:

.. code:: bash

   curl http://localhost:19998/rest/block/notxdetails/0000000000ccbf46cf6b78827ac1019f82598be839bce08bff00d188e75fb451.hex

Result (wrapped):

.. code:: bash

   0000002097e8135d73afa52145f6d0b4d0f957030cd598837ddc6750271fb109\
   000000008478305a7abf2f7cb21a889fb68d53c3e51685349e18e1b104b5956c\
   100bfea2c72d285a84030a1cd0041ed701010000000100000000000000000000\
   00000000000000000000000000000000000000000000ffffffff13037a94000e\
   2f5032506f6f6c2d74444153482fffffffff06a1f9ef04000000001976a91414\
   e3832cd7192ffb358a31d842636c4db8dfb1ac88ac6c357f3c000000001976a9\
   149262f2289e1f021dca954d8cf07a7ad72c2cc24d88ac31f49e010000000019\
   76a914d93f7ffa324b77d361e89a3c9c8df46ccdb4b39288ac40230e43000000\
   001976a914c4541983721b26ada79770bf22de4885e19f566188ac0200000000\
   0000004341047559d13c3f81b1fadbd8dd03e4b5a1c73b05e2b980e00d467aa9\
   440b29c7de23664dde6428d75cafed22ae4f0d302e26c5c5a5dd4d3e1b796d72\
   81bdc9430f35ac00000000000000002a6a28c855abe6461b1003ea36feb88a3b\
   d50c5696e5784d11f8cd5e892978685de1d6000000000100000000000000

Get the same block in JSON:

.. code:: bash

   curl http://localhost:19998/rest/block/notxdetails/0000000000ccbf46cf6b78827ac1019f82598be839bce08bff00d188e75fb451.json

Result (whitespace added):

.. code:: json

   {  
      "hash":"0000000000ccbf46cf6b78827ac1019f82598be839bce08bff00d188e75fb451",
      "confirmations":55,
      "size":414,
      "height":38010,
      "version":536870912,
      "merkleroot":"a2fe0b106c95b504b1e1189e348516e5c3538db69f881ab27c2fbf7a5a307884",
      "tx":[  
         "a2fe0b106c95b504b1e1189e348516e5c3538db69f881ab27c2fbf7a5a307884"
      ],
      "time":1512582599,
      "mediantime":1512582025,
      "nonce":3609068752,
      "bits":"1c0a0384",
      "difficulty":25.56450187425715,
      "chainwork":"00000000000000000000000000000000000000000000000000092fc476457b68",
      "previousblockhash":"0000000009b11f275067dc7d8398d50c0357f9d0b4d0f64521a5af735d13e897",
      "nextblockhash":"0000000000a9baff28a79db2a50e13af8f313138f4568339f58d73eda14a4d51"
   }

*See also*

-  `GET Block </docs/core-api-ref-http-rest-requests#get-block>`__: gets
   a block with a particular header hash from the local block database
   either as a JSON object or as a serialized block.
-  `GetBlock </docs/core-api-ref-remote-procedure-calls-blockchain#getblock>`__
   RPC: gets a block with a particular header hash from the local block
   database either as a JSON object or as a serialized block.
-  `GetBlockHash </docs/core-api-ref-remote-procedure-calls-blockchain#getblockhash>`__
   RPC: returns the header hash of a block at the given height in the
   local best block chain.
-  `GetBestBlockHash </docs/core-api-ref-remote-procedure-calls-blockchain#getbestblockhash>`__
   RPC: returns the header hash of the most recent block on the best
   block chain.

GET BlockHashByHeight
=====================

The ``GET blockhashbyheight`` operation returns the hash of a block in
best-block-chain at the height provided. The hash can be returned as a
JSON object or serialized as binary or hex.

*Request*

.. code:: text

   GET /blockhashbyheight/<height>.<format>

*Parameter #1—the header hash of the block to retrieve*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Block Height    | number (int)    | R               | The height of   |
|                 |                 | equired(exactly | the block hash  |
|                 |                 | 1)              | to get          |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the output format*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Format          | suffix          | R               | Set to          |
|                 |                 | equired(exactly | ``.json`` for   |
|                 |                 | 1)              | decoded block   |
|                 |                 |                 | hash contents   |
|                 |                 |                 | in JSON, or     |
|                 |                 |                 | ``.bin`` or     |
|                 |                 |                 | ``hex`` for a   |
|                 |                 |                 | serialized      |
|                 |                 |                 | block hash in   |
|                 |                 |                 | binary or hex   |
+-----------------+-----------------+-----------------+-----------------+

*Response as JSON*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | An object       |
|                 |                 | equired(exactly | containing the  |
|                 |                 | 1)              | block hash for  |
|                 |                 |                 | the requested   |
|                 |                 |                 | height          |
+-----------------+-----------------+-----------------+-----------------+
| →               | string          | R               | Block hash for  |
| \ ``blockhash`` |                 | equired(exactly | the requested   |
|                 |                 | 1)              | height          |
+-----------------+-----------------+-----------------+-----------------+

*Examples from Dash Core 18.0.0*

Request a block hash in hex-encoded serialized block hash format:

.. code:: bash

   curl http://localhost:19998/rest/blockhashbyheight/1.hex

Result:

.. code:: text

   0000047d24635e347be3aaaeb66c26be94901a2f962feccd4f95090191f208c1

Get the same block hash in JSON:

.. code:: bash

   curl http://localhost:19998/rest/blockhashbyheight/1.json

Result:

.. code:: json

   {
     "blockhash": "0000047d24635e347be3aaaeb66c26be94901a2f962feccd4f95090191f208c1"
   }

*See also*

-  `GetBlockHash </docs/core-api-ref-remote-procedure-calls-blockchain#getblockhash>`__
   RPC: returns the header hash of a block at the given height in the
   local best block chain.

GET ChainInfo
=============

The ``GET chaininfo`` operation returns information about the current
state of the block chain. Supports only ``json`` as output format.

*Request*

.. code:: text

   GET /chaininfo.json

*Parameters: none*

*Response as JSON*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | Information     |
|                 |                 | equired(exactly | about the       |
|                 |                 | 1)              | current state   |
|                 |                 |                 | of the local    |
|                 |                 |                 | block chain     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``chain``    | string          | R               | The name of the |
|                 |                 | equired(exactly | block chain.    |
|                 |                 | 1)              | One of ``main`` |
|                 |                 |                 | for mainnet,    |
|                 |                 |                 | ``test`` for    |
|                 |                 |                 | testnet, or     |
|                 |                 |                 | ``regtest`` for |
|                 |                 |                 | regtest         |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``blocks``   | number (int)    | R               | The number of   |
|                 |                 | equired(exactly | validated       |
|                 |                 | 1)              | blocks in the   |
|                 |                 |                 | local best      |
|                 |                 |                 | block chain.    |
|                 |                 |                 | For a new node  |
|                 |                 |                 | with just the   |
|                 |                 |                 | hardcoded       |
|                 |                 |                 | genesis block,  |
|                 |                 |                 | this will be 0  |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``headers``  | number (int)    | R               | The number of   |
|                 |                 | equired(exactly | validated       |
|                 |                 | 1)              | headers in the  |
|                 |                 |                 | local best      |
|                 |                 |                 | headers chain.  |
|                 |                 |                 | For a new node  |
|                 |                 |                 | with just the   |
|                 |                 |                 | hardcoded       |
|                 |                 |                 | genesis block,  |
|                 |                 |                 | this will be    |
|                 |                 |                 | zero. This      |
|                 |                 |                 | number may be   |
|                 |                 |                 | higher than the |
|                 |                 |                 | number of       |
|                 |                 |                 | *blocks*        |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | string (hex)    | R               | The hash of the |
| bestblockhash`` |                 | equired(exactly | header of the   |
|                 |                 | 1)              | highest         |
|                 |                 |                 | validated block |
|                 |                 |                 | in the best     |
|                 |                 |                 | block chain,    |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order. This is  |
|                 |                 |                 | identical to    |
|                 |                 |                 | the string      |
|                 |                 |                 | returned by the |
|                 |                 |                 | ```get          |
|                 |                 |                 | bestblockhash`` |
|                 |                 |                 | RPC <core-ap    |
|                 |                 |                 | i-ref-remote-pr |
|                 |                 |                 | ocedure-calls-b |
|                 |                 |                 | lockchain#getbe |
|                 |                 |                 | stblockhash>`__ |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (real)   | R               | The difficulty  |
|  ``difficulty`` |                 | equired(exactly | of the          |
|                 |                 | 1)              | highest-height  |
|                 |                 |                 | block in the    |
|                 |                 |                 | best block      |
|                 |                 |                 | chain           |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (int)    | R               | *Added in       |
|  ``mediantime`` |                 | equired(exactly | Bitcoin Core    |
|                 |                 | 1)              | 0.12.0*\ The    |
|                 |                 |                 | median time of  |
|                 |                 |                 | the 11 blocks   |
|                 |                 |                 | before the most |
|                 |                 |                 | recent block on |
|                 |                 |                 | the blockchain. |
|                 |                 |                 | Used for        |
|                 |                 |                 | validating      |
|                 |                 |                 | transaction     |
|                 |                 |                 | locktime under  |
|                 |                 |                 | BIP113          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``verific    | number (real)   | Required        | Estimate of     |
| ationprogress`` |                 | (exactly 1)     | what percentage |
|                 |                 |                 | of the block    |
|                 |                 |                 | chain           |
|                 |                 |                 | transactions    |
|                 |                 |                 | have been       |
|                 |                 |                 | verified so     |
|                 |                 |                 | far, starting   |
|                 |                 |                 | at 0.0 and      |
|                 |                 |                 | increasing to   |
|                 |                 |                 | 1.0 for fully   |
|                 |                 |                 | verified. May   |
|                 |                 |                 | slightly exceed |
|                 |                 |                 | 1.0 when fully  |
|                 |                 |                 | synced to       |
|                 |                 |                 | account for     |
|                 |                 |                 | transactions in |
|                 |                 |                 | the memory pool |
|                 |                 |                 | which have been |
|                 |                 |                 | verified before |
|                 |                 |                 | being included  |
|                 |                 |                 | in a block      |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | R               | The estimated   |
| \ ``chainwork`` |                 | equired(exactly | number of block |
|                 |                 | 1)              | header hashes   |
|                 |                 |                 | checked from    |
|                 |                 |                 | the genesis     |
|                 |                 |                 | block to this   |
|                 |                 |                 | block, encoded  |
|                 |                 |                 | as big-endian   |
|                 |                 |                 | hex             |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``pruned``   | bool            | R               | Indicates if    |
|                 |                 | equired(exactly | the blocks are  |
|                 |                 | 1)              | subject to      |
|                 |                 |                 | pruning         |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (int)    | Optional(0 or   | The             |
| ``pruneheight`` |                 | 1)              | lowest-height   |
|                 |                 |                 | complete block  |
|                 |                 |                 | stored if       |
|                 |                 |                 | pruning is      |
|                 |                 |                 | activated       |
+-----------------+-----------------+-----------------+-----------------+
| →               | array           | R               | *Added in       |
| \ ``softforks`` |                 | equired(exactly | Bitcoin Core    |
|                 |                 | 1)              | 0.12.0*\ An     |
|                 |                 |                 | array of        |
|                 |                 |                 | objects each    |
|                 |                 |                 | describing a    |
|                 |                 |                 | current or      |
|                 |                 |                 | previous soft   |
|                 |                 |                 | fork            |
+-----------------+-----------------+-----------------+-----------------+
| → →Softfork     | object          | Required(3 or   | A specific      |
|                 |                 | more)           | softfork        |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``id``   | string          | R               | The name of the |
|                 |                 | equired(exactly | softfork        |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →             | numeric(int)    | R               | The block       |
| →\ ``version``  |                 | equired(exactly | version used    |
|                 |                 | 1)              | for the         |
|                 |                 |                 | softfork        |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string : object | Optional(0 or   | The progress    |
| →\ ``enforce``  |                 | 1)              | toward          |
|                 |                 |                 | enforcing the   |
|                 |                 |                 | softfork rules  |
|                 |                 |                 | for new-version |
|                 |                 |                 | blocks          |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | bool            | R               | Indicates if    |
| →\ ``status``   |                 | equired(exactly | the threshold   |
|                 |                 | 1)              | was reached     |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | numeric(int)    | Optional(0 or   | Number of       |
| →\ ``found``    |                 | 1)              | blocks that     |
|                 |                 |                 | support the     |
|                 |                 |                 | softfork        |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | numeric(int)    | Optional(0 or   | Number of       |
| →\ ``required`` |                 | 1)              | blocks that are |
|                 |                 |                 | required to     |
|                 |                 |                 | reach the       |
|                 |                 |                 | threshold       |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | numeric(int)    | Optional(0 or   | The maximum     |
| →\ ``window``   |                 | 1)              | size of         |
|                 |                 |                 | examined window |
|                 |                 |                 | of recent       |
|                 |                 |                 | blocks          |
+-----------------+-----------------+-----------------+-----------------+
| → →             | object          | Optional(0 or   | The progress    |
| →\ ``reject``   |                 | 1)              | toward          |
|                 |                 |                 | enforcing the   |
|                 |                 |                 | softfork rules  |
|                 |                 |                 | for new-version |
|                 |                 |                 | blocks          |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | bool            | Optional(0 or   | Indicates if    |
| →\ ``status``   |                 | 1)              | the threshold   |
|                 |                 |                 | was reached     |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | numeric(int)    | Optional(0 or   | Number of       |
| →\ ``found``    |                 | 1)              | blocks that     |
|                 |                 |                 | support the     |
|                 |                 |                 | softfork        |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | numeric(int)    | Optional(0 or   | Number of       |
| →\ ``required`` |                 | 1)              | blocks that are |
|                 |                 |                 | required to     |
|                 |                 |                 | reach the       |
|                 |                 |                 | threshold       |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | numeric(int)    | Optional(0 or   | The maximum     |
| →\ ``window``   |                 | 1)              | size of         |
|                 |                 |                 | examined window |
|                 |                 |                 | of recent       |
|                 |                 |                 | blocks          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``b          | object          | R               | *Added in       |
| ip9_softforks`` |                 | equired(exactly | Bitcoin Core    |
|                 |                 | 1)              | 0.12.1*\ The    |
|                 |                 |                 | status of BIP9  |
|                 |                 |                 | softforks in    |
|                 |                 |                 | progress        |
+-----------------+-----------------+-----------------+-----------------+
| → →Name         | string : object | Required(1 or   | A specific BIP9 |
|                 |                 | more)           | softfork        |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string          | R               | Set to one of   |
| →\ ``status``   |                 | equired(exactly | the following   |
|                 |                 | 1)              | reasons:•       |
|                 |                 |                 | ``defined`` if  |
|                 |                 |                 | voting hasn’t   |
|                 |                 |                 | started yet•    |
|                 |                 |                 | ``started`` if  |
|                 |                 |                 | the voting has  |
|                 |                 |                 | started •       |
|                 |                 |                 | ``locked_in``   |
|                 |                 |                 | if the voting   |
|                 |                 |                 | was successful  |
|                 |                 |                 | but the         |
|                 |                 |                 | softfort hasn’t |
|                 |                 |                 | been activated  |
|                 |                 |                 | yet• ``active`` |
|                 |                 |                 | if the softfork |
|                 |                 |                 | was activated•  |
|                 |                 |                 | ``failed`` if   |
|                 |                 |                 | the softfork    |
|                 |                 |                 | has not         |
|                 |                 |                 | receieved       |
|                 |                 |                 | enough votes    |
+-----------------+-----------------+-----------------+-----------------+

*Examples from Dash Core 0.12.2*

Get blockchain info in JSON:

.. code:: bash

   curl http://localhost:19998/rest/chaininfo.json

Result (whitespace added):

.. code:: json

   {  
      "chain":"test",
      "blocks":38066,
      "headers":38066,
      "bestblockhash":"0000000006c6f812d4721c09b3a3ce6547d2291ff822ee39597515f75822ed3e",
      "difficulty":18.8278810867833,
      "mediantime":1512591324,
      "verificationprogress":0.9999996159024219,
      "chainwork":"00000000000000000000000000000000000000000000000000093549c2729cb1",
      "pruned":false,
      "softforks":[  
         {  
            "id":"bip34",
            "version":2,
            "enforce":{  
               "status":true,
               "found":100,
               "required":51,
               "window":100
            },
            "reject":{  
               "status":true,
               "found":100,
               "required":75,
               "window":100
            }
         },
         {  
            "id":"bip66",
            "version":3,
            "enforce":{  
               "status":true,
               "found":100,
               "required":51,
               "window":100
            },
            "reject":{  
               "status":true,
               "found":100,
               "required":75,
               "window":100
            }
         },
         {  
            "id":"bip65",
            "version":4,
            "enforce":{  
               "status":true,
               "found":100,
               "required":51,
               "window":100
            },
            "reject":{  
               "status":true,
               "found":100,
               "required":75,
               "window":100
            }
         }
      ],
      "bip9_softforks":[  
         {  
            "id":"csv",
            "status":"active"
         },
         {  
            "id":"dip0001",
            "status":"active"
         }
      ]
   }

*See also*

-  `GetBlockChainInfo </docs/core-api-ref-remote-procedure-calls-blockchain#getblockchaininfo>`__
   RPC: provides information about the current state of the block chain.

GET GetUtxos
============

The ``GET getutxos`` operation returns an UTXO set given a set of
outpoints.

*Request*

.. code:: text

   GET /getutxos/<checkmempool>/<txid>-<n>/<txid>-<n>/.../<txid>-<n>.<bin|hex|json>

*Parameter #1—Include memory pool transactions*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Check mempool   | string          | Optional(0 or   | Set to          |
|                 |                 | 1)              | `               |
|                 |                 |                 | `checkmempool`` |
|                 |                 |                 | to include      |
|                 |                 |                 | transactions    |
|                 |                 |                 | that are        |
|                 |                 |                 | currently in    |
|                 |                 |                 | the memory pool |
|                 |                 |                 | to the          |
|                 |                 |                 | calculation     |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—List of Outpoints*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Outpoint        | vector          | Required(1 or   | The list of     |
|                 |                 | more)           | outpoints to be |
|                 |                 |                 | queried. Each   |
|                 |                 |                 | outpoint is the |
|                 |                 |                 | TXID of the     |
|                 |                 |                 | transaction,    |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order with an   |
|                 |                 |                 | additional      |
|                 |                 |                 | ``-n``          |
|                 |                 |                 | parameter for   |
|                 |                 |                 | the output      |
|                 |                 |                 | index (vout)    |
|                 |                 |                 | number, with    |
|                 |                 |                 | the index       |
|                 |                 |                 | starting from 0 |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—the output format*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Format          | suffix          | R               | Set to          |
|                 |                 | equired(exactly | ``.json`` for   |
|                 |                 | 1)              | decoded block   |
|                 |                 |                 | contents in     |
|                 |                 |                 | JSON, or        |
|                 |                 |                 | ``.bin`` or     |
|                 |                 |                 | ``hex`` for a   |
|                 |                 |                 | serialized      |
|                 |                 |                 | block in binary |
|                 |                 |                 | or hex          |
+-----------------+-----------------+-----------------+-----------------+

*Response as JSON*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | The requested   |
|                 |                 | equired(exactly | UTXO set        |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →→\             | number (int)    | R               | The height of   |
| ``chainHeight`` |                 | equired(exactly | the chain at    |
|                 |                 | 1)              | the moment the  |
|                 |                 |                 | result was      |
|                 |                 |                 | calculated      |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | number (int)    | R               | The block hash  |
| `chaintipHash`` |                 | equired(exactly | of the top of   |
|                 |                 | 1)              | the chain at    |
|                 |                 |                 | the moment the  |
|                 |                 |                 | result was      |
|                 |                 |                 | calculated      |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``bitmap``   | number (int)    | R               | Whether each    |
|                 |                 | equired(exactly | requested       |
|                 |                 | 1)              | output was      |
|                 |                 |                 | found in the    |
|                 |                 |                 | UTXO set or     |
|                 |                 |                 | not. A ``1`` is |
|                 |                 |                 | returned for    |
|                 |                 |                 | those that were |
|                 |                 |                 | found and a     |
|                 |                 |                 | ``0`` is        |
|                 |                 |                 | returned for    |
|                 |                 |                 | those that were |
|                 |                 |                 | not found.      |
|                 |                 |                 | Results are     |
|                 |                 |                 | returned in the |
|                 |                 |                 | same order as   |
|                 |                 |                 | outpoints were  |
|                 |                 |                 | requested in    |
|                 |                 |                 | the input       |
|                 |                 |                 | parameters      |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``utxos``    | array           | R               | An array of     |
|                 |                 | equired(exactly | objects each    |
|                 |                 | 1)              | describing an   |
|                 |                 |                 | outpoint that   |
|                 |                 |                 | is unspent      |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``Uns       | object          | Optional(0 or   | A UTXO match    |
| pent Outpoint`` |                 | more)           | based on the    |
|                 |                 |                 | query           |
+-----------------+-----------------+-----------------+-----------------+
| →→→\ ``txvers`` | number (int)    | R               | The version     |
|                 |                 | equired(exactly | number of the   |
|                 |                 | 1)              | transaction the |
|                 |                 |                 | UTXO was found  |
|                 |                 |                 | in              |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``height``   | number (int)    | Required        | The height of   |
|                 |                 | (exactly 1)     | the block       |
|                 |                 |                 | containing the  |
|                 |                 |                 | defining        |
|                 |                 |                 | transaction, or |
|                 |                 |                 | 0x7FFFFFFF if   |
|                 |                 |                 | the tx is in    |
|                 |                 |                 | the mempool     |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (int)    | R               | The value of    |
| →\ ``value``    |                 | equired(exactly | the transaction |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| → →             | object          | R               | An object       |
| →\ `            |                 | equired(exactly | describing the  |
| `scriptPubKey`` |                 | 1)              | pubkey script   |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string          | R               | The pubkey      |
| →\ ``asm``      |                 | equired(exactly | script in       |
|                 |                 | 1)              | decoded form    |
|                 |                 |                 | with            |
|                 |                 |                 | n               |
|                 |                 |                 | on-data-pushing |
|                 |                 |                 | opcodes listed  |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string (hex)    | R               | The pubkey      |
| →\ ``hex``      |                 | equired(exactly | script encoded  |
|                 |                 | 1)              | as hex          |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | number (int)    | Optional(0 or   | The number of   |
| →\ ``reqSigs``  |                 | 1)              | signatures      |
|                 |                 |                 | required; this  |
|                 |                 |                 | is always ``1`` |
|                 |                 |                 | for P2PK,       |
|                 |                 |                 | P2PKH, and P2SH |
|                 |                 |                 | (including P2SH |
|                 |                 |                 | multisig        |
|                 |                 |                 | because the     |
|                 |                 |                 | redeem script   |
|                 |                 |                 | is not          |
|                 |                 |                 | available in    |
|                 |                 |                 | the pubkey      |
|                 |                 |                 | script). It may |
|                 |                 |                 | be greater than |
|                 |                 |                 | 1 for bare      |
|                 |                 |                 | multisig. This  |
|                 |                 |                 | value will not  |
|                 |                 |                 | be returned for |
|                 |                 |                 | ``nulldata`` or |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | script types    |
|                 |                 |                 | (see the        |
|                 |                 |                 | ``type`` key    |
|                 |                 |                 | below)          |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string          | Optional(0 or   | The type of     |
| →\ ``type``     |                 | 1)              | script. This    |
|                 |                 |                 | will be one of  |
|                 |                 |                 | the following:• |
|                 |                 |                 | ``pubkey`` for  |
|                 |                 |                 | a P2PK script•  |
|                 |                 |                 | ``pubkeyhash``  |
|                 |                 |                 | for a P2PKH     |
|                 |                 |                 | script•         |
|                 |                 |                 | ``scripthash``  |
|                 |                 |                 | for a P2SH      |
|                 |                 |                 | script•         |
|                 |                 |                 | ``multisig``    |
|                 |                 |                 | for a bare      |
|                 |                 |                 | multisig        |
|                 |                 |                 | script•         |
|                 |                 |                 | ``nulldata``    |
|                 |                 |                 | for nulldata    |
|                 |                 |                 | scripts•        |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | for unknown     |
|                 |                 |                 | scripts         |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string : array  | Optional(0 or   | Array of P2PKH  |
| →               |                 | 1)              | or P2SH         |
| \ ``addresses`` |                 |                 | addresses used  |
|                 |                 |                 | in this         |
|                 |                 |                 | transaction, or |
|                 |                 |                 | the computed    |
|                 |                 |                 | P2PKH address   |
|                 |                 |                 | of any pubkeys  |
|                 |                 |                 | in this         |
|                 |                 |                 | transaction.    |
|                 |                 |                 | This array will |
|                 |                 |                 | not be returned |
|                 |                 |                 | for             |
|                 |                 |                 | ``nulldata`` or |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | script types    |
+-----------------+-----------------+-----------------+-----------------+
| → → → →         | string          | Required(1 or   | A P2PKH or P2SH |
| →Address        |                 | more)           | address         |
+-----------------+-----------------+-----------------+-----------------+

*Examples from Dash Core 0.12.2*

Request the UTXO set:

.. code:: bash

   curl http://localhost:19998/rest/getutxos/checkmempool/7b6caf68c33794b0bda65e63691739919f13156b57c7ec20a0b4de1f33c580bd-0.hex

Result (wrapped):

.. code:: bash

   c39400005ac8db505390f3c77635132117a7fdf07b2eb45c3d9fe38535b77b05\
   0000000001010101000000c394000050ae3b16000000001976a9146f4def95a3\
   15e83bef5e1197ace4aa7ec55f2ecc88ac

Same request in JSON:

.. code:: bash

   curl http://localhost:19998/rest/getutxos/checkmempool/7b6caf68c33794b0bda65e63691739919f13156b57c7ec20a0b4de1f33c580bd-0.json

Result (whitespace added):

.. code:: json

   {  
      "chainHeight":38083,
      "chaintipHash":"00000000057bb73585e39f3d5cb42e7bf0fda71721133576c7f3905350dbc85a",
      "bitmap":"1",
      "utxos":[  
         {  
            "txvers":1,
            "height":38083,
            "value":3.73010000,
            "scriptPubKey":{  
               "asm":"OP_DUP OP_HASH160 6f4def95a315e83bef5e1197ace4aa7ec55f2ecc OP_EQUALVERIFY OP_CHECKSIG",
               "hex":"76a9146f4def95a315e83bef5e1197ace4aa7ec55f2ecc88ac",
               "reqSigs":1,
               "type":"pubkeyhash",
               "addresses":[  
                  "yWTyDaMb1KZSRYwrq2DDW3Q4rKYuuPutDS"
               ]
            }
         }
      ]
   }

*See also*

-  `GetTxOutSetInfo </docs/core-api-ref-remote-procedure-calls-blockchain#gettxoutsetinfo>`__
   RPC: returns statistics about the confirmed unspent transaction
   output (UTXO) set. Note that this call may take some time and that it
   only counts outputs from confirmed transactions—it does not count
   outputs from the memory pool.

GET Headers
===========

The ``GET headers`` operation returns a specified amount of block
headers in upward direction.

*Request*

.. code:: text

   GET /headers/<count>/<hash>.<format>

*Parameter #1—the amount of block headers to retrieve*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Amount          | number (int)    | R               | The amount of   |
|                 |                 | equired(exactly | block headers   |
|                 |                 | 1)              | in upward       |
|                 |                 |                 | direction to    |
|                 |                 |                 | return          |
|                 |                 |                 | (including the  |
|                 |                 |                 | start header    |
|                 |                 |                 | hash)           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the header hash of the block to retrieve*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Header Hash     | path (hex)      | R               | The hash of the |
|                 |                 | equired(exactly | header of the   |
|                 |                 | 1)              | block to get,   |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #3—the output format*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Format          | suffix          | R               | Set to          |
|                 |                 | equired(exactly | ``.json`` for   |
|                 |                 | 1)              | decoded block   |
|                 |                 |                 | contents in     |
|                 |                 |                 | JSON, or        |
|                 |                 |                 | ``.bin`` or     |
|                 |                 |                 | ``hex`` for a   |
|                 |                 |                 | serialized      |
|                 |                 |                 | block in binary |
|                 |                 |                 | or hex          |
+-----------------+-----------------+-----------------+-----------------+

*Response as JSON*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | array           | R               | An array        |
|                 |                 | equired(exactly | containing the  |
|                 |                 | 1)              | requested block |
|                 |                 |                 | headers         |
+-----------------+-----------------+-----------------+-----------------+
| →Block Header   | object          | Required(1 or   | An object       |
|                 |                 | more)           | containing a    |
|                 |                 |                 | block header.   |
|                 |                 |                 | The amount of   |
|                 |                 |                 | the objects is  |
|                 |                 |                 | the same as the |
|                 |                 |                 | amount provided |
|                 |                 |                 | in parameter #1 |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``hash``    | string (hex)    | R               | The hash of     |
|                 |                 | equired(exactly | this block’s    |
|                 |                 | 1)              | block header    |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order. This is  |
|                 |                 |                 | the same as the |
|                 |                 |                 | hash provided   |
|                 |                 |                 | in parameter #2 |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``          | number (int)    | R               | The number of   |
| confirmations`` |                 | equired(exactly | confirmations   |
|                 |                 | 1)              | the             |
|                 |                 |                 | transactions in |
|                 |                 |                 | this block      |
|                 |                 |                 | have, starting  |
|                 |                 |                 | at 1 when this  |
|                 |                 |                 | block is at the |
|                 |                 |                 | tip of the best |
|                 |                 |                 | block chain.    |
|                 |                 |                 | This score will |
|                 |                 |                 | be -1 if the    |
|                 |                 |                 | the block is    |
|                 |                 |                 | not part of the |
|                 |                 |                 | best block      |
|                 |                 |                 | chain           |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``height``  | number (int)    | R               | The height of   |
|                 |                 | equired(exactly | this block on   |
|                 |                 | 1)              | its block chain |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``version`` | number (int)    | R               | This block’s    |
|                 |                 | equired(exactly | version number. |
|                 |                 | 1)              | See `block      |
|                 |                 |                 | version         |
|                 |                 |                 | nu              |
|                 |                 |                 | mbers <core-ref |
|                 |                 |                 | -block-chain-bl |
|                 |                 |                 | ock-headers#blo |
|                 |                 |                 | ck-versions>`__ |
+-----------------+-----------------+-----------------+-----------------+
| →→\             | string (hex)    | R               | The merkle root |
|  ``merkleroot`` |                 | equired(exactly | for this block, |
|                 |                 | 1)              | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``time``    | number (int)    | R               | The value of    |
|                 |                 | equired(exactly | the *time*      |
|                 |                 | 1)              | field in the    |
|                 |                 |                 | block header,   |
|                 |                 |                 | indicating      |
|                 |                 |                 | approximately   |
|                 |                 |                 | when the block  |
|                 |                 |                 | was created     |
+-----------------+-----------------+-----------------+-----------------+
| →→\             | number (int)    | R               | *Added in       |
|  ``mediantime`` |                 | equired(exactly | Bitcoin Core    |
|                 |                 | 1)              | 0.12.0*\ The    |
|                 |                 |                 | median time of  |
|                 |                 |                 | the 11 blocks   |
|                 |                 |                 | before the most |
|                 |                 |                 | recent block on |
|                 |                 |                 | the blockchain. |
|                 |                 |                 | Used for        |
|                 |                 |                 | validating      |
|                 |                 |                 | transaction     |
|                 |                 |                 | locktime under  |
|                 |                 |                 | BIP113          |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``nonce``   | number (int)    | R               | The nonce which |
|                 |                 | equired(exactly | was successful  |
|                 |                 | 1)              | at turning this |
|                 |                 |                 | particular      |
|                 |                 |                 | block into one  |
|                 |                 |                 | that could be   |
|                 |                 |                 | added to the    |
|                 |                 |                 | best block      |
|                 |                 |                 | chain           |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``bits``    | string (hex)    | R               | The value of    |
|                 |                 | equired(exactly | the *nBits*     |
|                 |                 | 1)              | field in the    |
|                 |                 |                 | block header,   |
|                 |                 |                 | indicating the  |
|                 |                 |                 | target          |
|                 |                 |                 | threshold this  |
|                 |                 |                 | block’s header  |
|                 |                 |                 | had to pass     |
+-----------------+-----------------+-----------------+-----------------+
| →→\             | number (real)   | R               | The estimated   |
|  ``difficulty`` |                 | equired(exactly | amount of work  |
|                 |                 | 1)              | done to find    |
|                 |                 |                 | this block      |
|                 |                 |                 | relative to the |
|                 |                 |                 | estimated       |
|                 |                 |                 | amount of work  |
|                 |                 |                 | done to find    |
|                 |                 |                 | block 0         |
+-----------------+-----------------+-----------------+-----------------+
| →→              | string (hex)    | R               | The estimated   |
| \ ``chainwork`` |                 | equired(exactly | number of block |
|                 |                 | 1)              | header hashes   |
|                 |                 |                 | miners had to   |
|                 |                 |                 | check from the  |
|                 |                 |                 | genesis block   |
|                 |                 |                 | to this block,  |
|                 |                 |                 | encoded as      |
|                 |                 |                 | big-endian hex  |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``prev      | string (hex)    | R               | The hash of the |
| iousblockhash`` |                 | equired(exactly | header of the   |
|                 |                 | 1)              | previous block, |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+
| →→\ ``          | string (hex)    | Optional(0 or   | The hash of the |
| nextblockhash`` |                 | 1)              | next block on   |
|                 |                 |                 | the best block  |
|                 |                 |                 | chain, if       |
|                 |                 |                 | known, encoded  |
|                 |                 |                 | as hex in RPC   |
|                 |                 |                 | byte order      |
+-----------------+-----------------+-----------------+-----------------+

*Examples from Dash Core 0.12.2*

Request 2 block headers in hex-encoded serialized block format:

.. code:: bash

   curl http://localhost:19998/rest/headers/2/0000000000ccbf46cf6b78827ac1019f82598be839bce08bff00d188e75fb451.hex

Result (wrapped):

.. code:: bash

   0000002097e8135d73afa52145f6d0b4d0f957030cd598837ddc6750271fb109\
   000000008478305a7abf2f7cb21a889fb68d53c3e51685349e18e1b104b5956c\
   100bfea2c72d285a84030a1cd0041ed70000002051b45fe788d100ff8be0bc39\
   e88b59829f01c17a82786bcf46bfcc000000000004dc24bddd15f790efcd7af3\
   8d03f805cc1c74516888ccec8874db2ac8beb043092e285a999f091c5d6ec419

Get the same block headers in JSON:

.. code:: bash

   curl http://localhost:19998/rest/headers/2/0000000000ccbf46cf6b78827ac1019f82598be839bce08bff00d188e75fb451.json

Result (whitespace added):

.. code:: json

   [  
      {  
         "hash":"0000000000ccbf46cf6b78827ac1019f82598be839bce08bff00d188e75fb451",
         "confirmations":80,
         "height":38010,
         "version":536870912,
         "merkleroot":"a2fe0b106c95b504b1e1189e348516e5c3538db69f881ab27c2fbf7a5a307884",
         "time":1512582599,
         "mediantime":1512582025,
         "nonce":3609068752,
         "bits":"1c0a0384",
         "difficulty":25.56450187425715,
         "chainwork":"00000000000000000000000000000000000000000000000000092fc476457b68",
         "previousblockhash":"0000000009b11f275067dc7d8398d50c0357f9d0b4d0f64521a5af735d13e897",
         "nextblockhash":"0000000000a9baff28a79db2a50e13af8f313138f4568339f58d73eda14a4d51"
      },
      {  
         "hash":"0000000000a9baff28a79db2a50e13af8f313138f4568339f58d73eda14a4d51",
         "confirmations":79,
         "height":38011,
         "version":536870912,
         "merkleroot":"43b0bec82adb7488eccc886851741ccc05f8038df37acdef90f715ddbd24dc04",
         "time":1512582665,
         "mediantime":1512582146,
         "nonce":432303709,
         "bits":"1c099f99",
         "difficulty":26.60134045579303,
         "chainwork":"00000000000000000000000000000000000000000000000000092fdf1051882b",
         "previousblockhash":"0000000000ccbf46cf6b78827ac1019f82598be839bce08bff00d188e75fb451",
         "nextblockhash":"0000000008de9da638149042323fc05ded619a922ff1fac6e66f66fc773bd716"
      }
   ]

*See also*

-  `GET
   Block/NoTxDetails </docs/core-api-ref-http-rest-requests#get-blocknotxdetails>`__
   gets a block with a particular header hash from the local block
   database either as a JSON object or as a serialized block. The JSON
   object includes TXIDs for transactions within the block rather than
   the complete transactions `GET
   block </docs/core-api-ref-remote-procedure-calls-blockchain#getblock>`__
   returns.
-  `GetBlockHash </docs/core-api-ref-remote-procedure-calls-blockchain#getblockhash>`__
   RPC: returns the header hash of a block at the given height in the
   local best block chain.
-  `GetBlockHeader </docs/core-api-ref-remote-procedure-calls-blockchain#getblockheader>`__
   RPC: gets a block header with a particular header hash from the local
   block database either as a JSON object or as a serialized block
   header.

GET MemPool/Contents
====================

The ``GET mempool/contents`` operation returns all transaction in the
memory pool with detailed information. Supports only ``json`` as output
format.

*Request*

.. code:: text

   GET /mempool/contents.json

*Parameters: none*

*Result as JSON*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | A object        |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | transactions    |
|                 |                 |                 | currently in    |
|                 |                 |                 | the memory      |
|                 |                 |                 | pool. May be    |
|                 |                 |                 | empty           |
+-----------------+-----------------+-----------------+-----------------+
| →TXID           | string : object | Optional(0 or   | The TXID of a   |
|                 |                 | more)           | transaction in  |
|                 |                 |                 | the memory      |
|                 |                 |                 | pool, encoded   |
|                 |                 |                 | as hex in RPC   |
|                 |                 |                 | byte order      |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``size``   | number (int)    | R               | The size of the |
|                 |                 | equired(exactly | serialized      |
|                 |                 | 1)              | transaction in  |
|                 |                 |                 | bytes           |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``fee``    | number          | R               | The transaction |
|                 | (bitcoins)      | equired(exactly | fee paid by the |
|                 |                 | 1)              | transaction in  |
|                 |                 |                 | decimal         |
|                 |                 |                 | bitcoins        |
+-----------------+-----------------+-----------------+-----------------+
| →               | number          | R               | *Added in       |
| →\              | (bitcoins)      | equired(exactly | Bitcoin Core    |
| ``modifiedfee`` |                 | 1)              | 0.12.0*\ The    |
|                 |                 |                 | transaction fee |
|                 |                 |                 | with fee deltas |
|                 |                 |                 | used for mining |
|                 |                 |                 | priority in     |
|                 |                 |                 | decimal         |
|                 |                 |                 | bitcoins        |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``time``   | number (int)    | R               | The time the    |
|                 |                 | equired(exactly | transaction     |
|                 |                 | 1)              | entered the     |
|                 |                 |                 | memory pool,    |
|                 |                 |                 | Unix epoch time |
|                 |                 |                 | format          |
+-----------------+-----------------+-----------------+-----------------+
| → →\ ``height`` | number (int)    | R               | The block       |
|                 |                 | equired(exactly | height when the |
|                 |                 | 1)              | transaction     |
|                 |                 |                 | entered the     |
|                 |                 |                 | memory pool     |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | The priority of |
| →\ ``sta        |                 | equired(exactly | the transaction |
| rtingpriority`` |                 | 1)              | when it first   |
|                 |                 |                 | entered the     |
|                 |                 |                 | memory pool     |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | The current     |
| →\ ``cu         |                 | equired(exactly | priority of the |
| rrentpriority`` |                 | 1)              | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | *Added in       |
| →\ ``de         |                 | equired(exactly | Bitcoin Core    |
| scendantcount`` |                 | 1)              | 0.12.0*\ The    |
|                 |                 |                 | number of       |
|                 |                 |                 | in-mempool      |
|                 |                 |                 | descendant      |
|                 |                 |                 | transactions    |
|                 |                 |                 | (including this |
|                 |                 |                 | one)            |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | *Added in       |
| →\ ``d          |                 | equired(exactly | Bitcoin Core    |
| escendantsize`` |                 | 1)              | 0.12.0*\ The    |
|                 |                 |                 | size of         |
|                 |                 |                 | in-mempool      |
|                 |                 |                 | descendants     |
|                 |                 |                 | (including this |
|                 |                 |                 | one)            |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | R               | *Added in       |
| →\ ``d          |                 | equired(exactly | Bitcoin Core    |
| escendantfees`` |                 | 1)              | 0.12.0*\ The    |
|                 |                 |                 | modified fees   |
|                 |                 |                 | (see            |
|                 |                 |                 | ``modifiedfee`` |
|                 |                 |                 | above) of       |
|                 |                 |                 | in-mempool      |
|                 |                 |                 | descendants     |
|                 |                 |                 | (including this |
|                 |                 |                 | one)            |
+-----------------+-----------------+-----------------+-----------------+
| →               | array           | R               | An array        |
| →\ ``depends``  |                 | equired(exactly | holding TXIDs   |
|                 |                 | 1)              | of unconfirmed  |
|                 |                 |                 | transactions    |
|                 |                 |                 | this            |
|                 |                 |                 | transaction     |
|                 |                 |                 | depends upon    |
|                 |                 |                 | (parent         |
|                 |                 |                 | transactions).  |
|                 |                 |                 | Those           |
|                 |                 |                 | transactions    |
|                 |                 |                 | must be part of |
|                 |                 |                 | a block before  |
|                 |                 |                 | this            |
|                 |                 |                 | transaction can |
|                 |                 |                 | be added to a   |
|                 |                 |                 | block, although |
|                 |                 |                 | all             |
|                 |                 |                 | transactions    |
|                 |                 |                 | may be included |
|                 |                 |                 | in the same     |
|                 |                 |                 | block. The      |
|                 |                 |                 | array may be    |
|                 |                 |                 | empty           |
+-----------------+-----------------+-----------------+-----------------+
| → → →Depends    | string          | Optional (0 or  | The TXIDs of    |
| TXID            |                 | more)           | any unconfirmed |
|                 |                 |                 | transactions    |
|                 |                 |                 | this            |
|                 |                 |                 | transaction     |
|                 |                 |                 | depends upon,   |
|                 |                 |                 | encoded as hex  |
|                 |                 |                 | in RPC byte     |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+

*Examples from Dash Core 0.12.2*

Get all transactions in the memory pool in JSON:

.. code:: bash

   curl http://localhost:19998/rest/mempool/contents.json

Result (whitespace added):

.. code:: json

   {  
      "b06edec446fbcc0fc04a6e2774a843823f5238c2e15de40e61767a44f6788d32":{  
         "size":225,
         "fee":0.00010000,
         "modifiedfee":0.00010000,
         "time":1512596309,
         "height":38094,
         "startingpriority":1934576927.410256,
         "currentpriority":1934576927.410256,
         "descendantcount":1,
         "descendantsize":225,
         "descendantfees":10000,
         "depends":[  

         ]
      }
   }

*See also*

-  `GET
   MemPool/Info </docs/core-api-ref-http-rest-requests#get-mempoolinfo>`__:
   returns information about the node’s current transaction memory pool.
-  `GetMemPoolInfo </docs/core-api-ref-remote-procedure-calls-blockchain#getmempoolinfo>`__
   RPC: returns information about the node’s current transaction memory
   pool.
-  `GetRawMemPool </docs/core-api-ref-remote-procedure-calls-blockchain#getrawmempool>`__
   RPC: returns all transaction identifiers (TXIDs) in the memory pool
   as a JSON array, or detailed information about each transaction in
   the memory pool as a JSON object.

GET MemPool/Info
================

The ``GET mempool/info`` operation returns information about the node’s
current transaction memory pool. Supports only ``json`` as output
format.

*Request*

.. code:: text

   GET /mempool/info.json

*Parameters: none*

*Result as JSON*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| ``result``      | object          | R               | A object        |
|                 |                 | equired(exactly | containing      |
|                 |                 | 1)              | information     |
|                 |                 |                 | about the       |
|                 |                 |                 | memory pool     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``size``     | number (int)    | R               | The number of   |
|                 |                 | equired(exactly | transactions    |
|                 |                 | 1)              | currently in    |
|                 |                 |                 | the memory pool |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``bytes``    | number (int)    | R               | The total       |
|                 |                 | equired(exactly | number of bytes |
|                 |                 | 1)              | in the          |
|                 |                 |                 | transactions in |
|                 |                 |                 | the memory pool |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``usage``    | number (int)    | R               | *Added in       |
|                 |                 | equired(exactly | Bitcoin Core    |
|                 |                 | 1)              | 0.11.0*\ Total  |
|                 |                 |                 | memory usage    |
|                 |                 |                 | for the mempool |
|                 |                 |                 | in bytes        |
+-----------------+-----------------+-----------------+-----------------+
| →\              | number (int)    | R               | *Added in       |
|  ``maxmempool`` |                 | equired(exactly | Bitcoin Core    |
|                 |                 | 1)              | 0               |
|                 |                 |                 | .12.0*\ Maximum |
|                 |                 |                 | memory usage    |
|                 |                 |                 | for the mempool |
|                 |                 |                 | in bytes        |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | number (int)    | R               | *Added in       |
| mempoolminfee`` |                 | equired(exactly | Bitcoin Core    |
|                 |                 | 1)              | 0.12.0*\ The    |
|                 |                 |                 | lowest fee per  |
|                 |                 |                 | kilobyte paid   |
|                 |                 |                 | by any          |
|                 |                 |                 | transaction in  |
|                 |                 |                 | the memory pool |
+-----------------+-----------------+-----------------+-----------------+

*Examples from Dash Core 0.12.2*

Get memory pool info in JSON:

.. code:: bash

   curl http://localhost:19998/rest/mempool/info.json

Result (whitespace added):

.. code:: json

   {  
      "size":1,
      "bytes":1256,
      "usage":3376,
      "maxmempool":300000000,
      "mempoolminfee":0.00000000
   }

*See also*

-  `GET
   MemPool/Contents </docs/core-api-ref-http-rest-requests#get-mempoolcontents>`__:
   returns all transaction in the memory pool with detailed information.
-  `GetMemPoolInfo </docs/core-api-ref-remote-procedure-calls-blockchain#getmempoolinfo>`__
   RPC: returns information about the node’s current transaction memory
   pool.

GET Tx
======

The ``GET tx`` operation gets a hex-encoded serialized transaction or a
JSON object describing the transaction. By default, Dash Core only
stores complete transaction data for UTXOs and your own transactions, so
this method may fail on historic transactions unless you use the
non-default ``txindex=1`` in your Dash Core startup settings.
[block:callout] { “type”: “warning”, “title”: “Reindex note”, “body”:
“If you begin using ``txindex=1`` after downloading the block chain, you
must rebuild your indexes by starting Dash Core with the option
``-reindex``. This may take several hours to complete, during which time
your node will not process new blocks or transactions. This reindex only
needs to be done once.” } [/block] *Request*

.. code:: text

   GET /tx/<txid>.<format>

*Parameter #1—the TXID of the transaction to retrieve*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| TXID            | path (hex)      | R               | The TXID of the |
|                 |                 | equired(exactly | transaction to  |
|                 |                 | 1)              | get, encoded as |
|                 |                 |                 | hex in RPC byte |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+

*Parameter #2—the output format*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Format          | suffix          | R               | Set to          |
|                 |                 | equired(exactly | ``.json`` for   |
|                 |                 | 1)              | decoded         |
|                 |                 |                 | transaction     |
|                 |                 |                 | contents in     |
|                 |                 |                 | JSON, or        |
|                 |                 |                 | ``.bin`` or     |
|                 |                 |                 | ``hex`` for a   |
|                 |                 |                 | serialized      |
|                 |                 |                 | transaction in  |
|                 |                 |                 | binary or hex   |
+-----------------+-----------------+-----------------+-----------------+

*Response as JSON*

+-----------------+-----------------+-----------------+-----------------+
| Name            | Type            | Presence        | Description     |
+=================+=================+=================+=================+
| Result          | object          | R               | An object       |
|                 |                 | equired(exactly | describing the  |
|                 |                 | 1)              | request         |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``txid``     | string (hex)    | R               | The             |
|                 |                 | equired(exactly | transaction’s   |
|                 |                 | 1)              | TXID encoded as |
|                 |                 |                 | hex in RPC byte |
|                 |                 |                 | order           |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``size``     | number (int)    | R               | *Added in       |
|                 |                 | equired(exactly | Bitcoin Core    |
|                 |                 | 1)              | 0.12.0*\ The    |
|                 |                 |                 | serialized      |
|                 |                 |                 | transaction     |
|                 |                 |                 | size            |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``version``  | number (int)    | R               | The transaction |
|                 |                 | equired(exactly | format version  |
|                 |                 | 1)              | number          |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``type``     | number (int)    | R               | *Added in Dash  |
|                 |                 | equired(exactly | Core            |
|                 |                 | 1)              | 0.13.0.0*\ The  |
|                 |                 |                 | transaction     |
|                 |                 |                 | format type     |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``locktime`` | number (int)    | R               | The             |
|                 |                 | equired(exactly | transaction’s   |
|                 |                 | 1)              | locktime:       |
|                 |                 |                 | either a Unix   |
|                 |                 |                 | epoch date or   |
|                 |                 |                 | block height;   |
|                 |                 |                 | see the         |
|                 |                 |                 | `locktime       |
|                 |                 |                 | parsing         |
|                 |                 |                 | rules <core     |
|                 |                 |                 | -guide-transact |
|                 |                 |                 | ions-locktime-a |
|                 |                 |                 | nd-sequence-num |
|                 |                 |                 | ber#locktime_pa |
|                 |                 |                 | rsing_rules>`__ |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``vin``      | array           | R               | An array of     |
|                 |                 | equired(exactly | objects with    |
|                 |                 | 1)              | each object     |
|                 |                 |                 | being an input  |
|                 |                 |                 | vector (vin)    |
|                 |                 |                 | for this        |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Input objects   |
|                 |                 |                 | will have the   |
|                 |                 |                 | same order      |
|                 |                 |                 | within the      |
|                 |                 |                 | array as they   |
|                 |                 |                 | have in the     |
|                 |                 |                 | transaction, so |
|                 |                 |                 | the first input |
|                 |                 |                 | listed will be  |
|                 |                 |                 | input 0         |
+-----------------+-----------------+-----------------+-----------------+
| → →Input        | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing one  |
|                 |                 |                 | of this         |
|                 |                 |                 | transaction’s   |
|                 |                 |                 | inputs. May be  |
|                 |                 |                 | a regular input |
|                 |                 |                 | or a coinbase   |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``txid`` | string          | Optional(0 or   | The TXID of the |
|                 |                 | 1)              | outpoint being  |
|                 |                 |                 | spent, encoded  |
|                 |                 |                 | as hex in RPC   |
|                 |                 |                 | byte order. Not |
|                 |                 |                 | present if this |
|                 |                 |                 | is a coinbase   |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``vout`` | number (int)    | Optional(0 or   | The output      |
|                 |                 | 1)              | index number    |
|                 |                 |                 | (vout) of the   |
|                 |                 |                 | outpoint being  |
|                 |                 |                 | spent. The      |
|                 |                 |                 | first output in |
|                 |                 |                 | a transaction   |
|                 |                 |                 | has an index of |
|                 |                 |                 | ``0``. Not      |
|                 |                 |                 | present if this |
|                 |                 |                 | is a coinbase   |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → →             | object          | Optional(0 or   | An object       |
| →               |                 | 1)              | describing the  |
| \ ``scriptSig`` |                 |                 | signature       |
|                 |                 |                 | script of this  |
|                 |                 |                 | input. Not      |
|                 |                 |                 | present if this |
|                 |                 |                 | is a coinbase   |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string          | R               | The signature   |
| →\ ``asm``      |                 | equired(exactly | script in       |
|                 |                 | 1)              | decoded form    |
|                 |                 |                 | with            |
|                 |                 |                 | n               |
|                 |                 |                 | on-data-pushing |
|                 |                 |                 | opcodes listed  |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string (hex)    | R               | The signature   |
| →\ ``hex``      |                 | equired(exactly | script encoded  |
|                 |                 | 1)              | as hex          |
+-----------------+-----------------+-----------------+-----------------+
| → →             | string (hex)    | Optional(0 or   | The coinbase    |
| →\ ``coinbase`` |                 | 1)              | (similar to the |
|                 |                 |                 | hex field of a  |
|                 |                 |                 | scriptSig)      |
|                 |                 |                 | encoded as hex. |
|                 |                 |                 | Only present if |
|                 |                 |                 | this is a       |
|                 |                 |                 | coinbase        |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (Dash)   | O               | The number of   |
| →\ ``value``    |                 | ptional(exactly | Dash paid to    |
|                 |                 | 1)              | this output.    |
|                 |                 |                 | May be          |
|                 |                 |                 | ``0``.Only      |
|                 |                 |                 | present if      |
|                 |                 |                 | ``spentindex``  |
|                 |                 |                 | enabled         |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (duffs)  | O               | The number of   |
| →\ ``valueSat`` |                 | ptional(exactly | duffs paid to   |
|                 |                 | 1)              | this output.    |
|                 |                 |                 | May be          |
|                 |                 |                 | ``0``.Only      |
|                 |                 |                 | present if      |
|                 |                 |                 | ``spentindex``  |
|                 |                 |                 | enabled         |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string : array  | Optional(0 or   | The P2PKH or    |
| →               |                 | 1)              | P2SH addresses  |
| \ ``addresses`` |                 |                 | used in this    |
|                 |                 |                 | transaction, or |
|                 |                 |                 | the computed    |
|                 |                 |                 | P2PKH address   |
|                 |                 |                 | of any pubkeys  |
|                 |                 |                 | in this         |
|                 |                 |                 | transaction.    |
|                 |                 |                 | This array will |
|                 |                 |                 | not be returned |
|                 |                 |                 | for             |
|                 |                 |                 | ``nulldata`` or |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | script          |
|                 |                 |                 | types.Only      |
|                 |                 |                 | present if      |
|                 |                 |                 | ``spentindex``  |
|                 |                 |                 | enabled         |
+-----------------+-----------------+-----------------+-----------------+
| → → → →         | string          | Required(1 or   | A P2PKH or P2SH |
| →Address        |                 | more)           | address         |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (int)    | R               | The input       |
| →\ ``sequence`` |                 | equired(exactly | sequence number |
|                 |                 | 1)              |                 |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``vout``     | array           | R               | An array of     |
|                 |                 | equired(exactly | objects each    |
|                 |                 | 1)              | describing an   |
|                 |                 |                 | output vector   |
|                 |                 |                 | (vout) for this |
|                 |                 |                 | transaction.    |
|                 |                 |                 | Output objects  |
|                 |                 |                 | will have the   |
|                 |                 |                 | same order      |
|                 |                 |                 | within the      |
|                 |                 |                 | array as they   |
|                 |                 |                 | have in the     |
|                 |                 |                 | transaction, so |
|                 |                 |                 | the first       |
|                 |                 |                 | output listed   |
|                 |                 |                 | will be output  |
|                 |                 |                 | 0               |
+-----------------+-----------------+-----------------+-----------------+
| → →Output       | object          | Required(1 or   | An object       |
|                 |                 | more)           | describing one  |
|                 |                 |                 | of this         |
|                 |                 |                 | transaction’s   |
|                 |                 |                 | outputs         |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (Dash)   | R               | The number of   |
| →\ ``value``    |                 | equired(exactly | Dash paid to    |
|                 |                 | 1)              | this output.    |
|                 |                 |                 | May be ``0``    |
+-----------------+-----------------+-----------------+-----------------+
| → →             | number (duffs)  | R               | The number of   |
| →\ ``valueSat`` |                 | equired(exactly | duffs paid to   |
|                 |                 | 1)              | this output.    |
|                 |                 |                 | May be ``0``    |
+-----------------+-----------------+-----------------+-----------------+
| → → →\ ``n``    | number (int)    | R               | The output      |
|                 |                 | equired(exactly | index number of |
|                 |                 | 1)              | this output     |
|                 |                 |                 | within this     |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| → →             | object          | R               | An object       |
| →\ `            |                 | equired(exactly | describing the  |
| `scriptPubKey`` |                 | 1)              | pubkey script   |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string          | R               | The pubkey      |
| →\ ``asm``      |                 | equired(exactly | script in       |
|                 |                 | 1)              | decoded form    |
|                 |                 |                 | with            |
|                 |                 |                 | n               |
|                 |                 |                 | on-data-pushing |
|                 |                 |                 | opcodes listed  |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string (hex)    | R               | The pubkey      |
| →\ ``hex``      |                 | equired(exactly | script encoded  |
|                 |                 | 1)              | as hex          |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | number (int)    | Optional(0 or   | The number of   |
| →\ ``reqSigs``  |                 | 1)              | signatures      |
|                 |                 |                 | required; this  |
|                 |                 |                 | is always ``1`` |
|                 |                 |                 | for P2PK,       |
|                 |                 |                 | P2PKH, and P2SH |
|                 |                 |                 | (including P2SH |
|                 |                 |                 | multisig        |
|                 |                 |                 | because the     |
|                 |                 |                 | redeem script   |
|                 |                 |                 | is not          |
|                 |                 |                 | available in    |
|                 |                 |                 | the pubkey      |
|                 |                 |                 | script). It may |
|                 |                 |                 | be greater than |
|                 |                 |                 | 1 for bare      |
|                 |                 |                 | multisig. This  |
|                 |                 |                 | value will not  |
|                 |                 |                 | be returned for |
|                 |                 |                 | ``nulldata`` or |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | script types    |
|                 |                 |                 | (see the        |
|                 |                 |                 | ``type`` key    |
|                 |                 |                 | below)          |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string          | Optional(0 or   | The type of     |
| →\ ``type``     |                 | 1)              | script. This    |
|                 |                 |                 | will be one of  |
|                 |                 |                 | the following:• |
|                 |                 |                 | ``pubkey`` for  |
|                 |                 |                 | a P2PK script•  |
|                 |                 |                 | ``pubkeyhash``  |
|                 |                 |                 | for a P2PKH     |
|                 |                 |                 | script•         |
|                 |                 |                 | ``scripthash``  |
|                 |                 |                 | for a P2SH      |
|                 |                 |                 | script•         |
|                 |                 |                 | ``multisig``    |
|                 |                 |                 | for a bare      |
|                 |                 |                 | multisig        |
|                 |                 |                 | script•         |
|                 |                 |                 | ``nulldata``    |
|                 |                 |                 | for nulldata    |
|                 |                 |                 | scripts•        |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | for unknown     |
|                 |                 |                 | scripts         |
+-----------------+-----------------+-----------------+-----------------+
| → → →           | string : array  | Optional(0 or   | The P2PKH or    |
| →               |                 | 1)              | P2SH addresses  |
| \ ``addresses`` |                 |                 | used in this    |
|                 |                 |                 | transaction, or |
|                 |                 |                 | the computed    |
|                 |                 |                 | P2PKH address   |
|                 |                 |                 | of any pubkeys  |
|                 |                 |                 | in this         |
|                 |                 |                 | transaction.    |
|                 |                 |                 | This array will |
|                 |                 |                 | not be returned |
|                 |                 |                 | for             |
|                 |                 |                 | ``nulldata`` or |
|                 |                 |                 | ``nonstandard`` |
|                 |                 |                 | script types    |
+-----------------+-----------------+-----------------+-----------------+
| → → → →         | string          | Required(1 or   | A P2PKH or P2SH |
| →Address        |                 | more)           | address         |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``ext        | number (int)    | Optional(0 or   | *Added in Dash  |
| raPayloadSize`` |                 | 1)              | Core            |
|                 |                 |                 | 0.13.0.0*\ Size |
|                 |                 |                 | of the DIP2     |
|                 |                 |                 | extra payload.  |
|                 |                 |                 | Only present if |
|                 |                 |                 | it’s a DIP2     |
|                 |                 |                 | special         |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| →\ `            | string (hex)    | Optional(0 or   | *Added in Dash  |
| `extraPayload`` |                 | 1)              | Core            |
|                 |                 |                 | 0.13.0.0*\ Hex  |
|                 |                 |                 | encoded DIP2    |
|                 |                 |                 | extra payload   |
|                 |                 |                 | data. Only      |
|                 |                 |                 | present if it’s |
|                 |                 |                 | a DIP2 special  |
|                 |                 |                 | transaction     |
+-----------------+-----------------+-----------------+-----------------+
| →               | string (hex)    | Optional(0 or   | If the          |
| \ ``blockhash`` |                 | 1)              | transaction has |
|                 |                 |                 | been included   |
|                 |                 |                 | in a block on   |
|                 |                 |                 | the local best  |
|                 |                 |                 | block chain,    |
|                 |                 |                 | this is the     |
|                 |                 |                 | hash of that    |
|                 |                 |                 | block encoded   |
|                 |                 |                 | as hex in RPC   |
|                 |                 |                 | byte order      |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``height``   | number (int)    | R               | The height of   |
|                 |                 | equired(exactly | this block on   |
|                 |                 | 1)              | its block chain |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``           | number (int)    | R               | If the          |
| confirmations`` |                 | equired(exactly | transaction has |
|                 |                 | 1)              | been included   |
|                 |                 |                 | in a block on   |
|                 |                 |                 | the local best  |
|                 |                 |                 | block chain,    |
|                 |                 |                 | this is how     |
|                 |                 |                 | many            |
|                 |                 |                 | confirmations   |
|                 |                 |                 | it has.         |
|                 |                 |                 | Otherwise, this |
|                 |                 |                 | is ``0``        |
+-----------------+-----------------+-----------------+-----------------+
| →\ ``time``     | number (int)    | Optional(0 or   | If the          |
|                 |                 | 1)              | transaction has |
|                 |                 |                 | been included   |
|                 |                 |                 | in a block on   |
|                 |                 |                 | the local best  |
|                 |                 |                 | block chain,    |
|                 |                 |                 | this is the     |
|                 |                 |                 | block header    |
|                 |                 |                 | time of that    |
|                 |                 |                 | block (may be   |
|                 |                 |                 | in the future)  |
+-----------------+-----------------+-----------------+-----------------+
| →               | number (int)    | Optional(0 or   | This field is   |
| \ ``blocktime`` |                 | 1)              | currently       |
|                 |                 |                 | identical to    |
|                 |                 |                 | the time field  |
|                 |                 |                 | described above |
+-----------------+-----------------+-----------------+-----------------+

*Examples from Dash Core 0.12.2*

Request a transaction in hex-encoded serialized transaction format:

.. code:: bash

   curl http://localhost:19998/rest/tx/b06edec446fbcc0fc04a6e2774a843823f5238c2e15de40e61767a44f6788d32.hex

Result (wrapped):

.. code:: text

   0100000001c91d4bb14e061f8f6b775ca8e62ec8a66739b375f169bce1964cee\
   a2368197e5000000006a473044022050644e406be3e463d94868c617309dc021\
   174551dbb340665f48119e110a72b2022022f3cc93deeb4c44ce70bebe8e7f0f\
   69c462f120eb64b47eeb77f0a62e9bd361012102f542dde7c155717ac8df05d0\
   fc8f65e2ecc078ecad42b23462f27832b441ffa5feffffff0200e1f505000000\
   001976a91443d11ad5889532f22f069b18b24489b1f94f253188ac7dbafa0800\
   0000001976a914bb900427682b8f7cae6779fb955a610ff71d68c888acce940000

Get the same transaction in JSON:

.. code:: bash

   curl http://localhost:19998/rest/tx/b06edec446fbcc0fc04a6e2774a843823f5238c2e15de40e61767a44f6788d32.json

Result (whitespace added):

.. code:: json

   {  
      "txid":"b06edec446fbcc0fc04a6e2774a843823f5238c2e15de40e61767a44f6788d32",
      "size":225,
      "version":1,
      "locktime":38094,
      "vin":[  
         {  
            "txid":"e5978136a2ee4c96e1bc69f175b33967a6c82ee6a85c776b8f1f064eb14b1dc9",
            "vout":0,
            "scriptSig":{  
               "asm":"3044022050644e406be3e463d94868c617309dc021174551dbb340665f48119e110a72b2022022f3cc93deeb4c44ce70bebe8e7f0f69c462f120eb64b47eeb77f0a62e9bd361[ALL] 02f542dde7c155717ac8df05d0fc8f65e2ecc078ecad42b23462f27832b441ffa5",
               "hex":"473044022050644e406be3e463d94868c617309dc021174551dbb340665f48119e110a72b2022022f3cc93deeb4c44ce70bebe8e7f0f69c462f120eb64b47eeb77f0a62e9bd361012102f542dde7c155717ac8df05d0fc8f65e2ecc078ecad42b23462f27832b441ffa5"
            },
            "sequence":4294967294
         }
      ],
      "vout":[  
         {  
            "value":1.00000000,
            "valueSat":100000000,
            "n":0,
            "scriptPubKey":{  
               "asm":"OP_DUP OP_HASH160 43d11ad5889532f22f069b18b24489b1f94f2531 OP_EQUALVERIFY OP_CHECKSIG",
               "hex":"76a91443d11ad5889532f22f069b18b24489b1f94f253188ac",
               "reqSigs":1,
               "type":"pubkeyhash",
               "addresses":[  
                  "ySW2cuvm2wJ4EU5KzX4waYfFPV3xQni6Nm"
               ]
            }
         },
         {  
            "value":1.50649469,
            "valueSat":150649469,
            "n":1,
            "scriptPubKey":{  
               "asm":"OP_DUP OP_HASH160 bb900427682b8f7cae6779fb955a610ff71d68c8 OP_EQUALVERIFY OP_CHECKSIG",
               "hex":"76a914bb900427682b8f7cae6779fb955a610ff71d68c888ac",
               "reqSigs":1,
               "type":"pubkeyhash",
               "addresses":[  
                  "ydRBjVr78ejCqXuGs2wbtYoFpGbDkqV8V4"
               ]
            }
         }
      ],
      "blockhash":"0000000003b6a57e3614176e5b93caf9498009853e06d16028ebffeb361afda5",
      "height":38095,
      "confirmations":9,
      "time":1512596315,
      "blocktime":1512596315
   }

*See also*

-  `GetRawTransaction </docs/core-api-ref-remote-procedure-calls-raw-transactions#getrawtransaction>`__
   RPC: gets a hex-encoded serialized transaction or a JSON object
   describing the transaction. By default, Dash Core only stores
   complete transaction data for UTXOs and your own transactions, so the
   RPC may fail on historic transactions unless you use the non-default
   ``txindex=1`` in your Dash Core startup settings.
-  `GetTransaction </docs/core-api-ref-remote-procedure-calls-wallet#gettransaction>`__
   RPC: gets detailed information about an in-wallet transaction.
