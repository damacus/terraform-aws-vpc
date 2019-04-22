# Terraform VPC Module

Opinionated VPC creation module.

This module is designed to create a VPC and all the associated features usually created at the network level each time I start a new project.

## Overview

Creates:

- VPC
- Subnets (private/public/databases)
- Nat gateways (private & database)
- Internet gateway (public)
- S3 Endpoint
- VPC Flow logs and Cloudwatch log groups
