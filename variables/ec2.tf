resource "aws_security_group" "allo_ssh"{
    name = "allow_ssh"
    description = "allowing ssh"

    tags = {
        Name = "allow_ssh"
        CreatedBy = "Pushpa"

    }

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
  }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
  }
 
}

resource "aws_instance" "db" {
        ami = var.image_id
        vpc_security_group_ids = [aws_security_group.allo_ssh.id]
        instance_type = var.instance_type
        tags = var.tags

    
}
