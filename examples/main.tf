module "cloudfront" {
  source = "git::https://github.com/jrdalino/aws-cloudfront-terraform.git?ref=main"
  # General
  aws_region  = var.aws_region
  aws_account = var.aws_account
  aws_role    = var.aws_role

  # Tagging
  namespace       = var.namespace
  bounded_context = var.bounded_context
  environment     = var.environment

  # S3 Bucket
  aws_s3_bucket_bucket = var.aws_s3_bucket_bucket

  # CloudFront Origin Access Identity
  aws_cloudfront_origin_access_identity_comment = var.aws_cloudfront_origin_access_identity_comment
}