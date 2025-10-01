
output "vpc_id" {
  value = module.networking.vpc_id
}


output "public_subnet_1" {
  value = module.networking.pb_subnet1
}

output "public_subnet_2" {
  value = module.networking.pb_subnet2
}

output "private_subnet1" {
  value = module.networking.pvt_subnet1
}

output "private_subnet2" {
  value = module.networking.pvt_subnet2
}