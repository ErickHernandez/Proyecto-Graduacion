resource "aws_lb" "playsms-web-alb" {
  name               = "playsms-web-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.playsms-subnet-public-1.id, aws_subnet.playsms-subnet-public-2.id]
  security_groups    = [aws_security_group.elb-http.id]
  tags = {
    Name = "playsms-web-alb"
  }
}

resource "aws_lb_listener" "playsms-alb-listner" {
  load_balancer_arn = "${aws_lb.playsms-web-alb.arn}"
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.playsms-target-group.arn}"
  }
}

resource "aws_lb_target_group" "playsms-target-group" {
  health_check {
    interval            = 10 # Approximate amount of time, in seconds, between health checks of an individual target
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5 #Amount of time, in seconds, during which no response means a failed health check.
    healthy_threshold   = 3 #Number of consecutive health checks successes required before considering an unhealthy target healthy
    unhealthy_threshold = 2 #Number of consecutive health check failures required before considering the target unhealthy
  }

  name        = "playsms-target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.playsms-vpc.id
}
