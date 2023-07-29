resource "aws_s3_bucket" "siren_bucket" {
    bucket = var.bucket_name
}

resource "aws_s3_bucket_public_access_block" "siren-acl" {
  bucket = aws_s3_bucket.siren_bucket.id

  block_public_acls   = false
  block_public_policy = false
}

resource "aws_s3_bucket_website_configuration" "siren-website" {
  bucket = aws_s3_bucket.siren_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_policy" "siren_app_policy" {
  bucket = aws_s3_bucket.siren_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::siren-frontend/*"
      },
      {
        Sid       = "PublicReadForRouting"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::siren-frontend/index.html"
      },
    ]
  })
}