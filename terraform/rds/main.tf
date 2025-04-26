resource "aws_db_subnet_group" "postgres_subnet_group" {
  name       = "postgres-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "PostgresSubnetGroup"
  }
}

resource "aws_db_instance" "postgres" {
  identifier              = "devops-postgres-db"
  allocated_storage       = 20
  engine                  = "postgres"
  engine_version          = "14"
  instance_class          = "db.t3.micro"
  db_name                    = var.db_name
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.postgres_subnet_group.name
  vpc_security_group_ids  = [var.security_group_id]
  skip_final_snapshot     = true
  publicly_accessible     = false
  multi_az                = false

  tags = {
    Name = "DevOpsPostgresDB"
  }
}
