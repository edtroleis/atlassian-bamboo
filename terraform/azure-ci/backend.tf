terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform"
    storage_account_name = "edtroleistffiles"
    container_name       = "tfstate-files-0"
    key                  = "/tu/acibamboo/acibamboo.terraform.tfstate"
  }
}
