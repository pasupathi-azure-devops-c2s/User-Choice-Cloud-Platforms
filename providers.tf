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

}

provider "aws" {
  region = var.aws-region 
  secret_key = data.azurerm_key_vault_secret.aws-access-key-secret
  access_key = data.azurerm_key_vault_secret.aws-access-key-id
}

# Specify the required provider
provider "google" {
  project = data.azurerm_key_vault_secret.google-project-name
  region  = var.gcp-region       
  #credentials = file(var.google-credential-file-url)
  credentials = file(data.azurerm_key_vault_secret.google-credential-file-url)
}
