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
  #subscription_id = data.azurerm_key_vault_secret.subscription_id.value
  #tenant_id       = data.azurerm_key_vault_secret.tenant_id.value
  #client_id       = data.azurerm_key_vault_secret.client_id.value
  #client_secret   = data.azurerm_key_vault_secret.client_secret.value
}

provider "aws" {
  region     = var.aws-region
  secret_key = data.azurerm_key_vault_secret.aws_secret_access_key.value
  access_key = data.azurerm_key_vault_secret.aws_access_key_id.value
}

provider "google" {
  project     = data.azurerm_key_vault_secret.google_project_id.value
  region      = var.gcp-region
  credentials = file("c:\\Users\\PasupathiKumarS\\Downloads\\terraform-tasks-439510-d1cae900bb5a.json")
}
