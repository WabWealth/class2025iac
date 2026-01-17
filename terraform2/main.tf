terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# ---- Settings (edit these) ----
provider "aws" {
  region = "eu-west-1"
}


resource "aws_instance" "python-node" {
  ami                    = "ami-08b6a2983df6e9e25"
  instance_type          = "t3.micro"
  subnet_id              = "subnet-060ba13bd6800a0db"
  key_name               =  "MasterClass2025"

  tags = {
    Name = "python-node"
  }
}
