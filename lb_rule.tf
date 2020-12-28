resource "azurerm_lb_rule" "lbnatrule" {
    resource_group_name = azurerm_resource_group.user01-rg.name
    loadbalancer_id = azurerm_lb.user01-lb.id
    name = "http"
    protocol = "Tcp"
    frontend_port = 80
    backend_port = 80
    backend_address_pool_id = azurerm_lb_backend_address_pool.user01-bpepool.id
    frontend_ip_configuration_name = "user01PublicIPAddress"
    probe_id = azurerm_lb_probe.user01-lb-probe.id
}
