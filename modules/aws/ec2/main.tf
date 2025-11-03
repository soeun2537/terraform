locals {
  merged_tags = merge(
    {
      Name = var.instance_name
    },
    var.additional_tags
  )
}

resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = var.associate_public_ip
  key_name                    = var.key_name
  user_data_base64            = var.user_data

  root_block_device {
    volume_size = var.root_block_device_size
    volume_type = "gp3"
  }

  tags = local.merged_tags
}
