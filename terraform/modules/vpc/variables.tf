variable "env" {
  type = string
}

variable "my_vpc" {
  type = string
}

variable "vpc_cid" {
  type = string
}

variable "pub_sub_cid1" {
  type = string
}

variable "pub_sub_cid2" {
  type = string
}

variable "pvt_sub_cid1" {
  type = string
}

variable "pvt_sub_cid2" {
  type = string
}

variable "map_public_ip_on_launch" {
  type = bool
  default = true
}