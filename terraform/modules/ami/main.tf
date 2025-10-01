resource "aws_ami_from_instance" "my_ami" {
  name               = "${var.env}-ami"
  source_instance_id = var.instance_id
}