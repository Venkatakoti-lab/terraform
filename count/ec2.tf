resource "aws_instance" "expense" {
  count         = length(var.instance_names)
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = merge(
    var.common_tags,
    {
      Name = var.instance_names[count.index]
    }
  )

}