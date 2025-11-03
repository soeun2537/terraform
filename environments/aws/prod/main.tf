provider "aws" {
  region                  = var.region
  access_key              = var.access_key
  secret_key              = var.secret_key
  token                   = var.session_token
  shared_credentials_files = [var.shared_credentials_file]
  profile                 = var.profile
}

data "aws_ssm_parameter" "amazon_linux_2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-6.1-x86_64"
}

locals {
  effective_ami_id = coalesce(var.ami_id, data.aws_ssm_parameter.amazon_linux_2023.value)
}

module "network" {
  source = "../../../modules/aws/vpc"

  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  name_prefix        = "${var.environment_prefix}-${var.project_name}"
}

module "instance" {
  source = "../../../modules/aws/ec2"

  ami_id                 = local.effective_ami_id
  instance_type          = var.instance_type
  subnet_id              = module.network.public_subnet_id
  security_group_ids     = [module.network.security_group_id]
  associate_public_ip    = var.associate_public_ip
  key_name               = var.key_name
  instance_name          = "${var.environment_prefix}-${var.project_name}"
  root_block_device_size = var.root_block_device_size
  user_data              = var.user_data
  additional_tags        = var.additional_tags
}
