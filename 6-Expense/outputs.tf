output "instance_info" {
  value = aws_instance.db.public_ip
# value = aws_instance.db (to get full info about instance)
}