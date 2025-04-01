provider "aws" {
    region = "ap-south-1"
}

module "ec2_instance" {
    source = "./modules/ec2_instances" 
    ami_value =  "ami-0e35ddab05955cf57"
    instance_type_value = "t2.micro"
    subnet_id = "subnet-00ca73fb0b4ceb383"
}