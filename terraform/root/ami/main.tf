data "terraform_remote_state" "ec2" {
  backend = "s3"
  config = {
    bucket         = "dev-shasuf-bucket"
    key            = "dev_compute_ec2/inst/terraform.tfstate"   # ✅ same as VPC backend
    region         = "us-east-1"
    dynamodb_table = "dev-lock-table"
  }
}

module "ami" {
 source = "../../modules/ami"
 env = var.env
 instance_id = data.terraform_remote_state.ec2.outputs.instance_id
}



terraform {
  backend "s3" {
    bucket         = "dev-shasuf-bucket"
    key            = "dev_ami_id/ami/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev-lock-table"
    encrypt        = true
  }
}