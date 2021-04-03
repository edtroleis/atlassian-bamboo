# resource "azurerm_virtual_network" "virtual-network" {
#   name                = "virtual-network-example"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.resource-group.location
#   resource_group_name = azurerm_resource_group.resource-group.name
# }

# resource "azurerm_subnet" "subnet" {
#   name                 = "subnet-example"
#   resource_group_name  = azurerm_resource_group.resource-group.name
#   virtual_network_name = azurerm_virtual_network.virtual-network.name
#   address_prefixes     = ["10.0.2.0/24"]
#   service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
# }