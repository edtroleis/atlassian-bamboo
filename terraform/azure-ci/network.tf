resource "azurerm_virtual_network" "virtual-network" {
  name                = var.vnet_name
  address_space       = ["10.233.128.0/21"]
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.resource-group.name
  virtual_network_name = azurerm_virtual_network.virtual-network.name
  address_prefixes     = ["10.233.134.64/26"]
  # service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.AzureActiveDirectory", "Microsoft.AzureCosmosDB", "Microsoft.ContainerRegistry", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus", "Microsoft.Sql", "Microsoft.Storage", "Microsoft.Web"]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}

# data "azurerm_subnet" "subnet" {
#   name = var.subnet_name
#   virtual_network_name = var.vnet_name
#   resource_group_name = var.vnet_resource_group_name
# }

# List network profiles
# az network profile list --output table
resource "azurerm_network_profile" "network-profile" {
  name                = var.network_profile_name
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  depends_on          = [azurerm_resource_group.resource-group]

  container_network_interface {
    name = var.network_interface_name

    ip_configuration {
      name = var.ip_configuration_name
      # subnet_id = data.azurerm_subnet.subnet.id
      subnet_id = azurerm_subnet.subnet.id
    }
  }
}
