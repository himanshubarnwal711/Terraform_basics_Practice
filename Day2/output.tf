

# These are output variables to get the launched resources information after terraform apply command.

output "instance_id" {
  description = "EC2 ap-south-1 instance ID"
  value = aws_instance.test.id
}

output "public_ip_ap-south-1_EC2" {
  description = "Public IP address of the EC2 instance hosted in ap-south-1"
  value = aws_instance.test.public_ip
}


output "instance_id2" {
  description = "EC2 us-east-1 instance ID"
  value = aws_instance.test2.id
}

output "public_ip_us-east-1_EC2" {
  description = "Public IP address of the EC2 instance hosted in us-east-1"
  value = aws_instance.test2.public_ip
}

