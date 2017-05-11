variable "vpc_network" {
  default = "172.31.1.0/24"
}

variable "nat_count" {
  default = 3
}

# Metadata
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

variable "flow_log_retention_period" {
  default     = "7"
  description = "The number of days to retain VPC flow logs"
}
