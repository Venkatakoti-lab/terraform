data "aws_ami" "expense" {
  owners = [ "973714476881" ]
  most_recent = true
  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_vpc" "vpc" {
  default = true 
}
output "vpc_info" {
  value = data.aws_vpc.vpc.id
}
output "ami_info" {
  value = data.aws_ami.expense.id
}