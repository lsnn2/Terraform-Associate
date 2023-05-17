variable "list" {
    type = list
    default = ["m5.large", "m5.xlarge", "t2.medium"]
}

provider "aws" {
  region = "us-east-1"
}
variable "AMIS" {
  type = map(any)
  default = {
    "centos_7"     = "ami-002070d43b0a4f171"
    "ubuntu_18_04" = "ami-0263e4deb427da90e"
    "ubuntu_20_04" = "ami-0aa2b7722dc1b5612"
  }
}

variable "ZONE" {
  default = "us-east-1a"
}

resource "aws_instance" "First_EC2" {
  ami                    = var.AMIS["ubuntu_20_04"]
  instance_type          = var.list[0]
  availability_zone      = var.ZONE
  tags = {
    Name    = "First_EC2"
    Project = "Terraform-Associate"
  }
}