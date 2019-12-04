resource "aws_alb" "alb" {
  count = var.create_alb ? 1 : 0
  load_balancer_type = "application"
  internal = var.alb_internal
  name = var.load_balancer_name
  security_groups = var.security_groups
  subnets = var.subnets
}

resource "aws_alb_target_group" "alb_target_group" {
  count = var.create_alb ? 1 : 0
  name = var.tg_name
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  stickiness {
    type = "lb_cookie"
  }
  health_check {
    path = "/"
    port = 80
  }
}

resource "aws_alb_listener" "alb_listener_http" {
  load_balancer_arn = aws_alb.alb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.alb_target_group.arn
    type = "forward"
  }
}
#resource "aws_alb_target_group_attachment" "alb_tg_attachment" {
#
#}
