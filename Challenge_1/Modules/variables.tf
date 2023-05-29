
## Common Varaibles
variable "location"{
    type = string
    default = ""
}

variable "resource_group_name"{
    type = string
    default = ""
}

## Network Varaibles

variable "vnet_name"{
    type = string
    default = ""
}

variable "vnet_address_space"{
    type = string
    default = ""
}

variable "frontend_subnet_name"{
    type = string
    default = ""
}

variable "frontend_subnet_address_space"{
    type = string
    default = ""
}

variable "middleware_subnet_name"{
    type = string
    default = ""
}

variable "middleware_subnet_address_space"{
    type = string
    default = ""
}

variable "backend_subnet_name"{
    type = string
    default = ""
}

variable "backend_subnet_address_space"{
    type = string
    default = ""
}

variable "nsgname"{
    type = string
    default = ""
}

variable "destination_address_prefix"{
    type = string
    default = ""
}

variable "nsg_subnet_id"{
    type = string
    default = ""
}

variable "nsg_id"{
    type = string
    default = ""
}

## VM Varaibles
variable "subnet_id" {
    type = string
    default = ""
}

variable "vm_size" {
    type = string
    default = ""
}

variable "vm_name" {
    type = string
    default = ""
}

variable "prefix" {
    type = string
    default = ""
}

variable "avset_name" {
    type = string
    default = ""
}