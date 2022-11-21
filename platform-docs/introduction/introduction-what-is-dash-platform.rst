Dash Platform is a technology stack for building decentralized
applications on the Dash network. The two main architectural components,
`Drive <explanation-drive>`__ and `DAPI <explanation-dapi>`__, turn the
Dash P2P network into a cloud that developers can integrate with their
applications.

Key Advantages
==============

Decentralized Cloud Storage
---------------------------

Store your application data in the safest place on the Internet. All
data stored on the Dash network is protected by Dash’s consensus
algorithm, ensuring data integrity and availability.

Reduced Data Silos
------------------

Because your application data is decentralized among the nodes of the
Dash network, your data is safe and always available for customers,
business partners, and investors.

Client Libraries
----------------

Write code and integrate with Dash Platform using the languages that
matter to your business. Don’t worry about understanding blockchain
infrastructure: a growing number of client libraries abstract away the
complexity typically associated with working on blockchain-based
networks.

Instant Data Confirmation
-------------------------

Unlike many blockchain-based networks, data stored on the platform is
instantly confirmed by the Dash consensus algorithm to ensure the best
user experience for users. With Dash Platform, you can gain the
advantages of a blockchain-based storage network without the usual UX
compromises. [block:image] { “images”: [ { “image”: [
“https://files.readme.io/2213390-join-community.svg”,
“join-community.svg”, 171, 150, “#ffffff” ], “sizing”: “60” } ] }
[/block] # Key Components ## DAPI - A decentralized API

DAPI is an HTTP API exposing `JSON-RPC <https://www.jsonrpc.org/>`__ and
`gRPC <https://grpc.io/>`__ endpoints. Through these endpoints,
developers can send and retrieve application data, as well as query the
Dash blockchain.

DAPI provides developers with the same access and security of a full
node, without the cost and maintenance overhead. Unlike traditional APIs
which have a single point of failure, DAPI allows clients to connect to
different instances depending on resource availability in the Dash
network.

Developers have the option to connect to DAPI directly or use a client
library. This initial client library, dapi-client, is a relatively
simple API wrapper developed by Dash Core Group to provide function
calls to the DAPI endpoints.

The source for both DAPI and dapi-client are available on GitHub: -
DAPI: https://github.com/dashevo/platform/tree/master/packages/dapi -
DAPI-Client:
https://github.com/dashevo/platform/tree/master/packages/js-dapi-client

Drive - Decentralized Storage
-----------------------------

Drive is Dash Platform’s storage component, allowing for consensus-based
verification and validation of user created data. In order for this to
occur, developers create a `data
contract <explanation-platform-protocol-data-contract>`__. This data
contract describes the data structures that comprise an application,
similar to creating a schema for a document-oriented database like
MongoDB.

Data created by users of the application is validated and verified
against this contract. Upon successful validation/verification,
application data is uploaded to Drive, where it is stored on the
masternode network.

The source is available on GitHub: - Drive:
https://github.com/dashevo/platform/tree/master/packages/js-drive
