# Create EC2 instance
resource "aws_instance" "sample" {
  ami                    = "ami-077fb3e62ddf0fa9a"
  instance_type          = "t3.micro"
  vpc_security_group_ids = []

  tags = {
    Name = "sample"
  }
}