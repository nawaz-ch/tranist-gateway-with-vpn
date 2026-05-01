resource "aws_security_group" "ping_private_ec2_2" {
  name        = "ping_private_ec2_2"
  description = "ping ec2 in private subnet"
  vpc_id      = aws_vpc.vpc_2.id

 
}


resource "aws_vpc_security_group_ingress_rule" "allow_icmp_from_on_prem" {
  security_group_id = aws_security_group.ping_private_ec2_2.id
  cidr_ipv4         = "192.168.0.0/16"   # region 2 VPC CIDR
  ip_protocol       = "icmp"
  from_port         = -1
  to_port           = -1
}


resource "aws_vpc_security_group_ingress_rule" "allow_icmp_from_vpc_c" {
  security_group_id = aws_security_group.ping_private_ec2_2.id
  cidr_ipv4         = "10.1.0.0/16"   # region 2 VPC CIDR
  ip_protocol       = "icmp"
  from_port         = -1
  to_port           = -1
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_for_ec2_2" {
  security_group_id = aws_security_group.ping_private_ec2_2.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
