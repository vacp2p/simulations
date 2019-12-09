# Waku simulation

**Primary goal:**

1. Test bandwidth consumption to ensure Waku mode solves what it claims to do.

**Secondary goals:**

2. Ensure compatibility between clients.
3. Testbed for accounting for resources.

**Inspiration:**

[nim-beacon-chain](https://github.com/status-im/nim-beacon-chain), with:

> make VALIDATORS=192 NODES=6 USER_NODES=1 eth2_network_simulation
> make USE_MULTITAIL="yes" eth2_network_simulation


And progressively more sophisticated modes. That is, starting with a basic simulation, then testnet, multi client test net, monitoring, state simulation, and so on.

For now, basics are enough. I.e. a few nodes that send some Waku envelopes between eachother.

## To run

`./start.sh`
