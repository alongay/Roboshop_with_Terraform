# Create EC2 instance
resource "aws_instance" "sample" {
  count                  = length(var.components)
  ami                    = data.aws_ami.ami.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-049e9bd07e7efb3ad"]
  tags = {
    Name = element(var.components, count.index)
  }
}

data "aws_ami" "ami" {
  most_recent = true
  name_regex = "^centos*"
  owners = ["973714476881"]
}

variable "components" {
  default = ["frontend", "mongodb", "catalogue", "cart", "user", "radis", "mysql", "shipping", "rebbitmq","payment"]
}