resource "aws_security_group" "allow_ssh_2" {
  name        = "allow_ssh_for_bastion"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.vpc_2.id

 
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_2" {
  security_group_id = aws_security_group.allow_ssh_2.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_public_2" {
  security_group_id = aws_security_group.allow_ssh_2.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}