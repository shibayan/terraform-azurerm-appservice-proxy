resource "azurerm_windows_web_app" "webapp" {
  name                = var.web_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  client_affinity_enabled = false
  https_only              = true

  site_config {
    application_stack {
      dotnet_version = "v8.0"
    }

    ftps_state              = "Disabled"
    minimum_tls_version     = "1.2"
    scm_minimum_tls_version = "1.2"
  }
}

resource "azurerm_resource_group_template_deployment" "siteextension" {
  name                = "siteextension-deploy"
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"

  depends_on = [
    azurerm_windows_web_app.webapp
  ]

  parameters_content = jsonencode({
    "webAppName" = {
      value = var.web_app_name
    }
  })

  template_content = <<TEMPLATE
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "webAppName": {
      "type": "string"
    }
  },
  "resources": [
    {
      "type": "Microsoft.Web/sites/siteextensions",
      "apiVersion": "2022-09-01",
      "name": "[format('{0}/{1}', variables('webAppName'), 'AppServiceProxy.SiteExtension')]"
    }
  ]
}
TEMPLATE
}