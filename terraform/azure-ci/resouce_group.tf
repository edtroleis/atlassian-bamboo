resource "azurerm_resource_group" "resource-group" {
  name     = var.resource_name
  location = var.location

  lifecycle {
    prevent_destroy = true
  }

  tags = local.tags_any
}
