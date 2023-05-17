provider "aws" {
  region = "us-east-1"
}

locals {
    common_tags = {
        Owner = "DevOps Team"
        service = "backend"
    }
}

variable "istest" {}

resource "aws_instance" "dev" {
  ami                    = "ami-0aa2b7722dc1b5612"
  instance_type          = "t2.micro"
  tags = local.common_tags
}

resource "aws_instance" "prod" {
  ami                    = "ami-0aa2b7722dc1b5612"
  instance_type          = "t2.large"
  tags = local.common_tags
}