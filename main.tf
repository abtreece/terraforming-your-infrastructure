provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "example" {
  count         = "${var.instance_count}"
  ami           = "${lookup(var.ami, var.region)}"
  instance_type = "${var.instance_type}"
  availability_zone = "us-east-1a"

  root_block_device {
    delete_on_termination = "true"
  }

  lifecycle {
    create_before_destroy = true
  }
}
