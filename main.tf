locals {
  s3_origin_id = "myS3Origin"
}

# S3 Bucket for Website Hosting
resource "aws_s3_bucket" "this" {
  bucket = var.aws_s3_bucket_bucket
  # bucket_prefix
  acl = "private" #public-read
  # grant
  # policy
  tags = {
    Name           = var.aws_s3_bucket_bucket
    Namespace      = var.namespace
    BoundedContext = var.bounded_context
    Environment    = var.environment
  }
  force_destroy = "true"
  # website {
  #   index_document = "index.html"
  #   error_document = "error.html"
  # }
  # cors_rule
  versioning {
    enabled = "false"
  }
  # logging {
  #   target_bucket = "REPLACE_ME"
  #   target_prefix = "REPLACE_ME"   
  # }
  # lifecycle_rule
  # acceleration_status = Suspended
  # request_payer = BucketOwner
  # replication_configuration
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  # object_lock_configuration 
}

resource "aws_s3_bucket_policy" "this" {
  depends_on = [aws_s3_bucket.this]
  bucket     = aws_s3_bucket.this.id
  policy = jsonencode(
    {
      Statement = [
        {
          Action = "s3:GetObject"
          Effect = "Allow"
          Principal = {
            AWS = aws_cloudfront_origin_access_identity.this.iam_arn
          }
          Resource = "${aws_s3_bucket.this.arn}/*"
          Sid      = "cloudfront_get_object"
        },
        {
          Action = "s3:ListBucket"
          Effect = "Allow"
          Principal = {
            AWS = aws_cloudfront_origin_access_identity.this.iam_arn
          }
          Resource = aws_s3_bucket.this.arn
          Sid      = "cloudfront_get_bucket"
        },
      ]
      Version = "2012-10-17"
    }
  )
}

# CloudFront Origin Access Identity
resource "aws_cloudfront_origin_access_identity" "this" {
  comment = var.aws_cloudfront_origin_access_identity_comment
}

# CloudFront Distribution
resource "aws_cloudfront_distribution" "this" {
  depends_on = [aws_s3_bucket.this, aws_cloudfront_origin_access_identity.this]
  # aliases
  # comment

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 403
    response_code         = 200
    response_page_path    = "/index.html"
  }

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
  }

  default_cache_behavior {
    allowed_methods = ["GET", "HEAD"] # ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods  = ["GET", "HEAD"]
    # cache_policy_id
    compress    = true
    default_ttl = 3600
    # field_level_encryption_id
    forwarded_values {
      cookies {
        forward           = "none"
        whitelisted_names = []
      }
      headers                 = []
      query_string            = true
      query_string_cache_keys = []

    }
    # lambda_function_association
    max_ttl = 86400
    min_ttl = 0
    # origin_request_policy_id
    # path_pattern
    # realtime_log_config_arn
    # smooth_streaming 
    target_origin_id = local.s3_origin_id
    # trusted_signers
    viewer_protocol_policy = "redirect-to-https" # "allow-all"
  }

  default_root_object = "index.html"
  enabled             = true
  is_ipv6_enabled     = true
  # http_version = "http2" # http1.1, http2
  # logging_config
  # ordered_cache_behavior

  origin {
    domain_name = aws_s3_bucket.this.bucket_regional_domain_name
    origin_id   = local.s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
    }
  }

  # origin_group 
  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      locations        = []
      restriction_type = "none"
    }
  }

  tags = {
    Name           = var.aws_cloudfront_origin_access_identity_comment
    BoundedContext = var.bounded_context
    Namespace      = var.namespace
    Environment    = var.environment
  }

  viewer_certificate {
    acm_certificate_arn            = ""
    cloudfront_default_certificate = true
    ssl_support_method             = ""
  }

  # web_acl_id
  retain_on_delete    = false
  wait_for_deployment = true
}