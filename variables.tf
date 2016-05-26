variable "vpc_network" {
  default = "172.31.1.0/25"
}

variable "description" {
  default = ""
}

variable "environment" {
  default = ""
}

variable "cost_code" {
  default = ""
}

variable "owner" {
  default = ""
}

variable "email" {
  default = ""
}

variable "nat_count" {
  default = 3
}

variable "zones" {
  default = "eu-west-1a,eu-west-1b,eu-west-1c"
}
