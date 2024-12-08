output "dev_service_account_email" {
  value = module.dev_service_account.service_account_email
}

output "prod_service_account_email" {
  value = module.prod_service_account.service_account_email
}

output "dev_workload_identity_provider" {
  value = module.dev_service_account.workload_identity_provider
}

output "prod_workload_identity_provider" {
  value = module.prod_service_account.workload_identity_provider
}

output "vpc_name" {
  description = "Name of the created VPC"
  value       = module.network.vpc_name
}

output "public_subnet_name" {
  description = "Name of the public subnet"
  value       = module.network.public_subnet_name
}

output "private_subnet_name" {
  description = "Name of the private subnet"
  value       = module.network.private_subnet_name
}