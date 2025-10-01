output "dev_instance" {
  value = module.instance.public_ip
}

output "instance_id" {
  value = module.instance.instance_id_out
}