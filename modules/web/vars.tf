variable "ami" {
  type = "map"
  default = {
    us-east-1 = "ami-b73b63a0"
    us-east-2 = "ami-58277d3d"
  }
}

variable "availability_zone" {}
variable "connection_user" {}
variable "instance_count" {}
variable "instance_type" {}
variable "key_name" {}
variable "public_key_path" {}
variable "region" {}
variable "web_security_groups" {}
variable "name" {}
variable "environment" {}
