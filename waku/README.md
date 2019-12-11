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

Doesn't do much right now.

## Running manually (WIP atm)

TODO: Migrate this to submodule and this repo once basics work there.

TODO: This is still using Whisper layer, not Waku, should be fixed once basics work.

NOTE: This is connecting to mainnet cluster. Alternative topologies are: private (need to fix docker bootstrap nodes / embed here) and direct connect (issue with out of proc keypair persistence).

In `nim-eth`, see https://github.com/status-im/nim-eth/pull/145:

```
nim c -o:waku_simulation tests/p2p/waku_simulation.nim

# Two separate terminals
./waku_simulation --port=30000 --mainnet --watch
./waku_simulation --port=30001 --mainnet --post
```

### Current issue

Expected result: See messages (handler log) appearing in watch process.

Actual result: Connected to Whisper nodes, messages appear to be sent and filters installed, but no messages coming through.

Note: Noticed some `WRN 2019-12-11 13:46:56+08:00 Message PoW too low                        topics="whisper" tid=8053 minPow=0.2 pow=0.0003289473684210526`, unclear if related or mainnet artifact.

### Minimal Scenario to support

Minimal KISS: One node is sending 10 messages over some fixed topic. Another node is listening to that topic. What's the bandwidth usage?

## Bandwidth usage

TODO: We do a coarse check of bandwidth usage by tracking number of total envelopes received/sent.

Note that this doesn't necessarily capture all traffic, such as Discovery etc.

### Out of band verification

To verify that stats seem roughly accurate out of band, use e.g. https://github.com/raboof/nethogs

`sudo nethogs -v 3`:

```
>   27340 oskarth  ./shh_client                                                      wlp2s0      0.113	   0.192 MB
``

This shows bandwidth usage per process. Note that this has to be started before the process.
