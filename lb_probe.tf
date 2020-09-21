resource "azurerm_lb_probe" "user01-lb-probe" {
    resource_group_name = azurerm_resource_group.user01-rg.name
    loadbalancer_id = azurerm_lb.user01-lb.id
    name = "http-probe"
    protocol = "Http"
    request_path = "/"
    port = 80
}
