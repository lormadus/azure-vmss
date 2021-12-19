resource "azurerm_lb_backend_address_pool" "user01-bep" {
    name = "user01-BackEndAddressPool"
    loadbalancer_id     = azurerm_lb.user01-lb.id
}

