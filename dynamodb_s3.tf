resource "aws_s3_bucket" "tf-nk-state" {
  bucket = "${var.bucket_name}"
  acl    = "${var.acl_value}"

  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "tflocktable" {
  name             = "${var.dynaodb_name}"
  hash_key         = "TestTableHashKey"
  stream_enabled   = true

  attribute {
    name = "TestTableHashKey"
    type = "S"
  }
}
