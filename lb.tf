resource "azurerm_lb" "user01-lb" {
  name                    = "user01lb"
  location                = azurerm_resource_group.user01-rg.location
  resource_group_name     = azurerm_resource_group.user01-rg.name
  
  frontend_ip_configuration {
    name                  = "user01PublicIPAddress"
    public_ip_address_id   = azurerm_public_ip.user01-publicip.id
  }
}

