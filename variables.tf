variable "static_site" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}

locals {
  default = {
    # resource definition
    static_site = {
      name     = ""
      sku_tier = "Standard"
      sku_size = "Standard"
      identity = {
        type         = ""
        identity_ids = null
      }
    }
  }

  # merge all custom and default values
  static_site = {
    for static_site in keys(var.static_site) :
    static_site => merge(local.default.static_site, var.static_site[static_site])
  }
}
