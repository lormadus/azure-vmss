resource "azurerm_resource_group" “user01-rg" {
    name     = “user01myresourcegroup"
    location = “koreacentral"

    tags = {
        environment = "Terraform Demo"
    }
}
