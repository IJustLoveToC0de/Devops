terraform {
  required_version = ">= 1.5.0"

  backend "azurerm" {
    resource_group_name  = "tf-backend"
    storage_account_name = "tfbackenddevops2137"
    container_name       = "tfstate"
    key                  = "devops.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}
