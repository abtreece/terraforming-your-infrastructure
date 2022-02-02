provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0a8b4cd432b1c3063"
  instance_type = "t3.micro"
}
