resource "aws_security_group" "allow_ssh"{
    name = var.sg_name
    description = var.sg_description

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
  }

    egress {
        from_port        = var.ssh_port
        to_port          = var.ssh_port
        protocol         = var.protocol
        cidr_blocks      = var.allowed_cidr
        ipv6_cidr_blocks = ["::/0"]
  }
 
}

# left is argument right is value

resource "aws_instance" "db" {
        ami = var.image_id
        vpc_security_group_ids = [aws_security_group.allow_ssh.id]
        instance_type = var.instance_type
        
        tags = var.tags
}
