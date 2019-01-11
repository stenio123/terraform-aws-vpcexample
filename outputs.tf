output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "vpc_arn" {
  value = "${aws_vpc.main.arn}"
}

output "main_route_table_id" {
  value = "${aws_vpc.main.main_route_table_id}"
}

output "vpc_cidr_block" {
  value = "${aws_vpc.main.cidr_block}"
}

output "subnet_id.*" {
  value = "${aws_subnet.subnet.*.id}"
}

output "subnet_arn.*" {
  value = "${aws_subnet.subnet.*.arn}"
}