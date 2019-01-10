# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.20.0"
}

data "terraform_remote_state" "security_group" {
  backend = "atlas"
  config {
    name = "${var.tfe_org}/${var.sg_workspace}"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.environment}-vnet"
  location            = "${data.terraform_remote_state.security_group.location}"
  address_space       = ["${var.address_space}"]
  resource_group_name = "${data.terraform_remote_state.security_group.resource_group_name}"
  dns_servers         = "${var.dns_servers}"
  tags                = "${var.tags}"
}

resource "azurerm_subnet" "subnet" {
  name                      = "${var.subnet_names[count.index]}"
  virtual_network_name      = "${azurerm_virtual_network.vnet.name}"
  resource_group_name       = "${data.terraform_remote_state.security_group.resource_group_name}"
  address_prefix            = "${var.subnet_prefixes[count.index]}"
  network_security_group_id = "${data.terraform_remote_state.security_group.security_group_id}"
  count                     = "${length(var.subnet_names)}"
}