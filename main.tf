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

module "network" {
  source = "./modules/network"

  project_id          = var.project_id
  region              = var.region
  vpc_name            = var.vpc_name
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "firewall" {
  source = "./modules/firewall"

  project_id          = var.project_id
  vpc_id              = module.network.vpc_id
  public_subnet_cidr  = module.network.public_subnet_cidr
  private_subnet_cidr = module.network.private_subnet_cidr
}

module "nat" {
  source = "./modules/nat"

  project_id        = var.project_id
  region            = var.region
  vpc_id            = module.network.vpc_id
  private_subnet_id = module.network.private_subnet_id
}