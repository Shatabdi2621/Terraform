# Root module outputs

output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.main.name
}

output "resource_group_id" {
  description = "ID of the resource group"
  value       = azurerm_resource_group.main.id
}

output "vnet_id" {
  description = "ID of the virtual network"
  value       = module.networking.vnet_id
}

output "subnet_ids" {
  description = "IDs of the subnets"
  value       = module.networking.subnet_ids
}

output "storage_account_name" {
  description = "Name of the storage account"
  value       = module.storage.storage_account_name
}

output "storage_account_primary_blob_endpoint" {
  description = "Primary blob endpoint for the storage account"
  value       = module.storage.storage_account_primary_blob_endpoint
}

output "vm_ids" {
  description = "IDs of the virtual machines"
  value       = module.compute.vm_ids
}

output "vm_public_ips" {
  description = "Public IPs of the virtual machines"
  value       = module.compute.vm_public_ips
}

output "environment" {
  description = "Current environment"
  value       = local.environment
}

output "workspace_info" {
  description = "Information about the current Terraform workspace"
  value       = "Currently using workspace: ${terraform.workspace}"
}