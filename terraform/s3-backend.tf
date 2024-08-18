# Root main.tf
terraform {
  backend "s3" {
    bucket  = "dml-terraform-clsuter"
    key     = "environment"
    region  = "us-east-1"
    encrypt = true
    #    dynamodb_table = "ndcc-terraform-state-lock-dynamo"
  }
}