/**
 * # static web app
 *
 * This module manages app service static site (static web app)
 *
*/
resource "azurerm_static_site" "static_site" {
  for_each = var.static_site

  name                = local.static_site[each.key].name == "" ? each.key : local.static_site[each.key].name
  location            = local.static_site[each.key].location
  resource_group_name = local.static_site[each.key].resource_group_name
  sku_tier            = local.static_site[each.key].sku_tier
  sku_size            = local.static_site[each.key].sku_size
  dynamic "identity" {
    for_each = local.static_site[each.key].identity.type != "" ? [1] : []

    content {
      type         = local.static_site[each.key].identity.type
      identity_ids = local.static_site[each.key].identity.identity_ids
    }
  }

  tags = local.static_site[each.key].tags
}
