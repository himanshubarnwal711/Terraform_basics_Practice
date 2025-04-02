provider "aws" {
    region = "ap-south-1"
}

variable "ami" {
    description = "AMI Ubuntu AMI ID"
}

variable "instance_type" {
    description = "Instance type of EC2"
    type        = map(string)
    default     = {
        "dev"   = "t2.micro",
        "stage" = "t2.nano",
        "prod"  = "t2.medium"
    }
}

module "ec2_instance" {
    source        = "./modules/ec2_instance"
    ami           = var.ami
    instance_type = lookup(var.instance_type, terraform.workspace)
}
