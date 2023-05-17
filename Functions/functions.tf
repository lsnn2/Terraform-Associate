provider "aws" {
  region = var.region
}

variable "region" {
    default = us-east-1
}

locals {
    time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "tags" {
    type = list
    default = ["firstec2", "secondec2"]
}

variable "ami" {
  type = map
  default = {
    "us-east-3" = "ami-002070d43b0a4f171"
    "us-east-2" = "ami-0263e4deb427da90e"
    "us-east-1" = "ami-0aa2b7722dc1b5612"
  }
}

resource "aws_key_pair" "loginkey" {
    key_name = "login-key"
    public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "app-dev" {
  ami                    = lookup(var.ami,var.region)
  instance_type          = "t2.micro"
  key_name = aws_key_pair.loginkey.key_name
  count = 2
  tags = {
    Name = element(var.tags,count.index)
  }
}

output "timestamp" {
    value = local.time
}
