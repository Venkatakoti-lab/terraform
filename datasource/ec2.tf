resource "aws_instance" "expense"{
    ami = data.aws_ami.expense.id
    instance_type = "t3.micro"
}