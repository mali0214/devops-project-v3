variable "ec2_role_name" {
  description = "Name of the IAM role for EC2"
  type        = string
  default     = "ec2-s3-access-role"
}

variable "policy_name" {
  description = "Name of the IAM policy to attach to the EC2 role"
  type        = string
  default     = "EC2S3ReadWritePolicy"
}

variable "instance_profile_name" {
  description = "Name of the IAM instance profile to associate with EC2"
  type        = string
  default     = "ec2-instance-profile"
}
