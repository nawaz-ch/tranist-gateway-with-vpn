resource "aws_customer_gateway" "cgw" {
  bgp_asn    = 65000
  ip_address = aws_eip.bastion.public_ip
  type       = "ipsec.1"

  tags = {
    Name = "main-customer-gateway"
  }
}