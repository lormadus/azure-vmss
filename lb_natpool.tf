resource "azurerm_lb_nat_pool" "user01-lbnatpool" {
    resource_group_name = azurerm_resource_group.user01-rg.name
    name = "ssh"
    loadbalancer_id = azurerm_lb.user01-lb.id
    protocol = "Tcp"
    frontend_port_start = 50000
    frontend_port_end = 50119
    backend_port = 22
    frontend_ip_configuration_name = "user01PublicIPAddress"
}
