resource "aws_instance" "web" {
  count         = length(var.instance_names)
  ami           = data.aws_ami.expense.id
  instance_type = var.instance_names[count.index] == "mysql" ? "t3.small" : "t3.micro"
  tags = merge(
    var.common_tags,
    {
      Name = var.instance_names[count.index]
    }
  )
}
resource "aws_security_group" "dynamic" {
  name        = "dynamic-sg"
  description = "providing dynamically"
  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}