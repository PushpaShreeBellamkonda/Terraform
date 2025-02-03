resource "aws_security_group" "allow_ssh"{
    name = var.sg_name
    description = var.sg_description

    ingress {
        from_port        = var.ssh_port
        to_port          = vsr.ssh_port
        protocol         = var.protocol
        cidr_blocks      = var.allowed_cidr
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
      count = length(var.instance_names)
      ami = var.image_id
      vpc_security_group_ids = [aws_security_group.allow_ssh.id]
      instance_type = var.instance_names[count.index] == "db" ? "t3.small" : "t3.micro"
      
      tags = merge(
        var.common_tags ,
        {
          Name = var.instance_names[count.index]
        }
      )
}
