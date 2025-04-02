provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "test" {
  instance_type = "t2.micro"
  ami           = "ami-0e35ddab05955cf57"
  subnet_id     = "subnet-00ca73fb0b4ceb383"
}

# This S3 bucket is used to store the Terraform state file.
resource "aws_s3_bucket" "s3_storage" {
    bucket = "veerappan711-bucket"
    force_destroy = true  # Add this line to allow automatic deletion
    tags = {
        Name        = "TerraformStateBucket"
        Environment = "Dev"
    }
}

# DynamoDB table for Terraform state locking.
resource "aws_dynamodb_table" "use_lockfile" {
  name         = "use_lockfile"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
