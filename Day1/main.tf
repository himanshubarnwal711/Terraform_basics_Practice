provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "test" {
  ami = "ami-0e35ddab05955cf57"
  instance_type = "t2.micro"
  key_name      = "test"  # Assigning the key pair
  subnet_id     = "subnet-0fc5250a1d416d88b"
  provider = aws.ap-south-1

  tags = {
    Name = "webapp-frontend"  # Setting the instance name
  }
}
