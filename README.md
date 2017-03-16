## lookup-srv

DNS lookup utility for SRV records.

Useful for pod initializations in Kubernetes statefulsets.

### Usage

It takes `-srv` option for SRV name:

```console
$ lookup-srv -srv=pg-ha
node-0.pg-ha.default.svc.cluster.local
node-1.pg-ha.default.svc.cluster.local
node-2.pg-ha.default.svc.cluster.local
```

Or from `SRV_NAME` environment variable:

```console
$ SRV_NAME=pg-ha lookup-srv
node-0.pg-ha.default.svc.cluster.local
node-1.pg-ha.default.svc.cluster.local
node-2.pg-ha.default.svc.cluster.local
```

You can pass shell script with `-script` option:
```console
$ lookup-srv -srv=pg-ha -script="xargs getent hosts | cut -d' ' -f 1"
10.4.9.115      node-0.pg-ha.default.svc.cluster.local node-0
10.5.8.129      node-1.pg-ha.default.svc.cluster.local
10.6.7.137      node-2.pg-ha.default.svc.cluster.local

$ lookup-srv -srv=pg-ha -script="xargs getent hosts | cut -d' ' -f 1 | /opt/config.sh"
Configuring...
Master 10.4.9.115
Slave  10.5.8.129
Slave  10.6.7.137
OK
```
