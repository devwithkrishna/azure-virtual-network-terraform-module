output "vnet_resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "Azure resource group name"
}

output "vnet_location" {
  description = "Azure Location"
  value       = azurerm_resource_group.rg.location
}

output "vnet_environment" {
  description = "Azure Vnet environment tag value"
  value       = azurerm_virtual_network.vnet.tags.environment
}

output "vnet_name" {
  description = "Azure Virtual network name"
  value       = azurerm_virtual_network.vnet.name
}

output "vnet_address_range" {
  description = "Azure Vnet address range"
  value       = azurerm_virtual_network.vnet.address_space
}

output "current_subscription_display_name" {
  description = "Subscription name"
  value       = data.azurerm_subscription.current.display_name
}

output "current_subscription_id" {
  description = "Subscription id"
  value       = data.azurerm_subscription.current.id
}