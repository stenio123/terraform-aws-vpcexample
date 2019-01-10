# terraform-azure-vnetexample

Simple example showing a deployment of Azure Vnet, with variables and outputs.

## Azure authentication
For complete information on the options available, check: https://www.terraform.io/docs/providers/azurerm#authenticating-to-azure

Or you can simply set the following environment variables:
```
$ export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
$ export ARM_CLIENT_SECRET="00000000-0000-0000-0000-000000000000"
$ export ARM_SUBSCRIPTION_ID="00000000-0000-0000-0000-000000000000"
$ export ARM_TENANT_ID="00000000-0000-0000-0000-000000000000"
```

## Azure Workflow Example
This repository is meant to be can be part of a larger Azure workflow example: LINK 

If you want to use it by itself, it might fail when not finding expected resource group. 
This can be fixed by update the code:

```
resource "azurerm_resource_group" "rg" {
  name     = "${var.environment}-rg"
  location = "${var.location}"
  tags     = "${var.tags}"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-vnet"
  location            = "${var.location}"
  address_space       = ["${var.address_space}"]
  resource_group_name = "${azurerm_resource_group.rg.name}"
  dns_servers         = "${var.dns_servers}"
  tags                = "${var.tags}"
}
```