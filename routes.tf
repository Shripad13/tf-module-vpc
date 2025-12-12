resource "aws_route" "default-vpc" {
  route_table_id            = var.default_vpc_rt
  destination_cidr_block    = var.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main.id
}


# Creates lb route table 

resource "aws_route_table" "lb" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block                = var.default_vpc_cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.main.id
  }



  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = local.lb_rt_tags

}


# Creates lb rt association to lb subnets
resource "aws_route_table_association" "lb" {
  count          = length(aws_subnet.lb.*.id)
  subnet_id      = aws_subnet.lb.*.id[count.index]
  route_table_id = aws_route_table.lb.id
}

# Creates eks route table 
resource "aws_route_table" "eks" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  route {
    cidr_block                = var.default_vpc_cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.main.id
  }

  tags = local.eks_rt_tags

}

# Creates eks rt association to eks subnets
resource "aws_route_table_association" "eks" {
  count          = length(aws_subnet.eks.*.id)
  subnet_id      = aws_subnet.eks.*.id[count.index]
  route_table_id = aws_route_table.eks.id
}


# Creates db route table 
resource "aws_route_table" "db" {
  vpc_id = aws_vpc.example.id


  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  route {
    cidr_block                = var.default_vpc_cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.main.id
  }

  tags = local.db_rt_tags

}

# Creates db rt association to db subnets
resource "aws_route_table_association" "db" {
  count          = length(aws_subnet.db.*.id)
  subnet_id      = aws_subnet.db.*.id[count.index]
  route_table_id = aws_route_table.db.id
}