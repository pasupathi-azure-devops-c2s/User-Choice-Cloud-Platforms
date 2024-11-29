terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"  # Adjust this version as needed
    }

    aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
    }

     google = {
      source  = "hashicorp/google"
      version = "~> 3.5"
    }
  }

  required_version = ">= 1.0"
}


provider "azurerm" {
  features {}
  subscription_id = data.azurerm_key_vault_secret.subscription-id
  tenant_id = data.azurerm_key_vault_secret.tenant-id
  client_id = data.azurerm_key_vault_secret.client-id
  client_secret = data.azurerm_key_vault_secret.client-secret
  
  #subscription_id = var.azure-subscription-id
  #tenant_id = var.azure-tenant-id
  #client_id = var.azure-client-id
  #client_secret = var.azure-client-secret-id
}

provider "aws" {
  region = var.aws-region 
  secret_key = data.azurerm_key_vault_secret.aws-access-key-secret
  access_key = data.azurerm_key_vault_secret.aws-access-key-id

  #secret_key = var.aws-secret-access-key
  #access_key = var.aws-access-key-id
}

# Specify the required provider
provider "google" {
  project = data.azurerm_key_vault_secret.google-project-name
  region  = var.gcp-region       
  credentials = file(data.azurerm_key_vault_secret.google-credential-file-url)
  
  #project = var.google-project-id
  #credentials = file(var.google-credential-file-url)
  
}
