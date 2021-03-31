resource "azurerm_storage_container" "storage-container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage-account.name
  container_access_type = "blob"
}
