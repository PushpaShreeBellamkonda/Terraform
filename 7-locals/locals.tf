# locals can hold expressions just like variables hold key value pairs and use it where ever we want
# locals and variables are same , they refer to key value pair
# we can use variables inside locals , but cannot use variables/locals inside variables 

locals {
   ami = "ami-09c813fb71547fc4f"
   sg_id = "sg-0ae5f54407260d0aa "
   # instance_type = "t3.micro"
   instance_type = var.instance_name == "db" ? "t3.small" : "t3.micro"
}