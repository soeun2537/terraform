output "instance_id" {
  description = "EC2 instance ID."
  value       = module.instance.instance_id
}

output "instance_public_ip" {
  description = "EC2 public IP address."
  value       = module.instance.public_ip
}

output "instance_private_ip" {
  description = "EC2 private IP address."
  value       = module.instance.private_ip
}

output "vpc_id" {
  description = "VPC ID."
  value       = module.network.vpc_id
}
