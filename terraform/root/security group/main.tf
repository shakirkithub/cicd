data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket         = "dev-shasuf-bucket"
    key            = "networking/vpc/terraform.tfstate"   # ✅ same as VPC backend
    region         = "us-east-1"
    dynamodb_table = "dev-lock-table"
  }
}


module "security_group" {
  source = "../../modules/sg"
  env = var.env
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
}

terraform {
  backend "s3" {
    bucket         = "dev-shasuf-bucket"
    key            = "dev_security_group/sg/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev-lock-table"
    encrypt        = true
  }
}