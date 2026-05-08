terraform {
  backend "local" {
    path = "/tmp/terraform.tfstate"
  }
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "nginx-node" {
  ami                    = "ami-032b48ced5c68d4fa" # nginx AMI
  instance_type          = "t3.micro"
  subnet_id              = "subnet-0863d2dc6fd9f284e"
  vpc_security_group_ids = ["sg-06ebe444061b8c13c"] # ✅ correct SG
  key_name               = "MasterClass2025"

  tags = {
    Name = "terraform-nginx-node"
  }
}
