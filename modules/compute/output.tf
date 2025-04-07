# Compute module - outputs.tf

output "public_ip_addresses" {
  description = "Public IP addresses of the virtual machines"
  value       = [for ip in azurerm_public_ip.public_ip : ip.ip_address]
}

output "network_interface_ids" {
  description = "IDs of the network interfaces"
  value       = [for nic in azurerm_network_interface.nic : nic.id]
}

output "vm_names" {
  description = "Names of the virtual machines"
  value       = [for vm in azurerm_linux_virtual_machine.vm : vm.name]
}

output "vm_ids" {
  description = "IDs of the virtual machines"
  value       = [for vm in azurerm_linux_virtual_machine.vm : vm.id]
}

output "admin_password" {
  description = "Admin password used for the virtual machines (sensitive)"
  value       = local.vm_password
  sensitive   = true
}
