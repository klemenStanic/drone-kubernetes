#!/bin/bash
envsubst < /tmp/kube_config > kube_config
KUBECONFIG=kube_config
export KUBECONFIG

kubectl config use-context --kubeconfig=kube_config $PLUGIN_K8S_CLUSTER_NAME 
kubectl rollout restart deployment $PLUGIN_K8S_DEPLOYMENT_NAME -n develop
echo "Redeployed $PLUGIN_K8S_DEPLOYMENT_NAME to K8S cluster at $PLUGIN_K8S_SERVER"
