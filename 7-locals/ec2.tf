resource "aws_instance" "db" {
        ami = local.ami
        vpc_security_group_ids = [local.sg_id]
        # instance_type = local.instance_type
        # instance_type = var.instance_name == "db" ? "t3.small" : "t3.micro"
        instance_type = local.instance_type
        tags = {
            name ="db"
        }
    
}