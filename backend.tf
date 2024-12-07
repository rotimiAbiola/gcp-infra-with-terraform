resource "google_storage_bucket" "bucket_for_state" {
  name                        = "440815-state-bucket"
  location                    = "US"
  uniform_bucket_level_access = true
  project                     = var.project_id
  force_destroy = true
}

terraform {
  backend "gcs" {
    bucket = "440815-state-bucket"
    prefix = "terraform/state"
  }
}
