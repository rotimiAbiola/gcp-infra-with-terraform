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