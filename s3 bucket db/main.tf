module "s3" {
  source = "./modules/s3"
  env = var.env
}

module "db_tb" {
  source = "./modules/dy_db"
  env = var.env
  hash_key = "LockID"
  attribute_type = "S"
}