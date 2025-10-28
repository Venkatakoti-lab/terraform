variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}
variable "instance_type" {
  default = "t3.micro"
}
variable "instance_names" {
  default = ["mysql", "backend", "frontend"]
}
variable "common_tags" {
  default = {
    Project     = "expense"
    Environment = "dev"
    Terraform   = true
  }
}
variable "from_port" {
  default = "22"
}
variable "to_port" {
  default = "22"
}
variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}
variable "zone_id" {
  default = "Z02988173SZ8V260ALMBR"
}
variable "domain_name" {
  default = "kanakam.shop"
}