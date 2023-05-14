provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "lb" {
  vpc      = true
}

output "eip" {
    value = aws_eip.lb.public_ip
}

resource "aws_s3_bucket" "mys3" {
  bucket = "terraform-associate-demobucket-lisining"

}

output "mys3bucket" {
    value = aws_s3_bucket.mys3.bucket_domain_name
}

