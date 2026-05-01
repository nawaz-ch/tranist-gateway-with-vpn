resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_vpc_2" {
  subnet_ids         = [aws_subnet.private_subnet_2.id]
  transit_gateway_id = aws_ec2_transit_gateway.main_tgw.id
  vpc_id             = aws_vpc.vpc_2.id
}



resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_vpc_3" {
  subnet_ids         = [aws_subnet.private_subnet_3.id]
  transit_gateway_id = aws_ec2_transit_gateway.main_tgw.id
  vpc_id             = aws_vpc.vpc_3.id
}


resource "aws_ec2_transit_gateway_route_table" "tgw_rt_2" {
  transit_gateway_id = aws_ec2_transit_gateway.main_tgw.id
}


resource "aws_ec2_transit_gateway_route_table_association" "tgw_rta_2" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_vpc_2.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_2.id
}

resource "aws_ec2_transit_gateway_route" "onprem_in_rt2" {
  destination_cidr_block         = "192.168.0.0/16"  # your on-prem CIDR
  transit_gateway_attachment_id  = aws_vpn_connection.vpn.transit_gateway_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_2.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "vpc_b_prop" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_vpc_3.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_2.id
}


resource "aws_ec2_transit_gateway_route_table_propagation" "vpn_to_vpc_b_prop" {
  transit_gateway_attachment_id  = aws_vpn_connection.vpn.transit_gateway_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_2.id
}

resource "aws_ec2_transit_gateway_route_table" "tgw_rt_3" {
  transit_gateway_id = aws_ec2_transit_gateway.main_tgw.id
}



resource "aws_ec2_transit_gateway_route_table_association" "tgw_rta_3" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_vpc_3.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_3.id
}

resource "aws_ec2_transit_gateway_route" "onprem_in_rt3" {
  destination_cidr_block         = "192.168.0.0/16"  # your on-prem CIDR
  transit_gateway_attachment_id  = aws_vpn_connection.vpn.transit_gateway_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_3.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "vpc_c_prop" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_vpc_2.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_3.id
}








resource "aws_ec2_transit_gateway_route_table" "vpn_rt" {
  transit_gateway_id = aws_ec2_transit_gateway.main_tgw.id
}


resource "aws_ec2_transit_gateway_route_table_association" "vpn_assoc" {
  transit_gateway_attachment_id  = aws_vpn_connection.vpn.transit_gateway_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.vpn_rt.id
}



resource "aws_ec2_transit_gateway_route_table_propagation" "vpc_b_prop_to_vpn" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_vpc_2.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.vpn_rt.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "vpc_c_prop_to_vpn" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_vpc_3.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.vpn_rt.id
}






