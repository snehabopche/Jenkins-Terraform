terraform {
  backend "s3" {
    bucket = "tf-nk-state"
    key    = "terraform.tfstate"
    region = var.aws_region
    dynamodb_table = "dynamodblocktable"
  }
}
