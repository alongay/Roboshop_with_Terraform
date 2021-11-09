provider "aws" {
  region = "us-east-1"
}

#Create Security Group allow_sample
resource "aws_security_group" "allow_sample" {
  name        = "allow_sample"
  description = "Allow Sample inbound traffic"

  ingress = [
    {
      description      = "ALLOW_SAMPLE from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    Name = "allow_sample"
  }
}

# Create EC2 instance
resource "aws_instance" "sample" {
  ami                    = "ami-077fb3e62ddf0fa9a"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_sample.id]

  tags = {
    Name = "sample"
  }
}