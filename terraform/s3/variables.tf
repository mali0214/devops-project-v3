variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "enable_versioning" {
  description = "Whether to enable versioning for the bucket"
  type        = bool
  default     = true
}
