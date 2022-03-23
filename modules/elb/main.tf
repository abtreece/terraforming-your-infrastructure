resource "aws_elb" "elb" {
  name               = "${var.name}-elb"
  availability_zones = ["${split(",", var.availability_zones)}"]

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = ["${split(",", var.web_instance_ids)}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name        = "${var.name}-elb"
    Environment = var.environment
  }
}
