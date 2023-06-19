#!/bin/bash
kubectl run bbox --dry-run=client -o yaml \
  --restart=Never --image=busybox --env="WORLD=world" -o yaml \
  --command -- /bin/sh -c 'echo Hello $WORLD' \
  | yq '.spec.volumes[0].name="tmpdir"
  | .spec.volumes[0].emptyDir={}
  | .spec.containers[0].volumeMounts[0].name="tmpdir"
  | .spec.containers[0].volumeMounts[0].mountPath="/data/tmp"
  | del(.status, .metadata.creationTimestamp, .spec.dnsPolicy, .spec.resources)'