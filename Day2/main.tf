resource "aws_instance" "test" {
  ami = var.ami_ap-south-1
  instance_type = var.instance_type
  key_name      = var.key_name_ap-south-1  # Assigning the key pair
  subnet_id     = var.subnet_id_ap-south-1
  provider = aws.ap-south-1

  tags = {
    Name = "webapp-frontend"  # Setting the instance name
  }
}

resource "aws_instance" "test2" {
  ami = var.ami_us-east-1
  instance_type = var.instance_type
  key_name      = var.key_name_us-east-1  # Assigning the key pair
  subnet_id     = var.subnet_id_us-east-1
  provider = aws.us-east-1

  tags = {
    Name = "webapp-frontend"  # Setting the instance name
  }
}
