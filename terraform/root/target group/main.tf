data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket         = "dev-shasuf-bucket"
    key            = "networking/vpc/terraform.tfstate"   # ✅ same as VPC backend
    region         = "us-east-1"
    dynamodb_table = "dev-lock-table"
  }
}

module "target_group" {
  source = "../../modules/target_group"
  env = var.env
  tg_group_port = 80
  tg_group_protocol = "HTTP"
  tg_group_target_type = "instance"
  tg_group_vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
}


terraform {
  backend "s3" {
    bucket         = "dev-shasuf-bucket"
    key            = "target_group/target/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev-lock-table"
    encrypt        = true
  }
}
