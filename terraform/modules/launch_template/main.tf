resource "aws_launch_template" "my_l_t" {
  name = "${var.env}-launch-template"
  image_id = var.image_id
  instance_type = var.instance_type
  key_name = "new key"

  network_interfaces {
    subnet_id                   = var.lt_subnet
    security_groups             = [var.lt_sg]   # yahan pe daalo SG
    associate_public_ip_address = true
  }

    tags = {
    Name = "${var.env}-launch template"
    Environment = var.env
  }
}