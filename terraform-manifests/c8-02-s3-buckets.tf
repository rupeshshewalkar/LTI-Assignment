# Create S3 Bucket Resource and this bucket will have access from EC2
resource "aws_s3_bucket" "s3_bucket" {
  bucket_prefix = "${var.bucket_prefix}-${var.environment}-"
  tags          = local.common_tags
  force_destroy = true
}
# ACL 
resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"
}

# Policy
resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      "${aws_s3_bucket.s3_bucket.arn}",
      "${aws_s3_bucket.s3_bucket.arn}/*",
    ]
  }
}
# Create S3 Bucket Resource and this bucket will not have access from EC2
resource "aws_s3_bucket" "s3_bucket_noec2access" {
  bucket_prefix = "${var.bucket_prefix}-${var.environment}-noec2-access-"
  tags          = local.common_tags
  force_destroy = true
}
# ACL 
resource "aws_s3_bucket_acl" "s3_bucket_noec2access_acl" {
  bucket = aws_s3_bucket.s3_bucket_noec2access.id
  acl    = "private"
}