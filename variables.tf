variable "vpc_network" {
  default = "172.31.1.0/24"
}

variable "flow_log_retention_period" {
  default     = "7"
  description = "The number of days to retain VPC flow logs"
}

# Metadata
variable "description" {}

variable "cost_code" {}
variable "owner" {}
variable "email" {}

variable "availability_zone" {
  description = "The AZ for the s3 endpoint"
}
