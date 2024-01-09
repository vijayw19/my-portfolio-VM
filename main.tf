

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
    depends_on = [ module.amvi-resource-group ]
  source               = "github.com/AmviTFModules/terraform-azurerm-amvi-vmlinux.git?ref=v1.0.3"
  #resource_group_name  = module.amvi-resource-group.azure_resource_groups["dev"].name
  resource_group_name  = "amvi-dev-VM-rg"
  vm_names             = ["amvi-LinuxVM-dev"]
  environment          = "dev"
  virtual_network_name = "amvi-dev-vnet"
  subnet_name          = "amvi-dev-subnet"
  location             = "East US"
  username             = "adminuser"
}
