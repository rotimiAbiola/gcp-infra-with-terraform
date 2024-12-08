variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
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