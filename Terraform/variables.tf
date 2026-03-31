variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
    type        = list(string)
    default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
    type        = list(string)
    default     = ["10.0.11.0/24", "10.0.12.0/24"]
}
variable "availability_zones" {
  description = "The availability zones for the subnets"
    type        = list(string)
    default     = ["us-east-1a", "us-east-1b"]
}