provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0231217be14a6f3ba"
  instance_type = "t3.micro"
}
