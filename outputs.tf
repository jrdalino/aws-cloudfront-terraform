# S3 Bucket for Website Hosting
output "aws_s3_bucket_id" {
  value       = aws_s3_bucket.this.id
  description = "The name of the bucket."
}

output "aws_s3_bucket_arn" {
  value       = aws_s3_bucket.this.arn
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
}

output "aws_s3_bucket_bucket_domain_name" {
  value       = aws_s3_bucket.this.bucket_domain_name
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
}

output "aws_s3_bucket_bucket_regional_domain_name" {
  value       = aws_s3_bucket.this.bucket_regional_domain_name
  description = "The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL."
}

output "aws_s3_bucket_hosted_zone_id" {
  value       = aws_s3_bucket.this.hosted_zone_id
  description = "The Route 53 Hosted Zone ID for this bucket's region."
}

output "aws_s3_bucket_region" {
  value       = aws_s3_bucket.this.region
  description = "The AWS region this bucket resides in."
}

output "aws_s3_bucket_website_endpoint" {
  value       = aws_s3_bucket.this.website_endpoint
  description = "The website endpoint, if the bucket is configured with a website. If not, this will be an empty string.s"
}

output "aws_s3_bucket_website_domain" {
  value       = aws_s3_bucket.this.website_domain
  description = "The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records."
}

# CloudFront Origin Access Identity
output "aws_cloudfront_origin_access_identity_id" {
  value       = aws_cloudfront_origin_access_identity.this.id
  description = "The identifier for the distribution. For example: EDFDVBD632BHDS5."
}

output "aws_cloudfront_origin_access_identity_caller_reference" {
  value       = aws_cloudfront_origin_access_identity.this.caller_reference
  description = "Internal value used by CloudFront to allow future updates to the origin access identity."
}

output "aws_cloudfront_origin_access_identity_cloudfront_access_identity_path" {
  value       = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
  description = "A shortcut to the full path for the origin access identity to use in CloudFront, see below."
}

output "aws_cloudfront_origin_access_identity_etag" {
  value       = aws_cloudfront_origin_access_identity.this.etag
  description = "The current version of the origin access identity's information. For example: E2QWRUHAPOMQZL."
}

output "aws_cloudfront_origin_access_identity_iam_arn" {
  value       = aws_cloudfront_origin_access_identity.this.iam_arn
  description = "A pre-generated ARN for use in S3 bucket policies (see below). Example: arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E2QWRUHAPOMQZL."
}

output "aws_cloudfront_origin_access_identity_s3_canonical_user_id" {
  value       = aws_cloudfront_origin_access_identity.this.s3_canonical_user_id
  description = "The Amazon S3 canonical user ID for the origin access identity, which you use when giving the origin access identity read permission to an object in Amazon S3."
}

# CloudFront Distribution
output "aws_cloudfront_distribution_id" {
  value       = aws_cloudfront_distribution.this.id
  description = "The identifier for the distribution. For example: EDFDVBD632BHDS5."
}

output "aws_cloudfront_distribution_arn" {
  value       = aws_cloudfront_distribution.this.arn
  description = "The ARN (Amazon Resource Name) for the distribution. For example: arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5, where 123456789012 is your AWS account ID."
}

output "aws_cloudfront_distribution_status" {
  value       = aws_cloudfront_distribution.this.status
  description = "The current status of the distribution. Deployed if the distribution's information is fully propagated throughout the Amazon CloudFront system."
}

output "aws_cloudfront_distribution_domain_name" {
  value       = aws_cloudfront_distribution.this.domain_name
  description = "The domain name corresponding to the distribution. For example: d604721fxaaqy9.cloudfront.net."
}

output "aws_cloudfront_distribution_last_modified_time" {
  value       = aws_cloudfront_distribution.this.last_modified_time
  description = "The date and time the distribution was last modified."
}

output "aws_cloudfront_distribution_in_progress_validation_batches" {
  value       = aws_cloudfront_distribution.this.in_progress_validation_batches
  description = "The number of invalidation batches currently in progress."
}

output "aws_cloudfront_distribution_etag" {
  value       = aws_cloudfront_distribution.this.etag
  description = "The current version of the distribution's information. For example: E2QWRUHAPOMQZL."
}

output "aws_cloudfront_distribution_hosted_zone_id" {
  value       = aws_cloudfront_distribution.this.hosted_zone_id
  description = "The CloudFront Route 53 zone ID that can be used to route an Alias Resource Record Set to. This attribute is simply an alias for the zone ID Z2FDTNDATAQYW2."
}