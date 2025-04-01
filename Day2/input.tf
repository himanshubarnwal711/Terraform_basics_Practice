# These are Input variables defined to put it in the above resource to be launched.
variable "instance_type" {
    description = "EC2 instance type"
    type = string
    default = "t2.micro"
}

variable "key_name_ap-south-1" {
    description = "Key Pair for ap-south-1 EC2"
    type = string
    default = "test"
}

variable "key_name_us-east-1" {
    description = "Key Pair for us-east-1 EC2"
    type = string
    default = "himtest"
}


variable "ami_ap-south-1" {
    description = "AMI ID for EC2 in ap-south-1"
    type = string
    default = "ami-0e35ddab05955cf57"
}

variable "ami_us-east-1" {
    description = "AMI ID for EC2 in us-east-1"
    type = string
    default = "ami-084568db4383264d4"
}

variable "subnet_id_ap-south-1" {
    description = "Subnet ID of ap-south-1"
    type = string
    default = "subnet-0fc5250a1d416d88b"
  
}

variable "subnet_id_us-east-1" {
    description = "Subnet ID of us-east-1"
    type = string
    default = "subnet-0adeb2651cbc34518"
  
}