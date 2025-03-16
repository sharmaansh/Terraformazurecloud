# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" # Optional but recommended in production
    }  

    random = {
      source = "hashicorp/random"
      version = ">= 3.0"
    }

  }
   backend "azurerm" {
    resource_group_name  = "terrastate"
    storage_account_name = "terrastatesa"
    container_name      = "tfstate"
    key                 = "prod.terraform.tfstate"
  } 
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
    subscription_id = "###############################"
  features {}
}

# Random String Resource
resource "random_string" "myrandom" {
  length = 6
  upper = false 
  special = false
  numeric = false 
}

