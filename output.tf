output "static-site" {
  description = "azurerm_static_site results"
  value = {
    for static_site in keys(azurerm_static_site.static_site) :
    static_site => {
      id                = azurerm_static_site.static_site[static_site].id
      api_key           = azurerm_static_site.static_site[static_site].api_key
      default_host_name = azurerm_static_site.static_site[static_site].default_host_name
    }
  }
}
