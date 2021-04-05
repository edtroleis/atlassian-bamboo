output "resource-group" {
  value = azurerm_resource_group.resource-group.name
}
output "storage-account-name" {
  value = azurerm_storage_account.storage-account.name
}

output "file-share-name" {
  value = azurerm_storage_share.storage-share.name
}

output "container-group-fqdn" {
  value = azurerm_container_group.container-group.*.fqdn
}
