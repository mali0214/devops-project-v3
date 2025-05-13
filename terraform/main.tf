provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./vpc"

  vpc_cidr_block        = var.vpc_cidr_block
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
}

module "security_group" {
  source = "./security_group"

  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./ec2"

  ami_id                 = "ami-0c2b8ca1dad447f8a" # Ubuntu 22.04 in us-east-1
  instance_type          = "t2.micro"
  subnet_id              = module.vpc.public_subnet_ids[0]
  vpc_security_group_ids = [module.security_group.security_group_id]  # Update this line
  key_name               = "devops-access-key"
  iam_instance_profile   = module.iam.instance_profile_name
}

resource "random_id" "bucket_id" {
  byte_length = 4
}


module "s3" {
  source         = "./s3"
  bucket_name    = "devops-project-artifacts-${random_id.bucket_id.hex}"
  enable_versioning = true
}

module "iam" {
  source = "./iam"
}

module "rds" {
  source = "./rds"

  subnet_ids         = module.vpc.private_subnet_ids
  security_group_id  = module.security_group.security_group_id
  db_name            = "devopsdb"
  db_username        = "postgres"
  db_password        = "yourSecurePassword123!"  # You can also use secrets manager later for this
}

