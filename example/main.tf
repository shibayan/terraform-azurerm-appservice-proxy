provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = "~> 3.0"
  }
}

resource "azurerm_resource_group" "default" {
  name     = "rg-proxy-module"
  location = "westus2"
}

resource "azurerm_service_plan" "default" {
  name                = "plan-proxy-module"
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location

  os_type  = "Windows"
  sku_name = "P1v2"
}

module "appservice_proxy" {
  source  = "shibayan/appservice-proxy/azurerm"
  version = "~> 2.0"

  web_app_name        = "app-proxy-module"
  app_service_plan_id = azurerm_service_plan.default.id
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
}