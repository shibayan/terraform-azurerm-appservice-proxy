# App Service Proxy Terraform module

[![Validate](https://github.com/shibayan/terraform-azurerm-appservice-proxy/actions/workflows/validate.yml/badge.svg)](https://github.com/shibayan/terraform-azurerm-appservice-proxy/actions/workflows/validate.yml)
[![Release](https://badgen.net/github/release/shibayan/terraform-azurerm-appservice-proxy)](https://github.com/shibayan/terraform-azurerm-appservice-proxy/releases/latest)
[![License](https://badgen.net/github/license/shibayan/terraform-azurerm-appservice-proxy)](https://github.com/shibayan/terraform-azurerm-appservice-proxy/blob/master/LICENSE)
[![Terraform Registry](https://badgen.net/badge/terraform/registry/5c4ee5)](https://registry.terraform.io/modules/shibayan/appservice-proxy/azurerm/latest)

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
