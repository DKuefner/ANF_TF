# Configure Provider
  terraform {
 required_providers {
   azurerm = {
     source = "hashicorp/azurerm"
    version = "~> 3.0.2"
  }
 }
required_version = ">= 1.1.0"
}
provider "azurerm" {
 features {}
}

#Configure Resource group
resource "azurerm_resource_group" "rg" {
  name = var.rg_name
  location = var.location
  tags = var.rg_tags
    
}
# Create virtual network
resource "azurerm_virtual_network" "anf-vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = var.vnet_tags
}

# Create subnet
resource "azurerm_subnet" "anf-subnet" {
  name                 = var.subnet_name
  address_prefixes     = var.address_prefixes
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.anf-vnet.name
  delegation {
    name = var.delegation

    service_delegation {
      name    = var.service_delegation
        }
  }
}

## Create Azure NetApp Files resource
#resource "azurerm_netapp_account" "anf-account" {
#  name                = "dk-anf-account"
#  location            = azurerm_resource_group.rg.location
#  resource_group_name = azurerm_resource_group.rg.name
#  tags                = {
#    environment = "dk-anf-dev"
#  }
#}

#resource "azurerm_netapp_pool" "anf-pool" {
#  name                = "dk-anf-pool1"
#  location            = azurerm_resource_group.rg.location
#  resource_group_name = azurerm_resource_group.rg.name
#  service_level       = "Standard"
#  size_in_tb          = 4
#  account_name = azurerm_netapp_account.anf-account.name
#}

##Creat ANF Volume
#resource "azurerm_netapp_volume" "anf-volume1" {
#  lifecycle {
#    prevent_destroy = false
#  }
#
#  name                       = "dk-anf-volume1"
#  location                   = azurerm_resource_group.rg.location
#  resource_group_name        = azurerm_resource_group.rg.name
#  account_name               = azurerm_netapp_account.anf-account.name
#  pool_name                  = azurerm_netapp_pool.anf-pool.name
#  volume_path                = "dk-file-path1"
#  service_level              = "Standard"
#  subnet_id                  = azurerm_subnet.anf-subnet.id
#  protocols                  = ["NFSv3"]
#  security_style             = "Unix"
#  storage_quota_in_gb        = 100
#}


# Output ANF account ID and access endpoint
#output "anf_account_id" {
#  value = azurerm_netapp_account.anf-account.id
#}

#output "anf_account_endpoint" {
#  value = azurerm_netapp_account.anf-account.access.endpoint
#}