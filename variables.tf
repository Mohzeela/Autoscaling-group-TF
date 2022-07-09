variable "region" {
  description = "The region for VPC"
  type        = string
  default     = ""
}

variable "environment" {
  description = "The environment for VPC"
  type        = string
  default     = ""
}

variable "availability_zones" {
  description = "The A-Z for PVC"
  type        = list(string)
  default     = []
}

variable "vpc_cidr" {
  description = "The IP address range of the VPC in CIDR notation"
  type        = string
  default     = ""
}

variable "private_subnets_cidr" {
  description = "The IP address range of the VPC's Private address range in CIDR notation"
  type        = list(string)
  default     = []
}

variable "public_subnets_cidr" {
  description = "The IP address range of the VPC's public address range in CIDR notation"
  type        = list(string)
  default     = []
}
