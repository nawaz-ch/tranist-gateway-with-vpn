resource "aws_subnet" "on_prem_public" {
  vpc_id     = aws_vpc.on-prem.id
  cidr_block = "192.168.0.0/24"
  tags={
    Name="on-prem-public"
  }
}


resource "aws_route_table" "public_subnet" {
  vpc_id = aws_vpc.on-prem.id
}

resource "aws_route" "public_subnet" {
  route_table_id         = aws_route_table.public_subnet.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.on_prem_public.id
  route_table_id = aws_route_table.public_subnet.id
}



resource "aws_subnet" "on_prem_private" {
  vpc_id     = aws_vpc.on-prem.id
  cidr_block = "192.168.1.0/24"

   tags={
    Name="on-prem-private"
  }
}

resource "aws_route_table" "on_prem_private_subnet" {
  vpc_id = aws_vpc.on-prem.id
}


resource "aws_route_table_association" "on_prem_private_assoc" {
  subnet_id      = aws_subnet.on_prem_private.id
  route_table_id = aws_route_table.on_prem_private_subnet.id
}


resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.vpc_2.id
  cidr_block = "10.0.0.0/24"
   tags={
    Name="private-subnet-2"
  }
}



resource "aws_route_table" "private_subnet_2" {
  vpc_id = aws_vpc.vpc_2.id
}

resource "aws_route_table_association" "private_assoc_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_subnet_2.id
}



resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.vpc_2.id
  cidr_block = "10.0.1.0/24"
   tags={
    Name="public-subnet-2"
  }
}

resource "aws_route_table" "public_subnet_2" {
  vpc_id = aws_vpc.vpc_2.id
}

resource "aws_route_table_association" "public_assoc_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_subnet_2.id
}

resource "aws_route" "public_subnet_2" {
  route_table_id         = aws_route_table.public_subnet_2.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_vpc_2.id
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id     = aws_vpc.vpc_3.id
  cidr_block = "10.1.0.0/24"
   tags={
    Name="private-subnet-3"
  }
}


resource "aws_route_table" "private_subnet_3" {
  vpc_id = aws_vpc.vpc_3.id
}

resource "aws_route_table_association" "private_assoc_3" {
  subnet_id      = aws_subnet.private_subnet_3.id
  route_table_id = aws_route_table.private_subnet_3.id
}





