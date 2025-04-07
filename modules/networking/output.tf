# Networking module - outputs.tf

output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_ids" {
  description = "IDs of the subnets"
  value       = azurerm_subnet.subnet.*.id
}

output "subnet_names" {
  description = "Names of the subnets"
  value       = azurerm_subnet.subnet.*.name
}

output "nsg_id" {
  description = "ID of the network security group"
  value       = azurerm_network_security_group.nsg.id
}