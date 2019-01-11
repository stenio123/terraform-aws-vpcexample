# Configure the AWS Provider
provider "aws" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.55.0"
}

resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_block}"
  tags       = "${var.tags}"
}

resource "aws_subnet" "subnet" {
  count      = "${length(var.subnet_cidr)}"
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.subnet_cidr[count.index]}"

  tags = "${var.tags}"
}
