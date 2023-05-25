
provider "aws" {
  region = "us-east-1"
}

variable "sg_ports" {
  type        = list(any)
  description = "list of ingress ports"
  default     = [443, 80, 3306, 22]
}

resource "aws_security_group" "dynamic-sg" {
  name = "dynamic-sg"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}