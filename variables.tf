variable "vpc_network" {
  description = "Example: 172.32.0.0/16"
  default     = "172.32.0.0/16"
}

variable "flow_log_retention_period" {
  default     = "7"
  description = "The number of days to retain VPC flow logs"
}

locals {
  tags = {
    environment = "${terraform.workspace}"
  }

  default_tags = "${merge(local.tags,var.tags)}"
}

variable "tags" {
  type    = "map"
  default = {}
}
