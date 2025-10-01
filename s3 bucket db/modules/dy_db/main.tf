resource "aws_dynamodb_table" "my_db" {
  name         = "${var.env}-lock-table"
  hash_key         = var.hash_key
  billing_mode     = "PAY_PER_REQUEST"
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = var.hash_key
    type = var.attribute_type
  }

  tags = {
    Name = "${var.env}-lock-table"
    Environment = var.env
  }
}