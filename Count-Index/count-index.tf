resource "aws_iam_user" "lb" {
  name = var.elb_names[count.index]
  path = "/system/"
  count = 3
}

variable "elb_names" {
    type = list
    default = ["dev-loadbalancer", "stage-loadbalancer", "prod-loadbalancer"]
}