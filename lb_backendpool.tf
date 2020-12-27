resource "azurerm_lb_backend_address_pool" "user01-bpepool" {
    name = "user01-BackEndAddressPool"
    resource_group_name = azurerm_resource_group.user01-rg.name
    loadbalancer_id     = azurerm_lb.user01-lb.id
}

