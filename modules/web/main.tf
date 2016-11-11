resource "aws_instance" "web" {
  ami           = "${lookup(var.ami, var.region)}"
  count         = "${var.instance_count}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.availability_zone}"
  key_name = "${var.key_name}"
  vpc_security_group_ids = ["${var.web_security_groups}"]

  root_block_device {
    delete_on_termination = "true"
  }

  lifecycle {
    create_before_destroy = true
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install nginx",
      "sudo service nginx start",
      "sudo sh -c 'echo \\\"${var.environment} instance id:${self.id}\\\" > /usr/share/nginx/html/index.html'",
    ]
  }

  connection {
    user = "${var.connection_user}"
    private_key = "${file("${var.public_key_path}")}"
  }

}
