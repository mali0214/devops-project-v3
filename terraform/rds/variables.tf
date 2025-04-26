variable "subnet_ids" {
  description = "List of private subnet IDs for the RDS DB subnet group"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name of the initial database"
  type        = string
  default     = "devopsdb"
}

variable "db_username" {
  description = "Username for the RDS database"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Password for the RDS database"
  type        = string
  sensitive   = true
}
