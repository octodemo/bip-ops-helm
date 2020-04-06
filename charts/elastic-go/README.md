# elastic-go

This chart will install a pod with elastic-go install to help gather stats from ElasticSearch.

# Installation

The default values are good for prod8. So to install simply run the following:

```bash
$ helm3 install elastic-go .
```

This will start a pod named `elastic-go-*`. You can then exec into the pod to run commands.

```bash
$ kubectl exec -it elastic-go -- /bin/sh
```

Then you can run commands with the alias `e`.

```bash
$ e cluster health
{
  "active_primary_shards": 926,
  "active_shards": 1852,
  "active_shards_percent_as_number": 100,
  "cluster_name": "elasticsearch",
  "delayed_unassigned_shards": 0,
  "initializing_shards": 0,
  "number_of_data_nodes": 3,
  "number_of_in_flight_fetch": 0,
  "number_of_nodes": 9,
  "number_of_pending_tasks": 0,
  "relocating_shards": 0,
  "status": "green",
  "task_max_waiting_in_queue_millis": 0,
  "timed_out": false,
  "unassigned_shards": 0
}
```

# Notes

You can shorten `cluster` to `c` and run `e c health`.
