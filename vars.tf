variable "region" { default = "us-east-1" }

variable "ami" {
  type = "map"
  default = {
    us-east-1 = "ami-b73b63a0"
    us-east-2 = "ami-58277d3d"
  }
}

variable "instance_type" { default = "t2.micro" }
