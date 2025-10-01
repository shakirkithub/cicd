resource "aws_security_group" "my_sg" {
  name        = "${var.env}-allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    tags = {
    Name = "${var.env}-sg"
    Environment = var.env
  }

}