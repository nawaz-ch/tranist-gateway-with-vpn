module "ec2_instance_private" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "private_ec2_on_prem"

  region=var.aws_region

  instance_type = "t2.micro"
  create_security_group=false
  vpc_security_group_ids=[aws_security_group.allow_ssh_for_on_prem_ec2.id]
 ami="ami-098e39bafa7e7303d"
  monitoring    = true
  subnet_id     = aws_subnet.on_prem_private.id

}

module "ec2_instance_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "bastion_host"

  region=var.aws_region

  instance_type = "t2.micro"
  create_security_group=false
  vpc_security_group_ids=[aws_security_group.allow_ssh.id]
 ami="ami-098e39bafa7e7303d"
 associate_public_ip_address=true
  key_name      = aws_key_pair.bastion.key_name
  
  monitoring    = true
  subnet_id     = aws_subnet.on_prem_public.id

}


module "ec2_instance_public_2" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "bastion_host_2"

  region=var.aws_region

  instance_type = "t2.micro"
  create_security_group=false
  vpc_security_group_ids=[aws_security_group.allow_ssh_2.id]
 ami="ami-098e39bafa7e7303d"
 associate_public_ip_address=true
  key_name      = aws_key_pair.bastion.key_name
  
  monitoring    = true
  subnet_id     = aws_subnet.public_subnet_2.id

}

module "ec2_instance_private_2" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "private_ec2_2"

  region=var.aws_region

  instance_type = "t2.micro"
  create_security_group=false
  vpc_security_group_ids=[aws_security_group.ping_private_ec2_2.id]
 ami="ami-098e39bafa7e7303d"
  monitoring    = true
  subnet_id     = aws_subnet.private_subnet_2.id

}

module "ec2_instance_private_3" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "private_ec2_3"

  region=var.aws_region


  instance_type = "t2.micro"
  create_security_group=false
  vpc_security_group_ids=[aws_security_group.ping_private_ec2_3.id]
 ami="ami-098e39bafa7e7303d"
  monitoring    = true
  subnet_id     = aws_subnet.private_subnet_3.id

}

