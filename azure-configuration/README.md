# Configure service principal

## Create service principal
```
az ad sp create-for-rbac --name="<SP_ID>" --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"

Store the information bellow

{
  "appId": "<CLIENT_ID>",
  "displayName": "<SP_ID>",
  "name": "http://service-principal-name",
  "password": "<CLIENT_SECRET_VALUE>",
  "tenant": "<TENANT_ID>"
}
```

## Test connection
```
az login --service-principal -u <CLIENT_ID> -p <CLIENT_SECRET_VALUE> --tenant <TENANT_ID>
```
