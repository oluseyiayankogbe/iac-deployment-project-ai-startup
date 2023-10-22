#1. Creat s3-bucket

resource "aws_s3_bucket" "aistartupstorage102023" {
  bucket = "${var.s3_prefix}-aistartupstorage102023"
  object_lock_enabled = true
  #acl = var.acl
}

resource "aws_s3_bucket_ownership_controls" "s3-bucket-ownership-controls" {
  bucket = aws_s3_bucket.aistartupstorage102023.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
  depends_on = [aws_s3_bucket_public_access_block.example]
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.aistartupstorage102023.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "s3-bucket-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3-bucket-ownership-controls]

  bucket = aws_s3_bucket.aistartupstorage102023.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "aws-s3-bucket-versioning" {
  bucket = "${var.s3_prefix}-aistartupstorage102023"
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "aws-s3bucket-server-side-encryption-configuration" {
  bucket = "${var.s3_prefix}-aistartupstorage102023"

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}



resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle_configuration" {

  bucket = aws_s3_bucket.aistartupstorage102023.id

  rule {
    id = "archival"

    filter {
      and {
        prefix = "/"

        tags = {
          rule      = "archival"
          autoclean = "false"
        }
      }
    }

    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }
}





resource "aws_s3_bucket_policy" "s3-ecs-access-bucket-policy" {
  #name = "example-bucket-policy"
  bucket = aws_s3_bucket.aistartupstorage102023.id

    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
     {
        Principal = "*"
        Action = [
          "s3:*",
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::${var.s3_prefix}-aistartupstorage102023",
          "arn:aws:s3:::${var.s3_prefix}-aistartupstorage102023/*"
        ]
      },
      {
        Sid = "PublicReadGetObject"
        Principal = "*"
        Action = [
          "s3:GetObject",
        ]
        Effect   = "Allow"
        Resource = [
          "arn:aws:s3:::${var.s3_prefix}-aistartupstorage102023",
          "arn:aws:s3:::${var.s3_prefix}-aistartupstorage102023/*"
        ]
      },
    ]
  })
  
  depends_on = [aws_s3_bucket_public_access_block.example]
}

