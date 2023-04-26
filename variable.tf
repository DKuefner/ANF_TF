#Variables are declared here hand have to be set to the respective values in .tfvars

#Resource group vars
variable "rg_name" {
}
variable "location" {
}
variable "rg_tags" {
    type = map
}

#virtual network
variable "vnet_name" {}
variable "vnet_address_space" {
    type = list(string)
    }
variable "vnet_tags" {
    type = map
}

#subnets
variable "subnet_name" {}
variable "address_prefixes" {
    type = list(string)
    }
variable "delegation" {
        }
variable "service_delegation" {
        }



