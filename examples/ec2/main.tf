# Create EC2 instance
resource "aws_instance" "sample" {
  ami                    = "ami-077fb3e62ddf0fa9a"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [var.SGID]

  tags = {
    Name = var.name
  }
}

variable "SGID" {}
variable "name" {}

output "public_ip" {
  value = aws_instance.sample.private_ip
}