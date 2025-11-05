variable "region" {
  description = "AWS region (e.g. ap-northeast-2)."
  type        = string
}

variable "project_name" {
  description = "Project identifier used in resource names."
  type        = string
  default     = "app"
}

variable "environment_prefix" {
  description = "Environment prefix for naming."
  type        = string
  default     = "prod"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.60.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.60.1.0/24"
}

variable "ami_id" {
  description = "선택적으로 직접 지정할 AMI ID. 비워두면 Amazon Linux 2023 최신 AMI를 자동으로 사용합니다."
  type        = string
  default     = null
}

variable "ami_architecture" {
  description = "기본 Amazon Linux 2023 AMI를 사용할 때 동일한 아키텍처를 선택합니다. 예: x86_64, arm64"
  type        = string
  default     = "arm64"

  validation {
    condition     = contains(["x86_64", "arm64"], var.ami_architecture)
    error_message = "ami_architecture 값은 \"x86_64\" 또는 \"arm64\" 중 하나여야 합니다."
  }
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t4g.medium"
}

variable "associate_public_ip" {
  description = "Whether to attach a public IP to the instance."
  type        = bool
  default     = true
}

variable "key_name" {
  description = "SSH key pair name registered in AWS."
  type        = string
}

variable "root_block_device_size" {
  description = "Root volume size in GB."
  type        = number
  default     = 50
}

variable "user_data" {
  description = "Optional user data script."
  type        = string
  default     = ""
}

variable "additional_tags" {
  description = "Additional tags merged into the instance."
  type        = map(string)
  default     = {
    Environment = "prod"
  }
}
