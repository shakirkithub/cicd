#resource "aws_key_pair" "mykey" {
###}
resource "aws_instance" "my_instance" {
  instance_type = var.instance_type
  ami = var.ami_id
  vpc_security_group_ids = [var.sg]
  subnet_id = var.subnet
  key_name = "new-key"

  tags = {
    Name = "${var.env}-instance"
    Environment = var.env
  }
}