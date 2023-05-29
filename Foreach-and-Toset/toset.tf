provider "aws" {

}

resource "aws_iam_user" "iam" {
    for_each = toset( ["user-0", "user-01", "user-02", "user-03"])
    name = each.key
}

resource "aws_instance" "myec2" {
    ami = "123"
    for_each = {
        key1 = "t2.micro"
        key2= "t2.medium"
    }
    instance_type = each.value 
    key_name = each.key_name
    tags = {
        Name = each.value
    }
}