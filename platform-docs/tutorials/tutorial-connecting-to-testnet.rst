The purpose of this tutorial is to walk through the steps necessary to
access the network.

Overview
========

Platform services are provided via a combination of HTTP and gRPC
connections to DAPI, and some connections to an Insight API. Although
one could interact with DAPI by connecting to these directly, or by
using
`DAPI-client <https://github.com/dashevo/platform/tree/master/packages/js-dapi-client>`__,
the easiest approach is to use the `JavaScript Dash
SDK <https://github.com/dashevo/platform/tree/master/packages/js-dash-sdk>`__.

   📘

   The Dash SDK connects to testnet by default.

Prerequisites
=============

-  An installation of `NodeJS v12 or
   higher <https://nodejs.org/en/download/>`__

Connect via Dash SDK
====================

1. Install the Dash SDK
-----------------------

The JavaScript SDK package is available from npmjs.com and can be
installed by running ``npm install dash`` from the command line:
[block:code] { “codes”: [ { “code”: “npm install dash”, “language”:
“shell” } ] } [/block] ## 2. Connect to Dash Platform

Create a file named ``dashConnect.js`` with the following contents. Then
run it by typing ``node dashConnect.js`` from the command line:
[block:code] { “codes”: [ { “code”: “const Dash =
require(‘dash’);:raw-latex:`\n`:raw-latex:`\nconst `client = new
Dash.Client();:raw-latex:`\n`:raw-latex:`\nasync `function connect()
{:raw-latex:`\n  `return await
client.getDAPIClient().core.getBestBlockHash();:raw-latex:`\n`}:raw-latex:`\n`:raw-latex:`\nconnect`():raw-latex:`\n  `.then((d)
=> console.log(‘Connected. Best block hash:\n’,
d)):raw-latex:`\n  `.catch((e) => console.error(‘Something went
wrong:\n’, e)):raw-latex:`\n  `.finally(() => client.disconnect());”,
“language”: “javascript”, “name”: “dashConnect.js” } ] } [/block] Once
this returns successfully, you’re ready to begin developing! See the
`Quickstart <tutorials-introduction#quickstart>`__ for recommended next
steps. For details on all SDK options and methods, please refer to the
`SDK documentation <https://dashevo.github.io/platform/SDK/>`__.

Connect to a Devnet
===================

The SDK also supports connecting to development networks (devnets).
Since devnets can be created by anyone, the client library will be
unaware of them unless connection information is provided using one of
the options described below.

Connect via Seed
----------------

Using a seed node is the preferred method in most cases. The client uses
the provided seed node to a retrieve a list of available masternodes on
the network so requests can be spread across the entire network.
[block:code] { “codes”: [ { “code”: “const Dash =
require(‘dash’);:raw-latex:`\n`:raw-latex:`\nconst `client = new
Dash.Client({:raw-latex:`\n  `seeds: [{:raw-latex:`\n    `host:
‘seed-1.testnet.networks.dash.org’,:raw-latex:`\n    `httpPort:
3000,:raw-latex:`\n    `grpcPort:
3010,:raw-latex:`\n  `}],:raw-latex:`\n`});:raw-latex:`\n`:raw-latex:`\nasync `function
connect() {:raw-latex:`\n  `return await
client.getDAPIClient().core.getBestBlockHash();:raw-latex:`\n`}:raw-latex:`\n`:raw-latex:`\nconnect`():raw-latex:`\n  `.then((d)
=> console.log(‘Connected. Best block hash:\n’,
d)):raw-latex:`\n  `.catch((e) => console.error(‘Something went
wrong:\n’, e)):raw-latex:`\n  `.finally(() => client.disconnect());”,
“language”: “javascript” } ] } [/block] ## Connect via Address

Custom addresses may be directly specified via ``dapiAddresses`` in
cases where it is beneficial to know exactly what node(s) are being
accessed (e.g. debugging, local development, etc.). [block:code] {
“codes”: [ { “code”: “const Dash =
require(‘dash’);:raw-latex:`\n`:raw-latex:`\nconst `client = new
Dash.Client({:raw-latex:`\n  `dapiAddresses:
[:raw-latex:`\n    `‘127.0.0.1:3000:3010’,:raw-latex:`\n    `‘127.0.0.2:3000:3010’,:raw-latex:`\n  `],:raw-latex:`\n`});:raw-latex:`\n`:raw-latex:`\nasync `function
connect() {:raw-latex:`\n  `return await
client.getDAPIClient().core.getBestBlockHash();:raw-latex:`\n`}:raw-latex:`\n`:raw-latex:`\nconnect`():raw-latex:`\n  `.then((d)
=> console.log(‘Connected. Best block hash:\n’,
d)):raw-latex:`\n  `.catch((e) => console.error(‘Something went
wrong:\n’, e)):raw-latex:`\n  `.finally(() => client.disconnect());”,
“language”: “javascript” } ] } [/block] # Connect Directly to DAPI
(Optional)

   🚧 Advanced Topic

   Normally, the Dash SDK, dapi-client, or another library should be
   used to interact with DAPI. This may be helpful for debugging in some
   cases, but generally is not required.

The example below demonstrates retrieving the hash of the best block
hash directly from a DAPI node via command line and several languages:
[block:code] { “codes”: [ { “code”: “curl –request POST
\\:raw-latex:`\n  `–url http://seed-1.testnet.networks.dash.org:3000/
\\:raw-latex:`\n  `–header ‘content-type: application/json’
\\:raw-latex:`\n  `–data
‘{"method":"getBlockHash","id":1,"jsonrpc":"2.0","params":{"height": 100
}}’”, “language”: “shell”, “name”: null }, { “code”: “import
requests:raw-latex:`\n`:raw-latex:`\nurl `=
"http://seed-1.testnet.networks.dash.org:3000/":raw-latex:`\n`:raw-latex:`\npayload `=
"{\"method\":\"getBlockHash\",\"id\":1,\"jsonrpc\":\"2.0\",\"params\":{\"height\":100}}":raw-latex:`\nheaders `=
{‘content-type’:
‘application/json’}:raw-latex:`\n`:raw-latex:`\nresponse `=
requests.request("POST", url, data=payload,
headers=headers):raw-latex:`\n`:raw-latex:`\nprint`(response.text):raw-latex:`\n`”,
“language”: “python”, “name”: “Python” }, { “code”: “require
‘uri’:raw-latex:`\nrequire `‘net/http’:raw-latex:`\n`:raw-latex:`\nurl `=
URI("http://seed-1.testnet.networks.dash.org:3000/"):raw-latex:`\n`:raw-latex:`\nhttp `=
Net::HTTP.new(url.host, url.port):raw-latex:`\n`:raw-latex:`\nrequest `=
Net::HTTP::Post.new(url):raw-latex:`\nrequest[\"content-type\"] `=
‘application/json’:raw-latex:`\nrequest`.body =
"{\"method\":\"getBlockHash\",\"id\":1,\"jsonrpc\":\"2.0\",\"params\":{\"height\":100}}":raw-latex:`\n`:raw-latex:`\nresponse `=
http.request(request):raw-latex:`\nputs `response.read_body”,
“language”: “ruby” } ] } [/block]
