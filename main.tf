terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.46.0"
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

# Getting the resource group from the module

module "amvi-resource-group" {
  source = "github.com/AmviTFModules/amvi-resource-group"
  
  azure_resource_groups = {
    dev = {
      name     = "amvi-dev-VM-rg"
      location = "East US"
      tags = {
        env = "dev"
      }
    }
}
  
}

# Getting the virtual network from the module

module "terraform-azurerm-amvi-vmlinux" {
  source = "github.com/AmviTFModules/terraform-azure-linux-vm"
  resource_group_name = module.amvi-resource-group.azure_resource_groups["dev"].name
  vm_name             = "amvi-LinuxVM-dev"
  location            = "East US"
  vm_size             = "Standard_DS2_v2"
  admin_username      = "adminuser"
  admin_password      = "SuperSecretPassword123!"
}
