/*
data "azurerm_key_vault" "key-vault-access" {
    resource_group_name = var.azure-key-vault-resource-group
    name= var.key-vault
  
}

data "azurerm_key_vault_secret" "subscription-id" {
    key_vault_id = data.azurerm_key_vault.key-vault-access.id
    name = var.azure-subscription-id
  
}

data "azurerm_key_vault_secret" "tenant-id" {
    key_vault_id = data.azurerm_key_vault.key-vault-access.id
    name = var.azure-tenant-id
  
}

data "azurerm_key_vault_secret" "client-id" {
    key_vault_id = data.azurerm_key_vault.key-vault-access.id
    name = var.azure-client-id
  
}


data "azurerm_key_vault_secret" "client-secret" {
    key_vault_id = data.azurerm_key_vault.key-vault-access.id
    name = var.azure-client-secret-id
  
}


data "azurerm_key_vault_secret" "aws-access-key-id" {
    key_vault_id = data.azurerm_key_vault.key-vault-access.id
    name = var.aws-access-key-id
  
}

data "azurerm_key_vault_secret" "aws-access-key-secret" {
    key_vault_id = data.azurerm_key_vault.key-vault-access.id
    name = var.aws-secret-access-key
  
}


data "azurerm_key_vault_secret" "google-project-name" {
    key_vault_id = data.azurerm_key_vault.key-vault-access.id
    name = var.google-project-id
}

data "azurerm_key_vault_secret" "google-credential-file-url" {
    key_vault_id = data.azurerm_key_vault.key-vault-access.id
    name = var.google-credential-file-url
}

*/