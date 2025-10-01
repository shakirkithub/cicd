module "networking" {
  source = "../../modules/vpc"
  env = var.env
  my_vpc = "${var.env}-vpc}"
  vpc_cid = "192.168.0.0/16"
  pub_sub_cid1 = "192.168.1.0/24"
  pub_sub_cid2 = "192.168.2.0/24"
  pvt_sub_cid1 = "192.168.100.0/24"
  pvt_sub_cid2 = "192.168.101.0/24"
  map_public_ip_on_launch = true 
}

terraform {
  backend "s3" {
    bucket         = "dev-shasuf-bucket"
    key            = "networking/vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev-lock-table"
    encrypt        = true
  }
}
