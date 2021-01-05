resource "aws_eip" "kubernetes-nat" {
  vpc = true
  tags = {
    "kubernetes.io/cluster/kubernetes" = "owned"
  }
}

resource "aws_nat_gateway" "kubernetes-nat-gw" {
  allocation_id = aws_eip.kubernetes-nat.id
  subnet_id     = aws_subnet.kubernetes-public-1.id
  depends_on    = [aws_internet_gateway.kubernetes-gw]
  tags = {
    "kubernetes.io/cluster/kubernetes" = "owned"
  }
}

resource "aws_route_table" "kubernetes-private" {
  vpc_id = aws_vpc.kubernetes.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.kubernetes-nat-gw.id
  }

  tags = {
    Name                               = "kubernetes-private-1"
    "kubernetes.io/cluster/kubernetes" = "owned"
  }
}

resource "aws_route_table_association" "kubernetes-private-1-a" {
  subnet_id      = aws_subnet.kubernetes-private-1.id
  route_table_id = aws_route_table.kubernetes-private.id
}

resource "aws_route_table_association" "kubernetes-private-2-a" {
  subnet_id      = aws_subnet.kubernetes-private-2.id
  route_table_id = aws_route_table.kubernetes-private.id
}

resource "aws_route_table_association" "kubernetes-private-3-a" {
  subnet_id      = aws_subnet.kubernetes-private-3.id
  route_table_id = aws_route_table.kubernetes-private.id
}

