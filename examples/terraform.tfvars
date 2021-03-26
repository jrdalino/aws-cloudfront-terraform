# General
aws_region  = "ap-southeast-1"
aws_account = "623552185285" # AWS account where resource will be created
aws_role    = "OrganizationAccountAccessRole"

# Tagging
namespace       = "bbsdm"
bounded_context = "web"
environment     = "production"

# S3 Bucket
aws_s3_bucket_bucket = "623552185285-bbdsm-web"

# CloudFront Origin Access Identity
aws_cloudfront_origin_access_identity_comment = "bbdsm-web"