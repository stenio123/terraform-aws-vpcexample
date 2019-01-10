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