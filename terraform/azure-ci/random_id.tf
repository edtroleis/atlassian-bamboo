# resource "random_id" "randomId" {
#   keepers = {
#     # Generate a new ID only when a new resource group is defined
#     resource_group = var.resource_group_name
#   }
#   byte_length = 8
# }

# resource "azurerm_storage_account" "stgacc" {
#   name                     = "diag${random_id.randomId.hex}"
#   resource_group_name      = var.resource_group_name
#   location                 = var.region
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

#   tags = {
#     environment = var.environment
#   }

#   depends_on = [null_resource.dependency_getter]
# }
