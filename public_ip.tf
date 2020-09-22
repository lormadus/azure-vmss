resource "azurerm_public_ip" "user01-publicip" {  
name                = "mypublicIP"  
location            = azurerm_resource_group.user01-rg.location  
resource_group_name = azurerm_resource_group.user01-rg.name  
allocation_method   = "Static"  
domain_name_label   = azurerm_resource_group.user01-rg.name  

## 동일 Region에 추가 Public IP 생성시에는 아래처럼 직접 입력
# domain_name_label   = "user01pubip2"


	tags = {    
		environment = "staging"  
	}

}
