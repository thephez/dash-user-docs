#!/bin/bash

# Core Reference
find . -iname "*.md" -exec sed -i 's~](core-ref-block-chain-block-headers~](\.\./ref/core-ref-block-chain-block-headers.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-block-chain-serialized-blocks~](\.\./ref/core-ref-block-chain-serialized-blocks.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-transactions-raw-transaction-format~](\.\./ref/core-ref-transactions-raw-transaction-format.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-transactions-special-transactions~](\.\./ref/core-ref-transactions-special-transactions.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-p2p-network-protocol-versions~](\.\./ref/core-ref-p2p-network-protocol-versions.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-transactions-opcodes~](\.\./ref/core-ref-transactions-opcodes.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-wallets~](\.\./ref/core-ref-wallets.md~g' {} +


# Guide
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features-chainlocks~](\.\./guide/core-guide-dash-features-chainlocks.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features-governance~](\.\./guide/core-guide-dash-features-governance.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features-historical-reference~](\.\./guide/core-guide-dash-features-historical-reference.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features-instantsend~](\.\./guide/core-guide-dash-features-instantsend.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features-masternode-payment~](\.\./guide/core-guide-dash-features-masternode-payment.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features-masternode-quorums~](\.\./guide/core-guide-dash-features-masternode-quorums.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features-masternode-sync~](\.\./guide/core-guide-dash-features-masternode-sync.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features-privatesend~](\.\./guide/core-guide-dash-features-privatesend.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features-proof-of-service~](\.\./guide/core-guide-dash-features-proof-of-service.md~g' {} +

find . -iname "*.md" -exec sed -i 's~](core-guide-transactions-locktime-and-sequence-number~](\.\./guide/core-guide-transactions-locktime-and-sequence-number.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-p2p-network-initial-block-download~](\.\./guide/core-guide-p2p-network-initial-block-download.md~g' {} +

find . -iname "*.md" -exec sed -i 's~](core-guide-wallets-wallet-files~](\.\./guide/core-guide-wallets-wallet-files.md~g' {} +


# API Reference
find . -iname "*.md" -exec sed -i 's~](core-api-ref-remote-procedure-call-quick-reference~](\.\./api-ref/core-api-ref-remote-procedure-call-quick-reference.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-blockchain~](\.\./api-ref/core-api-ref-remote-procedure-calls-blockchain.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-control~](\.\./api-ref/core-api-ref-remote-procedure-calls-control.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-dash~](\.\./api-ref/core-api-ref-remote-procedure-calls-dash.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-evo~](\.\./api-ref/core-api-ref-remote-procedure-calls-evo.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-generating~](\.\./api-ref/core-api-ref-remote-procedure-calls-generating.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-mining~](\.\./api-ref/core-api-ref-remote-procedure-calls-mining.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-network~](\.\./api-ref/core-api-ref-remote-procedure-calls-network.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-api-ref-remote-procedure-calls-raw-transactions~](\.\./api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-raw-transactions~](\.\./api-ref/core-api-ref-remote-procedure-calls-raw-transactions.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-removed~](\.\./api-ref/core-api-ref-remote-procedure-calls-removed.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-util~](\.\./api-ref/core-api-ref-remote-procedure-calls-util.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-wallet-deprecated~](\.\./api-ref/core-api-ref-remote-procedure-calls-wallet-deprecated.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-wallet~](\.\./api-ref/core-api-ref-remote-procedure-calls-wallet.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-zmq~](\.\./api-ref/core-api-ref-remote-procedure-calls-zmq.md~g' {} +

find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-http-rest-requests~](\.\./api-ref/core-api-ref-http-rest-requests.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-api-ref-zmq~](\.\./api-ref/core-api-ref-zmq.md~g' {} +

# Dash Core

find . -iname "*.md" -exec sed -i 's~](dash-core-wallet-arguments-and-commands-dashd~](\.\./dash-core/dash-core-wallet-arguments-and-commands-dashd.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](dash-core-wallet-arguments-and-commands-dash-cli~](\.\./dash-core/dash-core-wallet-arguments-and-commands-dash-cli.md~g' {} +

# Example

find . -iname "*.md" -exec sed -i 's~](core-example-p2p-network-parsing-a-merkleblock~](\.\./examples/core-examples-p2p-network-parsing-a-merkleblock.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-examples-p2p-network-creating-a-bloom-filter~](\.\./examples/core-examples-p2p-network-creating-a-bloom-filter.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-examples-transaction-tutorial-complex-raw-transaction~](\.\./examples/core-examples-transaction-tutorial-complex-raw-transaction.md~g' {} +