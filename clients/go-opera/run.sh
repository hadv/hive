#!/bin/bash

# Immediately abort the script on any error encountered
set -e

# Configure the chain.
mv /genesis.json /genesis-input.json
jq -f /mapper.jq /genesis-input.json > /genesis.json

# Just try to run the fakenet with just one validator (which will work practically as a PoA blockchain)
/opera --fakenet=1/1 \
    --init=/genesis.json \
    --nat=none \
    --http --http.addr="0.0.0.0" \
    --http.corsdomain="*" \
    --http.api="eth,debug,net,admin,web3,personal,txpool,ftm,dag" \
    --ws --ws.addr="0.0.0.0" \
    --ws.origins="*" --ws.api="eth,debug,net,admin,web3,personal,txpool,ftm,dag" \
    --verbosity=3
