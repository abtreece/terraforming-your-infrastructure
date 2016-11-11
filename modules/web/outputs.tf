output "web_instance_ids" {
  value = "${join(",", aws_instance.web.*.id)}"
}

output "web_public_ips" {
  value = "${join(",", aws_instance.web.*.public_ip)}"
}
