# Create a Volume in Azure NetApp Files
This Terraform script is an example how to create an ANF Volume.
It includes the following components:
- Azure Resource Group
- Azure Vnet
- Subnet
- ANF Account
- ANF Pool
- ANF Volume

Respective variables are declared in *variables.tf*.
You have to create a *terraform.tfvars* file and assign a value to the variables which fits to your needs.
The *terraform.tfvars* is excluded from this repository. The structure of this file is shown in the following:

```#tfvars
# Rename to values which fit to your requirements

#Resource group vars
rg_name=<resorce group name>
location=<desired location>
rg_tags={"owner":"owner e-mail address",
  builder: "Terraform",
  environment:"environment tag"
}

#vnet vars
vnet_name=<vnet name>
vnet_address_space = example: ["10.0.0.0/16"]
vnet_tags = {owner:<owner tag>,
   builder:"Terraform",
   environment:<environment tag>
}

#subnet vars
subnet_name = <subnet name>
address_prefixes = example: ["10.0.1.0/24"]
delegation="delegation"
service_delegation = example "Microsoft.Netapp/volumes" #for details see docu

#ANF account name
anf-account-name = <ANF account name>
anf-account-tags = {environment:"account tag"}

#ANF pool
anf-pool-name = <pool name>
service-level = <desired service level> #--> see documentation"
pool-size = <pool size> # --> see docu for min pool size

#ANF volume
anf-volume-name = <volume name>
volume-path = <volume path>
protocols = example ["NFSv3"]
security-style = example "Unix"
storage-quota-gb = <volume quota in GB>
```




