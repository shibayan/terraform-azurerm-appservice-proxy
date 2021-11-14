resource "azurerm_app_service" "webapp" {
  name                = var.web_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  app_service_plan_id = var.app_service_plan_id

  client_affinity_enabled = false
  https_only              = true

  site_config {
    dotnet_framework_version = "v6.0"
  }
}
