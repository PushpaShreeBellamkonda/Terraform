# first preference = command line
# 2nd = tfvars
# 3rd = environment variable (. export TF_VAR_instance_type = t3.micro )
# 4th variable value default

resource "aws_security_group" "allo_ssh"{
    name = var.sg_name
    description = var.sg_description

    tags = {
        Name = "allow_ssh"
        CreatedBy = "Pushpa"
        
    }

    ingress {
        from_port        = var.ssh_port
        to_port          = var.ssh_port
        protocol         = var.protocol
        cidr_blocks      = var.allow_cidr
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
