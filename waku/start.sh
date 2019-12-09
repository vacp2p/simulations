#!/bin/bash

set -eo pipefail

SIM_ROOT="$(pwd)"
SIMULATION_DIR="${SIM_ROOT}/data"
WAKU_NODE_BIN="${SIMULATION_DIR}/waku_node"

echo "$SIM_ROOT"

cd "$SIM_ROOT"

mkdir -p "$SIMULATION_DIR"

# NIMFLAGS
# DEFS

# XXX: Right now this is shh basic client
echo "Building $WAKU_NODE_BIN"

echo "Running $WAKU_NODE_BIN"
${WAKU_NODE_BIN}
