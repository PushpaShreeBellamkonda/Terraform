resource "aws_instance" "db" {
        ami = var.image_id
        vpc_security_group_ids = [aws_security_group.allo_ssh.id]
        instance_type = var.instance_name == "db" ? "t3.small" : "t3.micro"
           
}
