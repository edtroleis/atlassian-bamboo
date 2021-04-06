# Resource Group
variable "location" {
  description = "Location where the resources will be created"
  type        = string
}

variable "resource_name" {
  description = "Name of the resource group"
  type        = string
}

# Storage account properties
variable "storage_account_name" {
  description = "Name of storage account. Must be unique in Azure"
  type        = string
}

variable "account_tier" {
  description = ""
  type        = string
}

variable "account_replication_type" {
  description = "Define the redundency storage type"
  type        = string
}

variable "access_tier" {
  description = "Define if backup will be in Hot or Cold mode"
  type        = string
}

variable "account_kind" {
  description = "account_kind"
  type        = string
}

variable "allow_blob_public_access" {
  description = "allow_blob_public_access"
  type        = string
}

variable "file_share_name" {
  description = "Storage account file share name"
  type        = string
}

# ACR
variable "acr_name" {
  description = "ACR name"
  type        = string
}

variable "acr_resource_group_name" {
  description = "ACR resource group name"
  type        = string
}

variable "ip_address_type" {
  description = "ip_address_type"
  type        = string
}

variable "dns_name_label" {
  description = "dns_name_label"
  type        = string
}

variable "os_type" {
  description = ""
  type        = string
}

variable "restart_policy" {
  description = ""
  type        = string
}

# Container group
variable "bamboo_agent_number" {
  description = "Number of container group/instance"
  type        = string
}
variable "container_group_name" {
  description = "Container group/instance name"
  type        = string
}

variable "container_name" {
  description = "Container name"
  type        = string
}

variable "image_name" {
  description = "Container image name"
  type        = string
}

variable "cpu" {
  description = "Container cpu"
  type        = string
}

variable "memory" {
  description = "Container memory"
  type        = string
}

variable "bamboo_server_security_token" {
  description = "Secret token to registry on Bamboo server"
  type        = string
}

variable "volume_name" {
  description = "Volume name used by bamboo agents"
  type        = string
}

variable "bamboo_server_url" {
  description = "Bamboo server url"
  type        = string
}

variable "volume_mount_path" {
  description = "Container mount path"
  type        = string
}

variable "volume_read_only" {
  description = "Volume read only"
  type        = string
}

# Log analytics
variable "log_analytics_workspace_name" {
  description = "log_analytics_workspace_name"
  type        = string
}

variable "log_analytics_workspace_sku" {
  description = "log_analytics_workspace_sku"
  type        = string
}

variable "retention_in_days" {
  description = "retention_in_days"
  type        = number
}

# Network
variable "subnet_name" {
  description = "subnet_name"
  type        = string
}

variable "vnet_name" {
  description = "vnet_name"
  type        = string
}

variable "vnet_resource_group_name" {
  description = "vnet_resource_group_name"
  type        = string
}

variable "network_profile_name" {
  description = "network_profile_name"
  type        = string
}

variable "network_interface_name" {
  description = "network_interface_name"
  type        = string
}

variable "ip_configuration_name" {
  description = "ip_configuration_name"
  type        = string
}

# Tags
variable "environment" {
  description = "Subscription where the resource will be deployed"
  type        = string
}

variable "iac" {
  description = "Define if the infrastructure was created with code and which one {terraform/arm/az-cli}"
  type        = string
}

variable "objective" {
  description = "System objective which resource was built for"
  type        = string
}

variable "owner" {
  description = "Responsible team for the system/resource"
  type        = string
}

variable "system" {
  description = "System"
  type        = string
}
