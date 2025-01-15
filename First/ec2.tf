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
        ami = "ami-09c813fb71547fc4f"
        vpc_security_group_ids = [aws_security_group.allo_ssh.id]
        instance_type = "t3.micro"

        tags = {
            name ="db"
        }
    
}
