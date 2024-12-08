terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 6.12"
    }
  }
}

# Service Account Creation
resource "google_service_account" "terraform_sa" {
account_id   = "${var.environment}-terraform-${var.environment == "dev" ? "readonly" : "admin"}"
  display_name = "${title(var.environment)} Terraform ${var.environment == "dev" ? "Read-Only" : "Admin"} Service Account"
  project      = var.project_id
}

# Project-level IAM Roles for Service Account
resource "google_project_iam_member" "sa_roles" {
  project = var.project_id
  count  = length(var.service_account_roles)
  role   = var.service_account_roles[count.index]
  member = "serviceAccount:${google_service_account.terraform_sa.email}"
}

# Workload Identity Pool
resource "google_iam_workload_identity_pool" "github_pool" {
  workload_identity_pool_id = "${var.environment}-github-actions-pool"
  display_name              = "${title(var.environment)} GitHub WIF Pool"
  description               = "Workload Identity Pool for ${title(var.environment)} GitHub Actions"
  project                   = var.project_id
}

# Workload Identity Pool Provider
resource "google_iam_workload_identity_pool_provider" "github_provider" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "${var.environment}-github-provider"
  display_name                       = "${title(var.environment)} GitHub Provider"
  
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
  }
  
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
  attribute_condition = "assertion.repository==\"${var.github_owner}/${var.github_repo}\""
  project                   = var.project_id
}

# Workload Identity Pool IAM Binding
resource "google_service_account_iam_member" "workload_identity_binding" {
  service_account_id = google_service_account.terraform_sa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_pool.name}/attribute.repository/${var.github_owner}/${var.github_repo}"
}