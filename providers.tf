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

}

provider "aws" {
  region = "us-west-2" 
}

# Specify the required provider
provider "google" {
  project = "terraform-tasks-439510"  
  region  = var.gcp-region       
  credentials = file("terraform-tasks-439510-d1cae900bb5a.json")
}
