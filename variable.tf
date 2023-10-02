# define variables
variable "location" {
  type = string
  default = "eastus"
}

variable "resource_group_name" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "vm_size" {
  type = string
  default = "Standard_DS2_v2"
}