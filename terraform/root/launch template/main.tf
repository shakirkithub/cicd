data "terraform_remote_state" "ami_id" {
  backend = "s3"
  config = {
    bucket         = "dev-shasuf-bucket"
    key            = "dev_ami_id/ami/terraform.tfstate"   # ✅ same as VPC backend
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


data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket         = "dev-shasuf-bucket"
    key            = "networking/vpc/terraform.tfstate"   # ✅ same as VPC backend
    region         = "us-east-1"
    dynamodb_table = "dev-lock-table"
  }
}

module "launch_template" {
  source = "../../modules/launch_template"
  env = var.env
  image_id = data.terraform_remote_state.ami_id.outputs.ami_id
  instance_type = "t2.micro"
  lt_sg = data.terraform_remote_state.sg.outputs.security_group
  lt_subnet = data.terraform_remote_state.vpc.outputs.public_subnet_1
}



terraform {
  backend "s3" {
    bucket         = "dev-shasuf-bucket"
    key            = "dev_launch_template/lt/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev-lock-table"
    encrypt        = true
  }
}