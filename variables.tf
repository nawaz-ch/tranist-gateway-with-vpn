variable aws_region {
  type=string
  default="us-east-1"
  description="AWS region to deploy"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "192.168.0.0/16"
}


variable "vpc_cidr_2" {
  description = "CIDR block for the VPC-2"
  type        = string
  default     = "10.0.0.0/16"
}


variable "vpc_cidr_3" {
  description = "CIDR block for the VPC-3"
  type        = string
  default     = "10.1.0.0/16"
}

