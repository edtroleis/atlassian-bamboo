data "azurerm_container_registry" "container-registry" {
  name                = var.acr_name
  resource_group_name = var.acr_resource_group_name
}

resource "azurerm_container_group" "container-group" {
  count               = var.bamboo_agent_number
  name                = "${var.container_group_name}-${count.index}"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  ip_address_type     = var.ip_address_type
  network_profile_id  = azurerm_network_profile.network-profile.id
  # dns_name_label      = "${var.dns_name_label}-${count.index}"
  os_type        = var.os_type
  restart_policy = var.restart_policy
  diagnostics {
    log_analytics {
      log_type      = "ContainerInsights"
      workspace_id  = azurerm_log_analytics_workspace.log-analytics-workspace.workspace_id
      workspace_key = azurerm_log_analytics_workspace.log-analytics-workspace.primary_shared_key
    }
  }

  image_registry_credential {
    server   = data.azurerm_container_registry.container-registry.login_server
    username = data.azurerm_container_registry.container-registry.admin_username
    password = data.azurerm_container_registry.container-registry.admin_password
  }

  # container {
  #   name   = "hello-world"
  #   image  = "microsoft/aci-helloworld:latest"
  #   cpu    = "0.5"
  #   memory = "1.5"
  # }

  container {
    name     = var.container_name
    image    = "${data.azurerm_container_registry.container-registry.login_server}/${var.image_name}"
    cpu      = var.cpu
    memory   = var.memory
    commands = ["./runAgent.sh", var.bamboo_server_url]
    environment_variables = {
      SECURITY_TOKEN = var.bamboo_server_security_token
    }

    ports {
      port     = 443
      protocol = "TCP"
    }
    ports {
      port     = 54663
      protocol = "TCP"
    }

      volume {
        name                 = var.volume_name
        read_only            = var.volume_read_only
        mount_path           = var.volume_mount_path
        storage_account_name = azurerm_storage_account.storage-account.name
        share_name           = "${var.file_share_name}-${count.index}"
        storage_account_key  = azurerm_storage_account.storage-account.primary_access_key
      }

    # volume {
    #   name                 = "logs"
    #   mount_path           = "/aci/logs"
    #   read_only            = false
    #   storage_account_name = azurerm_storage_account.storage-account.name
    #   share_name           = "${var.file_share_name}-${count.index}"
    #   storage_account_key  = azurerm_storage_account.storage-account.primary_access_key
    # }
  }


  # identity {
  #   type = "SystemAssigned"
  # }

  lifecycle {
    prevent_destroy = false
  }

  tags = local.tags_any
}





# resource "azurerm_container_group" "hybrid-listener" {
#   name                = "aci-listener"
#   location            = local.location
#   resource_group_name = azurerm_resource_group.t_relay.name
#   ip_address_type     = "private"
#   network_profile_id  = azurerm_network_profile.acr_profile.id
#   os_type             = "Linux"

#   image_registry_credential {
#     server   = data.azurerm_container_registry.contoso.login_server
#     username = data.azurerm_container_registry.contoso.admin_username
#     password = data.azurerm_container_registry.contoso.admin_password
#   }
#                                                   1                                             2
#   container {
#     name   = "azbridge"
#     image  = "${data.azurerm_container_registry.contoso.login_server}/azbridge:latest"
#     cpu    = "0.5"
#     memory = "1.5"
#   }
# }
