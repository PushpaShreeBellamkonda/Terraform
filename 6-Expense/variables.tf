variable "image_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "RHEL-9 AMI ID" 
}

variable "instance_type" {
    default = "t3.micro"
    type = string 
}

variable "tags" {
    default = {
        Project = "Expense"
        Environment = "Dev"
        Module = "DB"
        Name = "DB"
    } 
}

variable "sg_name" {
    default = "allow_ssh" 
}

variable "sg_description" {
  default = "allowing port 22"
}

variable "ssh_port" {
  default = 22
}

variable "protocol" {
    default = "tcp"
}

variable "allowed_cidr" {
    #type = list
    default = ["0.0.0.0/0"]
}
