provider "aws" {
    region = var.aws_region
    
}
module "s3"
  source = "dynamodb_s3"
  bucket_name = "tk-nk-state"

terraform {
  backend "s3" {
    bucket = "tf-nk-state"
    key    = "terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "tflocktable"
  }
}

resource "aws_instance" "ec-2" {
  ami           = var.ec2_ami
  instance_type = var.instance_type
  key_name = var.ec2_keypair
  count = var.ec2_count
  vpc_security_group_ids = ["${aws_security_group.ec2-sg.id}"]
  subnet_id = element(var.subnets, count.index)

  tags = {
    Name = "${var.environment}.${var.product}-${count.index+1}"
  }
}
