provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "${lookup(var.ami, var.region)}"
  instance_type = "${var.instance_type}"

  root_block_device {
    delete_on_termination = "true"
  }
}
