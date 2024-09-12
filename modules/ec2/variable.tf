variable "ami_id" {
    description = "AMI for deploying monitoring tools"
    type = string 
  
}

variable "instance_type" {
    description = "instance for deploying monitoring tools"
    type = string 
}

variable "key_name" {
    description = "Key name for deploying monitoring tools"
    type = string 
}

variable "public_subnet" {
  description = "Public Subnets for web server"
  type        = list(any)
}

variable "vpc_id" {
  description = "vpc_id"
  type        = string
  validation {
    condition     = length(var.vpc_id) > 4 && substr(var.vpc_id, 0, 4) == "vpc-"
    error_message = "VPC ID must bot be empty."
  }
}

