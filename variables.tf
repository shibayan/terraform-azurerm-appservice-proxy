variable "web_app_name" {
  type        = string
  description = "The name of the Web App to create."
}

variable "app_service_plan_id" {
  type        = string
  description = "The resource id of the App Service Plan."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name to be added."
}

variable "location" {
  type        = string
  description = "Azure region to create resources."
}