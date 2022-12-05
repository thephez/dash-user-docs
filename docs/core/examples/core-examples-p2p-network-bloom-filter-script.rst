Complete Python script demonstrating the
`Creating <core-examples-p2p-network-creating-a-bloom-filter>`__/`Evaluating <core-examples-p2p-network-evaluating-a-bloom-filter>`__
bloom filter examples (available
`here <https://gist.github.com/dash-docs/5d63f095352a717f90d41a5e7fbbdac1#file-bloom_filter_example-py>`__):
[block:code] { “codes”: [ { “code”: "#!/usr/bin/env
python:raw-latex:`\nfrom `math import log:raw-latex:`\nfrom `bitarray
import bitarray # from
pypi.python.org/pypi/bitarray:raw-latex:`\nimport `pyhash # from
https://github.com/flier/pyfasthash:raw-latex:`\n`:raw-latex:`\n`# Based
on BIP-37:raw-latex:`\n`#
https://github.com/QuantumExplorer/bips/blob/master/bip-0037.mediawiki:raw-latex:`\n`:raw-latex:`\n`#
Defined in bloom.h:raw-latex:`\n`#
https://github.com/dashpay/dash/blob/master/src/bloom.h#L19-#L20:raw-latex:`\nMAX`\_BLOOM_FILTER_SIZE
= 36000:raw-latex:`\nMAX`\_HASH_FUNCS =
50:raw-latex:`\n`:raw-latex:`\n`# Set of flags that control how matched
items are added to the filter (per BIP-37):raw-latex:`\n`#
https://github.com/dashpay/dash/blob/master/src/bloom.h#L26:raw-latex:`\nnFlags `=
0:raw-latex:`\n`:raw-latex:`\nnElements `= 1 # Number of
elements:raw-latex:`\nnFPRate `= 0.0001 # False positive
rate:raw-latex:`\n`:raw-latex:`\nnFilterBytes `= int(min((-1 / log(2)**2
\* nElements \* log(nFPRate)) / 8,
MAX_BLOOM_FILTER_SIZE)):raw-latex:`\n`:raw-latex:`\n`# Calculate the
number of hash functions to use in the filter:raw-latex:`\n`# Limit the
maximum number to 50 per BIP-37:raw-latex:`\nnHashFuncs `=
int(min(nFilterBytes \* 8 / nElements \* log(2),
MAX_HASH_FUNCS)):raw-latex:`\n`:raw-latex:`\nmurmur3` =
pyhash.murmur3_32():raw-latex:`\n`:raw-latex:`\nTEST`\_TXID =
"019f5b01d4195ecbc9398fbf3c3b1fa9bb3183301d7a1fb3bd174fcfa40a2b65":raw-latex:`\n`:raw-latex:`\ndef `bloom_hash(nHashNum,
data)::raw-latex:`\n    `seed = (nHashNum \* 0xfba4c795 + nTweak) &
0xffffffff:raw-latex:`\n    `return( murmur3(data, seed=seed) %
(nFilterBytes \* 8) ):raw-latex:`\n`:raw-latex:`\n`:raw-latex:`\n`#
Bloom Filter
creation:raw-latex:`\ndef `create_filter(nTweak)::raw-latex:`\n    `print(‘Creating
bloom filter’):raw-latex:`\n    `vData = nFilterBytes \* 8 \*
bitarray(‘0’,
endian="little"):raw-latex:`\n`:raw-latex:`\n    `data_to_hash =
TEST_TXID:raw-latex:`\n    `data_to_hash =
data_to_hash.decode("hex"):raw-latex:`\n`:raw-latex:`\n    `print(‘Filter
bytes: {}; Hash functions: {}’.format(nFilterBytes,
nHashFuncs)):raw-latex:`\n`:raw-latex:`\n    `print(" Filter (As
Bits)"):raw-latex:`\n    `print("nHashNum nIndex Filter
0123456789abcdef"):raw-latex:`\n    `print("~~~~~~~~ ~~~~~~ ~~~~~~
~~~~~~~~~~~~~~~~"):raw-latex:`\n    `for nHashNum in
range(nHashFuncs)::raw-latex:`\n        `nIndex = bloom_hash(nHashNum,
data_to_hash):raw-latex:`\n`:raw-latex:`\n        `## Set the bit at
nIndex to 1:raw-latex:`\n        `vData[nIndex] =
True:raw-latex:`\n`:raw-latex:`\n        `## Debug: print current
state:raw-latex:`\n        `print(’ {0:2} {1:2} {2}
{3}‘.format(:raw-latex:`\n            `nHashNum,:raw-latex:`\n            `hex(int(nIndex)),:raw-latex:`\n            `vData.tobytes().encode("hex"),:raw-latex:`\n            `vData.to01():raw-latex:`\n        `)):raw-latex:`\n`:raw-latex:`\n    `print(’Bloom
filter:
{}\n’.format(vData.tobytes().encode("hex"))):raw-latex:`\n`:raw-latex:`\n`:raw-latex:`\n`#
Bloom Filter
evaluation:raw-latex:`\ndef `evaluate_filter()::raw-latex:`\n    `print(‘Evaluating
bloom filter’):raw-latex:`\n    `vData =
bitarray(endian=‘little’):raw-latex:`\n    `vData.frombytes("b50f".decode("hex")):raw-latex:`\n    `nHashFuncs
= 11:raw-latex:`\n    `nTweak = 0:raw-latex:`\n    `nFlags =
0:raw-latex:`\n`:raw-latex:`\n    `def contains(nHashFuncs,
data_to_hash)::raw-latex:`\n        `for nHashNum in
range(nHashFuncs)::raw-latex:`\n            `## bloom_hash as defined in
previous section:raw-latex:`\n            `nIndex = bloom_hash(nHashNum,
data_to_hash):raw-latex:`\n`:raw-latex:`\n            `if vData[nIndex]
!= True::raw-latex:`\n                `print("MATCH FAILURE: Index {0}
not set in
{1}\n".format(:raw-latex:`\n                    `hex(int(nIndex)),:raw-latex:`\n                    `vData.to01():raw-latex:`\n                `)):raw-latex:`\n                `return
False:raw-latex:`\n        `print("MATCH
SUCCESS\n"):raw-latex:`\n`:raw-latex:`\n    `## Test 1: Same TXID as
previously added to filter:raw-latex:`\n    `data_to_hash =
TEST_TXID:raw-latex:`\n    `print(‘\\nChecking:
{}’.format(data_to_hash)):raw-latex:`\n    `data_to_hash =
data_to_hash.decode("hex"):raw-latex:`\n    `contains(nHashFuncs,
data_to_hash):raw-latex:`\n`:raw-latex:`\n    `## Test 2: Arbitrary
string:raw-latex:`\n    `data_to_hash = "1/10,000 chance this ASCII
string will match":raw-latex:`\n    `print(‘Checking:
{}’.format(data_to_hash)):raw-latex:`\n    `contains(nHashFuncs,
data_to_hash):raw-latex:`\n`:raw-latex:`\n`:raw-latex:`\n`# Tweak is a
random value added to the seed value in the hash
function:raw-latex:`\n`# used by the bloom filter:raw-latex:`\nnTweak `=
0:raw-latex:`\n`:raw-latex:`\ncreate`\_filter(nTweak):raw-latex:`\nevaluate`\_filter()“,”language“:”python"
} ] } [/block]
