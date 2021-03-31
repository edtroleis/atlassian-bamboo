resource "azurerm_storage_share" "storage-share" {
  name                 = var.file_share_name
  storage_account_name = azurerm_storage_account.storage-account.name
  quota                = 5

  acl {
    id = "MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTI"

    access_policy {
      permissions = "rwdl"
      start       = "2020-08-22T09:38:21.0000000Z"
      expiry      = "2029-12-31T10:38:21.0000000Z"
    }
  }
}