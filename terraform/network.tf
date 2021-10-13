resource "aws_internet_gateway" "playsms-igw" {
  vpc_id = aws_vpc.playsms-vpc.id
  tags = {
    Name = "playsms-igw"
  }
}

resource "aws_route_table" "playsms-public-crt" {
  vpc_id = aws_vpc.playsms-vpc.id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.playsms-igw.id
  }

  tags = {
    Name = "playsms-public-crt"
  }
}

resource "aws_route_table_association" "playsms-crta-public-subnet-1" {
  subnet_id      = aws_subnet.playsms-subnet-public-1.id
  route_table_id = aws_route_table.playsms-public-crt.id
}

resource "aws_route_table_association" "playsms-crta-public-subnet-2" {
  subnet_id      = aws_subnet.playsms-subnet-public-2.id
  route_table_id = aws_route_table.playsms-public-crt.id
}

resource "aws_security_group" "ssh-allowed" {
  vpc_id = aws_vpc.playsms-vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    // This means, all ip address are allowed to ssh ! 
    // Put only your office or home address in it!
    cidr_blocks = ["0.0.0.0/0"]
  }
  // Giving access to http port 80 and https port 443
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ssh-allowed"
  }
}

resource "aws_security_group" "alb-http" {
  vpc_id = aws_vpc.playsms-vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "alb-http"
  }
}