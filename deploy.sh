#!/bin/bash

# Helm is installed with helmfile
if ! [ -x "$(command -v helmfile)" ]; then
  echo 'Error: Helmfile is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v kubectl)" ]; then
  echo 'Error: kubectl is not installed.' >&2
  exit 1
fi

echo "LOG: Creating manifests in ./kube"
kubectl apply -f ./kube/

echo "LOG: Helmfile apply"
helmfile apply
