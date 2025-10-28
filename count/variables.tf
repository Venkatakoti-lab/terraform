variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"
}
variable "instance_type" {
  type    = string
  default = "t3.micro"
}
variable "instance_names" {
  default = ["mysql", "backend", "frontend"]
}
variable "common_tags" {
  default = {
    Environment = "dev"
    Project     = "expense"
    Terraform   = true
  }
}
variable "zone_id" {
  default = "Z02988173SZ8V260ALMBR"
}
variable "domain_name" {
  default = "kanakam.shop"
}