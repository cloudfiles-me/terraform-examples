/*
output "oregon_srv_public_dns" {
  value = ["${module.application_oregon.srv_public_dns_oregon}"]
}

output "sydney_srv_public_dns" {
  value = ["${module.application.srv_public_dns_sydney}"]
}
*/

output "srv_public_dns" {
  value = ["${aws_instance.web-srv.*.public_dns}"]
}
