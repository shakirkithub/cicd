module "vpc" {
  source = "./modules/vpc"
  env = var.env
  my_vpc = "dev_vpc"
  vpc_cid = "192.168.0.0/16"
  pub_sub_cid = "192.168.1.0/24"
  pvt_sub_cid = "192.168.5.0/24"
  map_public_ip_on_launch = true
}

module "sg" {
  source = "./modules/sg"
  env = var.env
  vpc_id = module.vpc.vpc_id
}

module "instance" {
  source = "./modules/ec2"
  env = var.env
  instance_type = "t2.micro"
  ami_id = "ami-0360c520857e3138f"
  sg = module.sg.sg
  vpc_id = module.vpc.vpc_id
  subnet = module.vpc.pb_subnet
}


module "myami" {
  source = "./modules/ami"
  env = var.env
  instance_id = module.instance.instance_id_out
}


module "launch_template" {
  source = "./modules/launch_template"
  env = var.env
  image_id = module.myami.image_id
  instance_type = "t2.micro"
  lt_sg = module.sg.sg
  lt_subnet = module.vpc.pb_subnet
}

module "target_group" {
  source = "./modules/target_group"
  env = var.env
  tg_group_port = 80
  tg_group_protocol = "HTTP"
  tg_group_target_type = "instance"
  tg_group_vpc_id = module.vpc.vpc_id
}