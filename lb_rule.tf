resource "azurerm_lb_rule" "user01-lbnatrule" {
    resource_group_name = azurerm_resource_group.user01-rg.name
    loadbalancer_id = azurerm_lb.user01-lb.id
    name = "http"
    protocol = "Tcp"
    frontend_port = 80
    backend_port = 80
    frontend_ip_configuration_name = "user01PublicIPAddress"
}
