variable "region" { default = "us-east-1" }

variable "ami" {
  type = map
  default = {
    us-east-1 = "ami-0a8b4cd432b1c3063"
    us-east-2 = "ami-0231217be14a6f3ba"
  }
}

variable "instance_type" { default = "t2.micro" }
