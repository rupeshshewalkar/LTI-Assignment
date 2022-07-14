# AWS S3 Terraform Variables
variable "bucket_prefix" {
  description = "Prefix of the S3 bucket. To create unique bucket name"
  type        = string
}