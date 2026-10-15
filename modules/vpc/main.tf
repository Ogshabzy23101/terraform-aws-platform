resource "aws_vpc" "devop_lab_vpc" {
  cidr_block           = var.vpc_cidr
  region               = var.region
  enable_dns_hostnames = false
  enable_dns_support   = false
  tags = {
    name = "terraTut_vpc"
  }
}
resource "aws_internet_gateway" "devop_lab_Igw" {
  vpc_id = aws_vpc.devop_lab_vpc

  tags = {
    Name = "terraTut_igw"
  }
}

resource "aws_eip" "devops_lab_eip" {
  domain = aws_vpc.devop_lab_vpc
  tags = {
    name = "terraTut_natgw_eip"
  }
}


resource "aws_nat_gateway" "devops_lab_natgw" {
  allocation_id = aws_eip.devops_lab_eip
  subnet_id     = aws_subnet.devop_lab_pub_subnet

  tags = {
    Name = "devops_lab_NATgw"
  }

  depends_on = [aws_internet_gateway.devop_lab_Igw]
}

#private networks

resource "aws_subnet" "devop_lab_pri_subnet" {
  for_each          = var.private_subnet
  vpc_id            = aws_vpc.devop_lab_vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.azs
  tags              = each.key
}

resource "aws_route_table" "devop_lab_pri_route_rt" {
  vpc_id = aws_vpc.devop_lab_vpc.id
  region = var.region
}

resource "aws_route" "pri-route" {
  route_table_id         = aws_route_table.devop_lab_pub_route_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.devops_lab_natgw
}
resource "aws_route_table_association" "devops_lab_rt_association" {
  route_table_id = aws_route_table.devop_lab_pri_route_rt
  subnet_id      = aws_subnet.devop_lab_pri_subnet
}

#public network

resource "aws_subnet" "devop_lab_pub_subnet" {
  for_each          = var.public_subnet
  vpc_id            = aws_vpc.devop_lab_vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.azs
  tags = each.key

}


resource "aws_route_table" "devop_lab_pub_route_rt" {
  vpc_id = aws_vpc.devop_lab_vpc.id
  region = var.region
}

resource "aws_route" "devops_lab_pub_route" {
  route_table_id = aws_route_table.devop_lab_pub_route_rt
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.devop_lab_Igw
}

resource "aws_route_table_association" "devops_lab_pub_rt_association" {
  route_table_id = aws_route_table.devop_lab_pub_route_rt
  subnet_id = aws_subnet.devop_lab_pub_subnet
}