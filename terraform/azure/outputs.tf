output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.main.name
}

output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.main.id
}

output "master_public_ip" {
  description = "Public IP of the master node"
  value       = azurerm_public_ip.master.ip_address
}

output "master_private_ip" {
  description = "Private IP of the master node"
  value       = azurerm_network_interface.master.private_ip_address
}

output "worker_public_ips" {
  description = "Public IPs of worker nodes"
  value       = azurerm_public_ip.worker[*].ip_address
}

output "worker_private_ips" {
  description = "Private IPs of worker nodes"
  value       = azurerm_network_interface.worker[*].private_ip_address
}

output "master_vm_id" {
  description = "ID of master VM"
  value       = azurerm_linux_virtual_machine.master.id
}

output "worker_vm_ids" {
  description = "IDs of worker VMs"
  value       = azurerm_linux_virtual_machine.worker[*].id
}
