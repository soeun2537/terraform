terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "state" {
  for_each = { for env in var.environments : env => env }

  bucket              = lower("${var.project_name}-${var.area}-${each.value}-terraform-state")
  object_lock_enabled = true

  tags = {
    Project     = var.project_name
    Environment = each.value
    ManagedBy   = "terraform"
  }
}

resource "aws_s3_bucket_versioning" "state" {
  for_each = aws_s3_bucket.state

  bucket = each.value.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "state" {
  for_each = aws_s3_bucket.state

  bucket = each.value.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_object_lock_configuration" "state" {
  for_each = aws_s3_bucket.state

  bucket = each.value.id

  depends_on = [
    aws_s3_bucket_versioning.state,
  ]

  rule {
    default_retention {
      mode = "GOVERNANCE"
      days = 1
    }
  }
}
