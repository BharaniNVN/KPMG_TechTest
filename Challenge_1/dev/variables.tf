variable "location"{
    type = string
    default = "eastus"
}

variable "resource_group_name"{
    type = string
    default = "demorg"
}

variable "vnet_name"{
    type = string
    default = "demovnet"
}

variable "vnet_address_space"{
    type = string
    default = "10.0.0.0/16"
}

variable "frontend_subnet_name"{
    type = string
    default = "frontend"
}

variable "frontend_subnet_address_space"{
    type = string
    default = "10.0.1.0/24"
}

variable "middleware_subnet_name"{
    type = string
    default = "middleware"
}

variable "middleware_subnet_address_space"{
    type = string
    default = "10.0.2.0/24"
}

variable "backend_subnet_name"{
    type = string
    default = "backend"
}

variable "backend_subnet_address_space"{
    type = string
    default = "10.0.3.0/24"
}

variable "nsgname"{
    type = string
    default = "webnsg"
}

variable "destination_address_prefix"{
    type = string
    default = "10.0.1.0/24"
}

variable "nsg_subnet_id"{
    type = string
    default = ""
}

variable "nsg_id"{
    type = string
    default = ""
}

variable "username"{
    type = string
    default = ""
}

variable "password"{
    type = string
    default = ""
}


