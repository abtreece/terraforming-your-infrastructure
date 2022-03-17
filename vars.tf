variable "region" { default = "us-east-1" }

variable "ami" {
  type = map(any)
  default = {
    us-east-1 = "ami-b73b63a0"
    us-east-2 = "ami-58277d3d"
  }
}

variable "instance_type" { default = "t2.micro" }
variable "instance_count" { default = "2" }
variable "key_name" { default = "aws-us-east" }
variable "public_key_path" { default = "~/.ssh/aws-us-east.cer" }
