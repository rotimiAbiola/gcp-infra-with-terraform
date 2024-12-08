variable "project_id" {
  description = "GCP Project ID"
  type        = string
  sensitive = true
}

variable "github_owner" {
  description = "GitHub Repository Owner"
  type        = string
}

variable "github_repo" {
  description = "GitHub Repository Name"
  type        = string
}

variable "environment" {
  description = "Environment (dev/prod)"
  type        = string
  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be either 'dev' or 'prod'."
  }
}

variable "service_account_roles" {
  description = "List of IAM roles for the service account"
  type        = list(string)
  default     = []
}
