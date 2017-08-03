variable "vpc_network" {
  description = "Example: 172.31.1.0/18"
}

variable "flow_log_retention_period" {
  default     = "7"
  description = "The number of days to retain VPC flow logs"
}

# Tags
variable "cost_code" {}

variable "owner" {}
variable "email" {}
variable "project" {
  description = "Name ofthe product or project you are creating"
}

variable "region" {
  description = "The AZ for the s3 endpoint"
}
