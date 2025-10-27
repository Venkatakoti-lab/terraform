resource "aws_instance" "web" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
    Name        = "terraform-demo"
    purpose     = "terraform-practice"
    project     = "expense"
    component   = "frontend"
    environment = "dev"
    terraform   = true
  }
}
resource "aws_security_group" "allow_ssh" {
  name        = "allow-ssh"
  description = "allowing ssh protocol"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}