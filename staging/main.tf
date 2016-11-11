module "web" {
  source = "../modules/web"

  availability_zone = "${var.availability_zone}"
  connection_user = "${var.connection_user}"
  instance_count         = "${var.instance_count}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  public_key_path = "${var.public_key_path}"
  region = "${var.region}"
  web_security_groups = "${module.sg.security_group_id}"
  name = "${var.name}"
  environment = "${var.environment}"

}

module "sg" {
  source = "../modules/sg"
  
  name = "${var.name}"
  environment = "${var.environment}"
}

module "elb" {
  source = "../modules/elb"

  availability_zones = "${var.availability_zone}"
  name = "${var.name}"
  environment = "${var.environment}"
  web_instance_ids = "${module.web.web_instance_ids}"
}

output "elb_dns_name" {
  value = "${module.elb.dns_name}"
}
