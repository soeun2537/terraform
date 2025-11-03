variable "ami_id" {
  description = "AMI ID used to launch the instance. Leave null to use the latest Amazon Linux 2023."
  type        = string
  default     = null
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched."
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to attach to the instance."
  type        = list(string)
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP to the instance."
  type        = bool
  default     = true
}

variable "key_name" {
  description = "SSH key pair name registered in AWS."
  type        = string
}

variable "instance_name" {
  description = "Name tag applied to the instance."
  type        = string
}

variable "root_block_device_size" {
  description = "Size of the root block device in GB."
  type        = number
  default     = 30
}

variable "user_data" {
  description = "Optional user data script to run on boot."
  type        = string
  default     = ""
}

variable "additional_tags" {
  description = "Additional tags to merge with defaults."
  type        = map(string)
  default     = {}
}
