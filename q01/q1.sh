#!/bin/bash
kubectl run bbox -o yaml --dry-run=client \
  --restart=Never --image=busybox --env="WORLD=world" \
  --command -- /bin/sh -c 'echo Hello $WORLD'
