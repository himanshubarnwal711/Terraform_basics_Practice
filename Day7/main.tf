provider "aws" {
    region = "ap-south-1"
}

provider "vault" {
    address = "http://43.204.97.102:8200"
    skip_child_token = true

    auth_login {
        path = "auth/approle/login"

        parameters = {
            role_id = "11582f1c-9115-b42f-e62f-1a9995d3907e"
            secret_id = "af5044c4-5f7a-d6d0-3965-1c7774a0b766"
        }
    }
}

data "vault_kv_secret_v2" "example" {
    mount = "himKV" // change it according to your mount
    name  = "test-secret" // change it according to your secret
}

data "vault_kv_secret_v2" "bucket" {
    mount = "himKV" // change it according to your mount
    name  = "bucket_name" // change it according to your secret
}

resource "aws_instance" "my_instance" {
    ami = "ami-0e35ddab05955cf57"
    instance_type = "t2.micro"

    tags = {
        Name = "vaultDemoTest"
        Secret = data.vault_kv_secret_v2.example.data["username"]
    }
}

resource "aws_s3_bucket" "bucket-test" {
    bucket = data.vault_kv_secret_v2.bucket.data["bucket"]
    tags = {
        Name        = "MyS3Bucket"
        Environment = "Dev"
        Username = data.vault_kv_secret_v2.example.data["username"]
        Password = data.vault_kv_secret_v2.example.data["password"]
    }
}