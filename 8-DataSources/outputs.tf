output "ami_id" {
  value = data.aws_ami.ami_id.id     #to get ami id of the instance
} 

output "vpc_info" {
  value = data.aws_vpc.default
}