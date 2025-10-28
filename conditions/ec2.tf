resource "aws_instance" "expense" {
  count         = length(var.instance_names)
  ami           = var.ami_id
  instance_type = var.instance_names[count.index] == "mysql" ? "t3.small" : "t3.micro"
  tags = merge(
    var.common_tags,
    {
      Name = var.instance_names[count.index]
    }
  )
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow-ssh"
  description = "Allowing only ssh protocals"
  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
  }
  tags = merge(
    var.common_tags,
    {
      Name = "SG_ALLOW_SSH"
    }
  )
}