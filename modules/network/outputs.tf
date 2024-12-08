output "vpc_id" {
  description = "ID of the created VPC"
  value       = google_compute_network.main_vpc.id
}

output "vpc_name" {
  description = "Name of the created VPC"
  value       = google_compute_network.main_vpc.name
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = google_compute_subnetwork.public_subnet.id
}

output "public_subnet_name" {
  description = "Name of the public subnet"
  value       = google_compute_subnetwork.public_subnet.name
}

output "public_subnet_cidr" {
  description = "CIDR of the public subnet"
  value       = google_compute_subnetwork.public_subnet.ip_cidr_range
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = google_compute_subnetwork.private_subnet.id
}

output "private_subnet_name" {
  description = "Name of the private subnet"
  value       = google_compute_subnetwork.private_subnet.name
}

output "private_subnet_cidr" {
  description = "CIDR of the private subnet"
  value       = google_compute_subnetwork.private_subnet.ip_cidr_range
}
