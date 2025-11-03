output "vpc_id" {
  description = "ID of the created VPC."
  value       = aws_vpc.this.id
}

output "public_subnet_id" {
  description = "ID of the public subnet."
  value       = aws_subnet.public.id
}

output "security_group_id" {
  description = "ID of the security group for public instances."
  value       = aws_security_group.public.id
}

output "availability_zone" {
  description = "First availability zone used for the subnet."
  value       = aws_subnet.public.availability_zone
}
