resource "aws_eip" "bastion" {
  instance = module.ec2_instance_public.id
  domain   = "vpc"
}


