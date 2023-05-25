
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = "123"
    instance_type = "t2.micro"
}