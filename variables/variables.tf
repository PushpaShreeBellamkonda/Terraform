variable "image_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "RHEL 9"
  
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
    }
  
}