#tfvars
# Rename to Values which fit for your requirements

#Resource group vars
rg_name="dk-anf-rg"
location="westeurope"
rg_tags={"owner":"dieter.kuefner@atos.net",
  builder: "Terraform",
  environment:"ANF-Test"
}

#vnet vars
vnet_name="dk_anf_vnet"
vnet_address_space = ["10.0.0.0/16"]
vnet_tags = {owner:"dieter.kuefner@atos.net",
   builder:"Terraform",
   environment:"ANF-Test"
}

#subnet vars
subnet_name = "dk-anf-subnet1"
address_prefixes = ["10.0.1.0/24"]
delegation="delegation"
service_delegation = "Microsoft.Netapp/volumes"

