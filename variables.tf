variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  default = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "public_subnets" {
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_subnets" {
  default = ["10.0.3.0/24","10.0.4.0/24"]
}
variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default  = "my-key-pair"
}
variable "vpc_security_group_ids" {
  description = "VPC Security Group IDs"
  type        = list(string)
  default     = ["0.0.0.0/0"]  # Allow all IPs (not recommended for production)
}
