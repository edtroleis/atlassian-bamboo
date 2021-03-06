output "resource-group" {
  value = azurerm_resource_group.resource-group.name
}

output "storage-account-name" {
  value = azurerm_storage_account.storage-account.name
}

output "storage-container" {
  value = azurerm_storage_container.storage-container.name
}

