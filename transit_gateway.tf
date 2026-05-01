resource "aws_ec2_transit_gateway" "main_tgw" {
  description = "main-tgw"
  default_route_table_association="disable"
}

