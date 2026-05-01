resource "aws_vpn_connection" "vpn" {
  customer_gateway_id = aws_customer_gateway.cgw.id
  transit_gateway_id  = aws_ec2_transit_gateway.main_tgw.id
  type                = "ipsec.1"

  static_routes_only = true
}


