resource "aws_vpc" "new_vpc" {
  cidr_block = var.vpc_cid
  tags = {
    Name = var.my_vpc
    Environment = var.env
  }
}

resource "aws_subnet" "public1" {
  vpc_id = aws_vpc.new_vpc.id
  cidr_block = var.pub_sub_cid1
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = var.map_public_ip_on_launch
    tags = {
    Name = "my_pb_sbt1"
    Environment = var.env
  }
}

resource "aws_subnet" "public2" {
  vpc_id = aws_vpc.new_vpc.id
  cidr_block = var.pub_sub_cid2
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = var.map_public_ip_on_launch
    tags = {
    Name = "my_pb_sbt2"
    Environment = var.env
  }
}

resource "aws_subnet" "private1" {
  vpc_id = aws_vpc.new_vpc.id
  cidr_block = var.pvt_sub_cid1
  availability_zone       = "us-east-1a"
     tags = {
    Name = "my_pt_sbt1"
    Environment = var.env
  }
}

resource "aws_subnet" "private2" {
  vpc_id = aws_vpc.new_vpc.id
  cidr_block = var.pvt_sub_cid2
  availability_zone       = "us-east-1b"
     tags = {
    Name = "my_pt_sbt2"
    Environment = var.env
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.new_vpc.id
    tags = {
    Name = "my_igw"
    Environment = var.env
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.new_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "my_pb_rt"
    Environment = var.env
  }
}


resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.rt.id
}