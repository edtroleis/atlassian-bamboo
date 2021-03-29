# Resource group
location      = "Brasil South"
resource_name = "<resource_name>"

# Storage account properties
storage_account_name     = "<name>tffiles"
account_tier             = "Standard"
account_replication_type = "LRS"
access_tier              = "Hot"
account_kind             = "StorageV2"
allow_blob_public_access = "true"

# Tags
environment = "" # Subscription where the resource will be deployed
iac         = "" # Define if the infrastructure was created with code and which one {terraform/arm/az-cli}
objective   = "" # System objective which resource was built for
owner       = "" # Responsible team for the system/resource 
system      = "" # System
