data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket         = "dev-shasuf-bucket"
    key            = "networking/vpc/terraform.tfstate"   # ✅ same as VPC backend
    region         = "us-east-1"
    dynamodb_table = "dev-lock-table"
  }
}

data "terraform_remote_state" "sg" {
  backend = "s3"
  config = {
    bucket         = "dev-shasuf-bucket"
    key            = "dev_security_group/sg/terraform.tfstate"   # ✅ same as VPC backend
    region         = "us-east-1"
    dynamodb_table = "dev-lock-table"
  }
}

module "alb" {
  source = "../../modules/ALB"
  env = var.env
  load_balancer_type = "application"
  alb_security_groups = data.terraform_remote_state.sg.outputs.security_group
  alb_subnet = data.terraform_remote_state.vpc.outputs.pb_subnet1
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
