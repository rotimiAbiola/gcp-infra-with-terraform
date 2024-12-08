terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.12"
    }
  }
}

resource "google_compute_router" "nat_router" {
  name    = "nat-router"
  region  = var.region
  network = var.vpc_id
  project = var.project_id
}

resource "google_compute_router_nat" "private_nat" {
  name                               = "private-subnet-nat"
  router                             = google_compute_router.nat_router.name
  project                            = var.project_id
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = var.private_subnet_id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}