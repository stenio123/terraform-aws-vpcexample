variable "cidr_block" {
  description = "The address space that is used by the vpc."
  # default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "The cidr block to use for the subnet."
  # default     = ["10.0.1.0/24"]
}

variable "tags" {
  type = "map"

  default = {
    Owner = "Stenio Ferreira"
    TTL = "48"
    Environment = "dev"
  }
}