resource "aws_instance" "example" {
  count                  = var.instance_count
  ami                    = lookup(var.ami, var.region)
  instance_type          = var.instance_type
  availability_zone      = "us-east-1a"
  key_name               = var.key_name
  vpc_security_group_ids = ["${aws_security_group.example_sg.id}"]

  root_block_device {
    delete_on_termination = "true"
  }

  lifecycle {
    create_before_destroy = true
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install nginx; sudo service nginx start",
    ]
  }

  connection {
    user        = "ec2-user"
    private_key = file("${var.public_key_path}")
    host        = self.public_ip
  }

}
