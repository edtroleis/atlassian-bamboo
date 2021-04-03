resource "azurerm_log_analytics_workspace" "log-analytics-workspace" {
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  name                = "${var.log_analytics_workspace_name}-${random_id.randon-id.dec}"
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.retention_in_days

  lifecycle {
    prevent_destroy = false
  }
}

resource "random_id" "randon-id" {
  byte_length = 8
}

# resource "azurerm_log_analytics_workspace" "log-analytics-workspace" {
#   # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
#   name                = "${var.log_analytics_workspace_name}-${random_id.log_analytics_workspace_name_suffix.dec}"
#   location            = var.log_analytics_workspace_location
#   resource_group_name = azurerm_resource_group.rg-aks.name
#   sku                 = var.log_analytics_workspace_sku
#   retention_in_days   = 30
# }

# resource "azurerm_log_analytics_solution" "log-analytics-solution" {
#   solution_name         = "ContainerInsights"
#   location              = azurerm_log_analytics_workspace.log-analytics-workspace.location
#   resource_group_name   = azurerm_resource_group.rg-aks.name
#   workspace_resource_id = azurerm_log_analytics_workspace.log-analytics-workspace.id
#   workspace_name        = azurerm_log_analytics_workspace.log-analytics-workspace.name

#   plan {
#     publisher = "Microsoft"
#     product   = "OMSGallery/ContainerInsights"
#   }
# }
