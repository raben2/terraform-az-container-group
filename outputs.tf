output "id" {
  description = "id of the container group"
  value       = azurerm_container_group.main.id
}

output "ip" {
  description = "ip address of the container group"
  value       = azurerm_container_group.main.ip_address
}

output "fqdn" {
  description = "url of the container group"
  value       = azurerm_container_group.main.fqdn
}
