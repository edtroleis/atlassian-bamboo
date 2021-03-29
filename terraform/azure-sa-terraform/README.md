# Azure storage account for Terraform backend
Each Terraform configuration can specify a backend, which defines where and how operations are performed, where state snapshots are stored, etc.
When using full remote operations, operations like terraform plan or terraform apply can be executed in Terraform Cloud's run environment, with log output streaming to the local terminal. Remote plans and applies use variable values from the associated Terraform Cloud workspace.

[Terraform Backends](https://www.terraform.io/docs/language/settings/backends/index.html)

# Terraform authenticating to Azure using a Service Principal and a Client Secret
https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html


## Create Service Principal
```
az ad sp create-for-rbac --name="<SERVICE_PRINCIPAL_NAME>" --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"

Save the configuration bellow to export the Linux environmento variables
---
{
  "appId": "<CLIENT_ID>",
  "displayName": "<SERVICE_PRINCIPAL_NAME>",
  "name": "http://publish_acr",
  "password": "<CLIENT_SECRET_VALUE>",
  "tenant": "<TENANT_ID>"
}
---
```

## Test login with service principal
```
az login --service-principal -u <CLIENT_ID> -p <CLIENT_SECRET_VALUE> --tenant <TENANT_ID>
```

```
export ARM_CLIENT_ID="<CLIENT_ID>"
export ARM_CLIENT_SECRET="<CLIENT_SECRET_VALUE>"
export ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"
export ARM_TENANT_ID="<TENANT_ID>"

```

## Executing Terraform
```
*** Inside the project directory
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
terraform destroy -auto-approve
```

## Configure git repo
```
git init
git add .
git commit -m "message"
git remote add origin "remote-path"
git push origin master

vim .gitignore
.terraform
*.tfstate
*.tfstate.backup
*.pub
*.log
```