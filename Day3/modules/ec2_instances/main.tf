resource "aws_instance" "test" {
  ami = var.ami_value
  instance_type = var.instance_type_value
  subnet_id = var.subnet_id
  provider = aws.ap-south-1
  tags = {
    Name = "demo-test"  # Setting the instance name
  }
}