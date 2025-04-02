terraform {
  backend "s3" {
    bucket = "veerappan711-bucket"
    key    = "himtest/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "use_lockfile"
  }
}
