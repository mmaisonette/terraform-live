provider "aws" {
    region = "sa-east-1"
}

# Create a database resource in RDS.
# The settings in this code configure RDS to run MySQL with 10 GB of storage on a db.t2.micro instance, which has one virtual CPU, 1 GB of memory, and is part of the AWS free tier.
resource "aws_db_instance" "example" {
    identifier_prefix               = "terraform-up-and-running"
    engine                          = "mysql"
    allocated_storage               = 10
    instance_class                  = "db.t2.micro"
    db_name                         = var.db_name
    username                        = var.db_username
    password                        = var.db_password

    skip_final_snapshot             = true
    backup_retention_period         = 0
    apply_immediately               = true
}

terraform {
    backend "s3" {
        bucket         = "terraform-up-and-running-state-manuallabs"
        key            = "stage/data-stores/mysql/terraform.tfstate"
        region         = "sa-east-1"
        dynamodb_table = "terraform-up-and-running-locks"
        encrypt        = true
    }
}
