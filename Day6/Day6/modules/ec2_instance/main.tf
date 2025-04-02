provider "aws" {
    region = "ap-south-1"
}

variable "ami" {
    description = "AMI value for ec2 ubuntu"  
}

variable "instance_type" {
    description = "This is type of EC2 instance"
}

resource "aws_instance" "testdemo" {
    ami = var.ami
    instance_type = var.instance_type
}