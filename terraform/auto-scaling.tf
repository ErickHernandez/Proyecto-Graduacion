resource "aws_launch_configuration" "proyectograd-web-server-launch-config" {
  image_id        = lookup(var.ami, var.aws_region)
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh-allowed.id}"]
  name_prefix = "proyectograd-web-server-"
  key_name = "proyectograd"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "proyectograd-auto-scaling-group" {
  name_prefix = "proyectograd-auto-scaling-group-"
  launch_configuration = "${aws_launch_configuration.proyectograd-web-server-launch-config.name}"
  vpc_zone_identifier  = [aws_subnet.proyectograd-subnet-public-1.id, aws_subnet.proyectograd-subnet-public-2.id]
  #target_group_arns    = ["${var.alb_target_group_arn}"]
  target_group_arns    = [aws_lb_target_group.proyectograd-target-group.arn]
  health_check_type    = "ELB"

  min_size = 2
  desired_capacity = 2
  max_size = 4

  tag {
    key                 = "Name"
    value               = "proyectograd-web-server-asg"
    propagate_at_launch = true
  }

  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }
}