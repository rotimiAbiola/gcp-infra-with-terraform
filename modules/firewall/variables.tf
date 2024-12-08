variable "project_id" {
  description = "GCP Project ID"
  type        = string
  sensitive   = true
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR range for public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR range for private subnet"
  type        = string
}