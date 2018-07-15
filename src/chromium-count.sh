#!/bin/bash
curl -fsSL https://cs.chromium.org/codesearch/f/chromium/src/net/http/transport_security_state_static.json | grep -vE '^[[:space:]]*//' | jq -r '.entries[] | if .mode == "force-https" then .name else null end' | wc -l
