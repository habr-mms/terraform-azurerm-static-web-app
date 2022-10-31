module "static-web-app" {
  source = "github.com/habr-mms/terraform-azurerm-static-web-app"
  static_site = {
    env = {
      name                = "swa-service-env"
      location            = "westeurope"
      resource_group_name = "rg-service-env"
      tags = {
        service = "service-name"
      }
    }
  }
}
