#1. S3 Bucket w count, tag, variable name
resource "aws_s3_bucket" "ugobacks3" {
  count = var.create_vpc ? 1 : 0

  bucket = lower("bootcamp32-${var.name}-${random_integer.s3.result}")

  tags = {
    Name        = "Prod_bucket"
    Environment = "Prod"
  }
}

#2. KMS encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "ugobacks3" {
  bucket = aws_s3_bucket.ugobacks3.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

#3. KMS for bucket encryption
resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 30
}

#4. Random integer
resource "random_integer" "s3" {
  max = 100
  min = 1

  keepers = {
    bucket_owner = var.name
  }
}

#5. Bucket versioning
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.backend.id
  versioning_configuration {
    status = var.versioning
  }
}