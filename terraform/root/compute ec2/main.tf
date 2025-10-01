#resource "aws_key_pair" "mykey" {
 # key_name   = "new-key"
#  public_key = file("T:/MY PROJECT/modules/ec2/id_ed25519.pub")
#}

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


module "instance" {
  source = "../../modules/ec2"
  env = var.env
  instance_type = "t2.micro"
  ami_id = "ami-0360c520857e3138f"
  sg = data.terraform_remote_state.sg.outputs.security_group
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet = data.terraform_remote_state.vpc.outputs.public_subnet_1
}



terraform {
  backend "s3" {
    bucket         = "dev-shasuf-bucket"
    key            = "dev_compute_ec2/inst/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev-lock-table"
    encrypt        = true
  }
}
