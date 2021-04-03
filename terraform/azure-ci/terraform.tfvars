# Resource group
location      = "brazilsouth"
resource_name = "rg-aci"

# Storage account properties
storage_account_name     = "edtroleissabamboo"
account_tier             = "Standard"
account_replication_type = "LRS"
access_tier              = "Hot"
account_kind             = "StorageV2"
allow_blob_public_access = "true"
file_share_name          = "bamboo-agents-volume"

# Container group
container_group_name         = "acibamboo"
container_name               = "bamboo-agent"
image_name                   = "atlassian/bamboo-agent-base:latest"
cpu                          = "1"
memory                       = "1.5"
bamboo_server_security_token = ""
volume_name                  = "bamboo-agents-volume"
bamboo_server_url            = "http://bambooServerUrl:8085"

# Log analytics
log_analytics_workspace_name     = "logAnalyticsWorkspaceAci"
log_analytics_workspace_sku      = "PerGB2018"
retention_in_days = 30

# Tags
environment = "" # Subscription where the resource will be deployed
iac         = "" # Define if the infrastructure was created with code and which one {terraform/arm/az-cli}
objective   = "" # System objective which resource was built for
owner       = "" # Responsible team for the system/resource 
system      = "" # System