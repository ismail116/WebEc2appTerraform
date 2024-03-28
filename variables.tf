variable "aws_vpc" {
  #default = "10.0.0.0/16"
  type        = string
  description = "cidr of vpctest"
}

variable "aws_sub" {
  #default = "10.0.1.0/24"
  type        = string
  description = "cidr of subnetn"
}

variable "ec2" {
  type = string
}

variable "egress_route" {
  type = string
}