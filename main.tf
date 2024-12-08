# Dev Service Account Module
module "dev_service_account" {
  source = "./modules/service-accounts"

  project_id   = var.project_id
  environment  = "dev"
  github_owner = var.github_owner
  github_repo  = var.github_repo

  service_account_roles = [
    "roles/viewer",
    "roles/compute.viewer",
    "roles/networkmanagement.viewer",
    "roles/storage.objectViewer",
    "roles/storage.admin",
    "roles/storage.objectAdmin"
  ]
}

# Prod Service Account Module
module "prod_service_account" {
  source = "./modules/service-accounts"

  project_id   = var.project_id
  environment  = "prod"
  github_owner = var.github_owner
  github_repo  = var.github_repo

  service_account_roles = [
    "roles/compute.admin",
    "roles/storage.admin",
    "roles/iam.serviceAccountUser",
    "roles/compute.networkAdmin",
  ]
}