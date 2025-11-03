variable "region" {
  description = "AWS region (e.g. ap-northeast-2)."
  type        = string
}

variable "access_key" {
  description = "AWS access key ID. Leave empty if using shared credentials or other auth."
  type        = string
  default     = null
}

variable "secret_key" {
  description = "AWS secret access key. Leave empty if using shared credentials or other auth."
  type        = string
  default     = null
}

variable "session_token" {
  description = "AWS session token for temporary credentials."
  type        = string
  default     = null
}

variable "shared_credentials_file" {
  description = "Path to the shared credentials file."
  type        = string
  default     = null
}

variable "profile" {
  description = "AWS credentials profile to use."
  type        = string
  default     = null
}

variable "project_name" {
  description = "Project identifier used in resource names."
  type        = string
  default     = "app"
}

variable "environment_prefix" {
  description = "Environment prefix for naming."
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.50.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.50.1.0/24"
}

variable "ami_id" {
  description = "선택적으로 직접 지정할 AMI ID. 비워두면 Amazon Linux 2023 최신 AMI를 자동으로 사용합니다."
  type        = string
  default     = null
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
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
  default     = 30
}

variable "user_data" {
  description = "Optional user data script."
  type        = string
  default     = ""
}

variable "additional_tags" {
  description = "Additional tags merged into the instance."
  type        = map(string)
  default     = {}
}
