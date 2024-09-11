variable "vpc_cidr" {
    description = "VPC for deploying monitoring tools"
    type = string 
}
variable "vpc_tags" {
  description = "VPC for monitoring tools"
  type        = map(any)
}

variable "az" {
  description = "availability zone"
  type        = list(string)
}

variable "public_subnet" {
  description = "public subnet"
  type        = list(string)

}

variable "IG_tags" {
    description = "IG for deploying monitoring tools"
    type = map(any)
}