# define variables
variable "location" {
  type    = string
  default = "eastus"
}

variable "resource_group_name" {
  type = string
  default = "amvi-dev-VM-rg"
}

variable "vm_names" {
  type = list(string)
  default = [ "amvi-LinuxVM-dev" ]
}

variable "vm_size" {
  type    = string
  default = "Standard_DS2_v2"
}