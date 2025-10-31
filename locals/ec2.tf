resource "aws_instance" "demo" {
  ami           = local.ami_id
  instance_type = local.instance_type
  tags = {
    Name    = local.name
    purpose = "terraform-practising"
  }
}