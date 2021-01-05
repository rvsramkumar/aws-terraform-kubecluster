resource "aws_vpc" "kubernetes" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name                               = "kubernetes"
    "kubernetes.io/cluster/kubernetes" = "owned"
  }
}

resource "aws_subnet" "kubernetes-public-1" {
  vpc_id                  = aws_vpc.kubernetes.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-2a"

  tags = {
    Name                               = "kubernetes-public-1"
    "kubernetes.io/cluster/kubernetes" = "owned"
  }
}

resource "aws_subnet" "kubernetes-public-2" {
  vpc_id                  = aws_vpc.kubernetes.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-2b"

  tags = {
    Name                               = "kubernetes-public-2"
    "kubernetes.io/cluster/kubernetes" = "owned"
  }
}

resource "aws_subnet" "kubernetes-public-3" {
  vpc_id                  = aws_vpc.kubernetes.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-2c"

  tags = {
    Name                               = "kubernetes-public-3"
    "kubernetes.io/cluster/kubernetes" = "owned"
  }
}

resource "aws_subnet" "kubernetes-private-1" {
  vpc_id                  = aws_vpc.kubernetes.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-2a"

  tags = {
    Name                               = "kubernetes-private-1"
    "kubernetes.io/cluster/kubernetes" = "owned"
  }
}

resource "aws_subnet" "kubernetes-private-2" {
  vpc_id                  = aws_vpc.kubernetes.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-2b"

  tags = {
    Name                               = "kubernetes-private-2"
    "kubernetes.io/cluster/kubernetes" = "owned"
  }
}

resource "aws_subnet" "kubernetes-private-3" {
  vpc_id                  = aws_vpc.kubernetes.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-2c"

  tags = {
    Name                               = "kubernetes-private-3"
    "kubernetes.io/cluster/kubernetes" = "owned"
  }
}


resource "aws_internet_gateway" "kubernetes-gw" {
  vpc_id = aws_vpc.kubernetes.id

  tags = {
    Name                               = "kubernetes"
    "kubernetes.io/cluster/kubernetes" = "owned"
  }
}


resource "aws_route_table" "kubernetes-public" {
  vpc_id = aws_vpc.kubernetes.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kubernetes-gw.id
  }

  tags = {
    Name                               = "kubernetes-public-1"
    "kubernetes.io/cluster/kubernetes" = "owned"
  }
}


resource "aws_route_table_association" "kubernetes-public-1-a" {
  subnet_id      = aws_subnet.kubernetes-public-1.id
  route_table_id = aws_route_table.kubernetes-public.id
}

resource "aws_route_table_association" "kubernetes-public-2-a" {
  subnet_id      = aws_subnet.kubernetes-public-2.id
  route_table_id = aws_route_table.kubernetes-public.id
}

resource "aws_route_table_association" "kubernetes-public-3-a" {
  subnet_id      = aws_subnet.kubernetes-public-3.id
  route_table_id = aws_route_table.kubernetes-public.id
}
