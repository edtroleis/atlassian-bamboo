#!/bin/bash
logmsg() {
  echo
  echo '##########################################'
  echo "####  ${1}"
  echo '##########################################'
}

# Variables
aks_name="aks"
aks_resource_group="rg-aks"
export acr_name="edtroleisacr.azurecr.io"

export image_name="microsoft/azure-vote-front"
export image_tag="v1"

export image_name2="microsoft/redis"
export image_tag2="6.0.8"

# Connection using service principal
publish_sp=$PUBLISH_SP
publish_sp_secret_id=$PUBLISH_SP_SECRET_ID
tenant_id=$TENANT_ID

logmsg 'Loging in azure subscription...'
az login --service-principal -u $publish_sp -p $publish_sp_secret_id --tenant $tenant_id

logmsg 'Importing image on acr...'
# with docker client installed -> az acr login --name $acr_name
az acr import \
  --name $acr_name \
  --source mcr.microsoft.com/azuredocs/azure-vote-front:$image_tag \
  --image $image_name:$image_tag

az acr import \
  --name $acr_name \
  --source mcr.microsoft.com/oss/bitnami/redis:$image_tag2 \
  --image $image_name2:$image_tag2

# Deploy app on aks"
logmsg 'Connection on aks...'
az aks get-credentials -n $aks_name -g $aks_resource_group --admin --overwrite-existing

if [ -f deployment.yaml ]; then
  logmsg 'Showing changes...'

  # The `echo` command  force to do not fail if object does not exist yet
  # or local state it's different than remote server
  cat deployment.yaml | kubectl diff -f -
  echo

  logmsg 'Updating items on the cluster...'
  kubectl apply -f deployment.yaml
  envsubst <deployment.yaml | kubectl apply -f -

  # Restart deployment with zero downtime
  # kubectl rollout restart deployment deployment-name -n namespace

  sleep 10
  logmsg 'Public IP to access app...'
  printf "$(kubectl describe service azure-vote-front | grep "LoadBalancer Ingress")\n"
fi