# output "playsms-tf-1_instance_public_ip_addr" {
#   value = aws_instance.playsms-tf-1.public_ip
# }

# output "playsms-tf-2_instance_public_ip_addr" {
#   value = aws_instance.playsms-tf-2.public_ip
# }

# output "playsms_aws_elb_public_dns" {
#   value = aws_elb.playsms.dns_name
# }

# output "playsms-target-group" {
#   value = "${aws_lb_target_group.playsms-target-group.arn}"
# }

output "playsms_web_alb_public_dns" {
  value = aws_lb.playsms-web-alb.dns_name
}