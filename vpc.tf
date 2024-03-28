# vpc
resource "aws_vpc" "vpctest" {
  cidr_block = var.aws_vpc

  tags = {
    Name = "task"
  }
}

#Subnet
resource "aws_subnet" "subnetn" {
  vpc_id                  = aws_vpc.vpctest.id
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  cidr_block              = var.aws_sub
  tags = {
    Name = "task-subnet"
  }
}

#IGW
resource "aws_internet_gateway" "igwn" {
  vpc_id = aws_vpc.vpctest.id

  tags = {
    Name = "task-igw"
  }
}

#SG
# resource "aws_security_group" "instance_sg" {
#   name        = "instance-sg"
#   description = "Security group for instance"
#   vpc_id      = aws_vpc.vpctest.id

#   ingress {
#     from_port   = 443 # Allow HTTP traffic
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   # ingress {
#   #   from_port   = 22 # Allow SSH traffic
#   #   to_port     = 22
#   #   protocol    = "tcp"
#   #   cidr_blocks = ["0.0.0.0/0"] # Allow traffic from any IP address
#   # }


#   ingress {
#     from_port   = 80 # Allow HTTP traffic
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   # egress rules
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#     #ipv6_cidr_blocks = ["::/0"]
#   }
# }
