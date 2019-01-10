variable "environment" {
  description = "Default prefix to use with your resource names."
}

variable "tfe_org" {
  description = "Name of TFE organization which has workspace containing security group to use."
}

# Assumes that each workspace tracking resource groups has a unique region
variable "sg_workspace" {
  description = "Name of TFE workspace managing deployment of security group to use."
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  default     = "10.0.0.0/16"
}

# If no values specified, this defaults to Azure DNS 
variable "dns_servers" {
  description = "The DNS servers to be used with vNet"
  default     = []
}

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  default     = ["10.0.1.0/24"]
}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  default     = ["subnet1"]
}

variable "tags" {
  type = "map"

  default = {
    Owner = "Stenio Ferreira"
    TTL = "48"
  }
}