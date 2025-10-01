resource "aws_s3_bucket" "bucket" {
  bucket = "${var.env}-shasuf-bucket"
  tags = {
    Name = "${var.env}-s3"
    Environment = var.env
  }
}