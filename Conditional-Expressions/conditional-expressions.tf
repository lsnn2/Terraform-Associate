provider "aws" {
  region = "us-east-1"
}

variable "ZONE" {
  default = "us-east-1a"
}

variable "istest" {}

resource "aws_instance" "dev" {
  ami                    = "ami-0aa2b7722dc1b5612"
  instance_type          = "t2.micro"
  count = var.istest == true ? 3 : 0
}

resource "aws_instance" "prod" {
  ami                    = "ami-0aa2b7722dc1b5612"
  instance_type          = "t2.large"
  count = var.istest == false ? 1 : 0
}