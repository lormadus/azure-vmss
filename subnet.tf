resource "azurerm_subnet" "user01-subnet1" {
    name = "user01-mysubnet1"
    resource_group_name = azurerm_resource_group.user01-rg.name
    virtual_network_name = azurerm_virtual_network.user01-vnet.name
    address_prefixes = ["1.0.1.0/24"]
}
