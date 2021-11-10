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

module "ec2" {
  source = "./ec2"
}

module "sg" {
  source = "./sg"
}