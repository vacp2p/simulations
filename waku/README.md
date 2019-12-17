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

<!--
`./start.sh`

Doesn't do much right now.
-->

## Running manually (WIP atm)

TODO: Once waku-mode branch is merged, use as submodule

From https://github.com/status-im/nimbus/pull/437:

```
./build/wakunode --log-level:DEBUG --bootnode-only --nodekey:5dc5381cae54ba3174dc0d46040fe11614d0cc94d41185922585198b4fcef9d3

./build/wakunode --log-level:DEBUG --bootnodes:enode://e5fd642a0f630bbb1e4cd7df629d7b8b019457a9a74f983c0484a045cebb176def86a54185b50bbba6bbf97779173695e92835d63109c23471e6da382f922fdb@0.0.0.0:30303 --rpc --ports-shift:1 --waku-mode:WakuSan

./build/wakunode --log-level:DEBUG --bootnodes:enode://e5fd642a0f630bbb1e4cd7df629d7b8b019457a9a74f983c0484a045cebb176def86a54185b50bbba6bbf97779173695e92835d63109c23471e6da382f922fdb@0.0.0.0:30303 --rpc --ports-shift:2 --waku-mode:WakuChan

./build/quicksim
```

### Minimal Scenario to support

Minimal KISS: One node is sending 10 messages over some fixed topic. Another node is listening to that topic. What's the bandwidth usage?

NOTE: It's all over localhost and using RPC, and a bit difficult to disentangle through nethogs/iotops etc.

TODO: Try running through Docker for cleaner stats

TODO: Get envelope counter up and running to get basic multiplier stats

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
