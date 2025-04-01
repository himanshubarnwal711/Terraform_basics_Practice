output "public_ip_address" {
    value = aws_instance.test.public_ip
}

output "EC2_id" {
    value = aws_instance.test.id
}