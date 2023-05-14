variable "elb_name" {
    type = string
    default="myelb"
}

variable "az" {
    type = list
    default = ["us-east-1a", "us-east-1b"]
}

variable "timeout" {
    type = number
    default = "30"
}