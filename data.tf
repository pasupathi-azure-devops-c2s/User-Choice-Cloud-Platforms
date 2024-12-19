data "azurerm_key_vault" "key_vault_access" {
  name                = "Pasupathikumar"
  resource_group_name = "Cloud-Secrets-RG"
}

data "azurerm_key_vault_secret" "subscription_id" {
  name         = "Azure-Subscription-ID"
  key_vault_id = data.azurerm_key_vault.key_vault_access.id
}

data "azurerm_key_vault_secret" "tenant_id" {
  name         = "Azure-Tenant-ID"
  key_vault_id = data.azurerm_key_vault.key_vault_access.id
  depends_on   = [data.azurerm_key_vault_secret.subscription_id]
}

data "azurerm_key_vault_secret" "client_id" {
  name         = "Azure-Client-ID"
  key_vault_id = data.azurerm_key_vault.key_vault_access.id
  depends_on   = [data.azurerm_key_vault_secret.tenant_id]
}

data "azurerm_key_vault_secret" "client_secret" {
  name         = "Azure-Client-Secret-Value"
  key_vault_id = data.azurerm_key_vault.key_vault_access.id
  depends_on   = [data.azurerm_key_vault_secret.client_id]
}

data "azurerm_key_vault_secret" "aws_access_key_id" {
  name         = "AWS-Access-Key-ID"
  key_vault_id = data.azurerm_key_vault.key_vault_access.id
  depends_on   = [data.azurerm_key_vault_secret.client_secret]
}

data "azurerm_key_vault_secret" "aws_secret_access_key" {
  name         = "AWS-Secret-Access-Key"
  key_vault_id = data.azurerm_key_vault.key_vault_access.id
  depends_on   = [data.azurerm_key_vault_secret.aws_access_key_id]
}

data "azurerm_key_vault_secret" "google_project_id" {
  name         = "Google-Project-ID"
  key_vault_id = data.azurerm_key_vault.key_vault_access.id
  depends_on   = [data.azurerm_key_vault_secret.aws_secret_access_key]
}

data "azurerm_key_vault_secret" "vm-admin-password"{
  name = ""
  key_vault_id = data.azurerm_key_vault.key_vault_access.id
  depends_on = [ data.azurerm_key_vault_secret.google_project_id ]
}