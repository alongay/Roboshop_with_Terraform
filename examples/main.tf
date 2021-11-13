provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "samplebucket-d60"
    key    = "example/terraform.tfstate"
    region = "us-east-1"
  }
}

#module "ec2" {
#  count  = 2
#  source = "./ec2"
#  SGID   = module.sg.SGID
#  name   = "sample-${count.index}"
#}

module "ec2" {
  source          = "./ec2"
  SGID            = module.sg.SGID
  name            = ["new1", "new2"]
  instance_type   = var.instance_type
}

module "sg" {
  source = "./sg"
}

variable "instance_type" {}

#output "public_ip" {
#  value = module.ec2
#}