resource "tls_private_key" "bastion" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# 2. Create AWS Key Pair using the public key
resource "aws_key_pair" "bastion" {
  key_name   = "my-ec2-key"
  public_key = tls_private_key.bastion.public_key_openssh  # 👈 only public key goes to AWS
}

# 3. Save private key as .pem file locally
resource "local_file" "private_key" {
  content         = tls_private_key.bastion.private_key_pem
  filename        = "${path.module}/my-ec2-key.pem"
  file_permission = "0400"   # 👈 chmod 400, required for SSH
}