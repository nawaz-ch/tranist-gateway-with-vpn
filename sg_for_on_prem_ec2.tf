resource "aws_security_group" "allow_ssh_for_on_prem_ec2" {
  name        = "allow_ssh_for_private_ec2"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.on-prem.id

 
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4_for_private" {
  security_group_id = aws_security_group.allow_ssh_for_on_prem_ec2.id
  cidr_ipv4         = "192.168.0.0/24"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_icmp" {
  security_group_id = aws_security_group.allow_ssh_for_on_prem_ec2.id
  cidr_ipv4         = "192.168.0.0/24"  
  ip_protocol       = "icmp"
  from_port         = -1
  to_port           = -1
}



resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_ssh_for_on_prem_ec2.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
