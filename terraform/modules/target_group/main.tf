resource "aws_lb_target_group" "ip-example" {
  name        = "${var.env}-target-group"
  port        = var.tg_group_port
  protocol    = var.tg_group_protocol
  target_type = var.tg_group_target_type
  vpc_id      = var.tg_group_vpc_id
}