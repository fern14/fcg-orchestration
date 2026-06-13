#!/usr/bin/env sh
set -eu

kubectl delete -f k8s/apps/ --ignore-not-found=true
kubectl delete -f k8s/databases/ --ignore-not-found=true
kubectl delete -f k8s/rabbitmq/ --ignore-not-found=true
kubectl delete -f k8s/00-namespace.yaml --ignore-not-found=true
