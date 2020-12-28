resource "azurerm_virtual_network" "user01-vnet" {
	name 			= "user01-myVnet"
	address_space 		= ["1.0.0.0/16"]
	location 			= azurerm_resource_group.user01-rg.location
	resource_group_name	= azurerm_resource_group.user01-rg.name
}
