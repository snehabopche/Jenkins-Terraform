terraform {
  backend "s3" {
    bucket = "tf-nk-state"
    key    = "terraform.tfstate"
    region = "ca-central-1"
    dynamodb_table = "dynamodblocktable"
  }
}
