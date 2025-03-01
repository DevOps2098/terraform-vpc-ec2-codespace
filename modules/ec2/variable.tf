variable "key_name" {
  default = "my-key-pair"
}

variable "vpc_security_group_ids" {
  description = "VPC Security Group IDs"
  type        = list(string)
  default     = ["0.0.0.0/0"]  # Allow all IPs (not recommended for production)
}

variable "public_subnet_id" {
  description = "Public Subnet ID"
  type        = string
  
}

variable "private_subnet_id" {
  description = "Private Subnet ID"
  type        = string
  
}
