# Root main.tf
terraform {
  backend "s3" {
    bucket  = "dml-terraform-cluster"
    key     = "dev"
    region  = "us-east-1"
    encrypt = true
    # For State Locking
    # dynamodb_table = "dml-terraform-state-table"
  }
}