#!/usr/bin/env sh
set -eu

kubectl apply -f k8s/00-namespace.yaml
kubectl apply -f k8s/rabbitmq/
kubectl apply -f k8s/databases/
kubectl apply -f k8s/apps/
