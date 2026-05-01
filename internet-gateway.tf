resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.on-prem.id
}


resource "aws_internet_gateway" "igw_vpc_2" {
  vpc_id = aws_vpc.vpc_2.id
}