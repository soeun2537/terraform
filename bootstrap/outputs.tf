output "bucket_names" {
  description = "생성된 Terraform State S3 버킷 이름 목록."
  value       = [for bucket in aws_s3_bucket.state : bucket.bucket]
}
