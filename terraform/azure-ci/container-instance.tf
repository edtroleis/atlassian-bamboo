resource "azurerm_container_group" "container-group" {
  name                = var.container_group_name
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  ip_address_type     = "public"
  dns_name_label      = "aci-label"
  os_type             = "Linux"
  restart_policy      = "Never" #Always, Never, OnFailure
  diagnostics {
    log_analytics {
      log_type      = "ContainerInsights"
      workspace_id  = azurerm_log_analytics_workspace.log-analytics-workspace.workspace_id
      workspace_key = azurerm_log_analytics_workspace.log-analytics-workspace.primary_shared_key
    }
  }
  container {
    name   = "hello-world"
    image  = "microsoft/aci-helloworld:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 443
      protocol = "TCP"
    }
  }

  container {
    name     = var.container_name
    image    = var.image_name
    cpu      = var.cpu
    memory   = var.memory
    commands = ["./runAgent.sh", var.bamboo_server_url]
    environment_variables = {
      SECURITY_TOKEN = var.bamboo_server_security_token
    }

    # ports {
    #   port     = 443
    #   protocol = "TCP"
    # }
    ports {
      port     = 54663
      protocol = "TCP"
    }

    #   volume {
    #     name                 = var.volume_name
    #     read_only            = false
    #     mount_path           = "<mount_path>"
    #     storage_account_name = data.azurerm_storage_account.storage-account.name
    #     share_name           = var.file_share_name
    #     storage_account_key  = data.azurerm_storage_account.storage-account.primary_access_key
    #   }
  }
  identity {
    type = "SystemAssigned"
  }

  # image_registry_credential {
  #   server   = "servername.azurecr.io"
  #   username = "acrusername"
  #   password = "acrpassword"
  # }

  lifecycle {
    prevent_destroy = false
  }

  tags = local.tags_any
}
