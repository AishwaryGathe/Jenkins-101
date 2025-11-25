resource "aws_vpc" "VPC-A" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "VPC-A"
    }
}

resource "aws_subnet" "Pub-1a" {
    vpc_id = aws_vpc.VPC-A.id
    availability_zone = "us-east-1a"
    cidr_block = "10.0.1.0/24"
    tags = {
      Name = "Pub-1a"
    }
}