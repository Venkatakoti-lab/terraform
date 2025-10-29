resource "aws_instance" "expense" {
  ami           = local.ami_id
  instance_type = local.instance_type
  tags = {
    Name    = local.name
    purpose = "terraform-practising"
  }
}