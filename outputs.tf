output "key_name" {
  description = "The Key Vault Key name"
  value       = azurerm_key_vault_key.this.name
}

output "key_id" {
  value       = azurerm_key_vault_key.this.id
  description = "The Key Vault Key ID"
}
