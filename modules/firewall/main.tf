terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.12"
    }
  }
}

resource "google_compute_firewall" "public_subnet_allow_ssh_http_https" {
  name    = "public-subnet-allow-ssh-http-https"
  network = var.vpc_id
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["public-subnet-allow"]
}

resource "google_compute_firewall" "private_subnet_internal_access" {
  name    = "private-subnet-internal-access"
  network = var.vpc_id
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = [
    var.public_subnet_cidr,
    var.private_subnet_cidr
  ]
  target_tags = ["private-subnet-allow"]
}

resource "google_compute_firewall" "vpc_deny_all" {
  name    = "vpc-deny-all"
  network = var.vpc_id
  project = var.project_id

  deny {
    protocol = "all"
  }

  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
}