variable "vpc_network" {
  description = "Example: 172.32.0.0/16"
  default     = "172.32.0.0/16"
}

variable "flow_log_retention_period" {
  default     = "7"
  description = "The number of days to retain VPC flow logs"
}

locals {
  default_tags = { environment = terraform.workspace }
  tags         = merge(local.default_tags, var.tags)
}

variable "tags" {
  type    = map(string)
  default = {}
}
