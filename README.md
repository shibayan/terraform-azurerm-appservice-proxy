# App Service Proxy Terraform module

[![Validate](https://github.com/shibayan/terraform-azurerm-appservice-proxy/actions/workflows/validate.yml/badge.svg)](https://github.com/shibayan/terraform-azurerm-appservice-proxy/actions/workflows/validate.yml)
[![Release](https://img.shields.io/github/release/shibayan/terraform-azurerm-appservice-proxy.svg)](https://github.com/shibayan/terraform-azurerm-appservice-proxy/releases/latest)
[![License](https://img.shields.io/github/license/shibayan/terraform-azurerm-appservice-proxy.svg)](https://github.com/shibayan/terraform-azurerm-appservice-proxy/blob/master/LICENSE)
[![Terraform Registry](https://img.shields.io/badge/terraform-registry-5c4ee5.svg)](https://registry.terraform.io/modules/shibayan/keyvault-acmebot/azurerm/latest)

## Usage

```hcl
module "appservice_proxy" {
  source  = "shibayan/appservice-proxy/azurerm"
  version = "~> 1.0"

  web_app_name        = "app-proxy-module"
  app_service_plan_id = azurerm_app_service_plan.default.id
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
}
```

## License

This project is licensed under the [MIT License](https://github.com/shibayan/terraform-azurerm-appservice-proxy/blob/master/LICENSE)
