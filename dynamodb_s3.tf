terraform {
  backend "s3" {
    bucket = "tf-nk-state"
    key    = "terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "tflocktable"
  }
}
