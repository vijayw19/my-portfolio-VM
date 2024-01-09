terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  cloud {
    organization = "amviorg"

    workspaces {
      name = "dev-workspace"
    }
  }
}

provider "azurerm" {
  features {}
}