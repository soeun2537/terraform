variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
}

variable "name_prefix" {
  description = "Prefix used for naming AWS networking resources."
  type        = string
}
