terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "2426555f-aab3-4092-acd0-0a14fea0df56"
  client_id       = "129ad791-90ba-42e6-8dab-dd61bc0f3ba1"
  client_secret   = "i5Z8Q~exkJBXiqX6.2o~HOXMx_2zjwHQ4qZW4cUo"
  tenant_id       = "c4360fae-7674-41c8-a49c-043075df9d4c"
  features {}
}

locals {
  resource_group="store-res-grp"
  location="East US"
}

resource "azurerm_resource_group" "store_res_grp"{
  name=local.resource_group
  location=local.location
}

 resource "azurerm_storage_account" "blob_store_account" {
   name                     = "newblobstorterra01097"
   resource_group_name      = "store-res-grp"
   location                 = "East US"
   account_tier             = "Standard"
   account_replication_type = "LRS"
#    allow_blob_public_access = true
 }

 resource "azurerm_storage_container" "blob_data" {
  name                  = "blob-data"
  storage_account_name  = "newblobstorterra01097"
  container_access_type = "private"
}

resource "azurerm_storage_blob" "new" {
  name                   = "new.txt"
  storage_account_name   = "newblobstorterra01097"
  storage_container_name = "blob-data"
  type                   = "Block"
  source                 = "new.txt"
}