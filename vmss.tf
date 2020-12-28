resource "azurerm_virtual_machine_scale_set" "user01vmss" {
name = "user01vmss"
location = azurerm_resource_group.user01-rg.location
resource_group_name = azurerm_resource_group.user01-rg.name

upgrade_policy_mode = "Manual"


sku {
    name = "Standard_D2_v3"
    tier = "Standard"
    capacity = 2
}
storage_profile_image_reference {
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "18.04-LTS"
    version = "latest"
}

storage_profile_os_disk {
    name = ""
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
}
storage_profile_data_disk {
    lun = 0
    caching = "ReadWrite"
    create_option = "Empty"
    disk_size_gb = 10
}
os_profile {
    computer_name_prefix = "testvm"
    admin_username = "myadmin"  ## VM 에 접속할 계정
    custom_data = file("web.sh")
}

#서버 80포트 접속안되시는 분들은 실제 서버 접속하셔서 아파치 데몬이 정상 동작하는지
#확인해 보시면됩니다. 아래는 접속 방법이에요.  
#LB 인바운드 NAT 규칙에 설정된 것처럼 공인IP 50001 번 포트로 접속을 해서 실제서버
#22번 포트에 접속하는 NAT 구조입니다. why? 실제 서버는 공인 IP없이 동작하기때문에
#외부에서 접속하려면 공인IP를 가진 LB가 접속을 도와주어야 하는거죠. 
#아래 104.40.10.17은 예를 든 IP
#계정은 위와 같이 설정하셨으면 myadmin 이 되겠죠?

#ssh -i ~/.ssh/id_rsa 계정@104.40.10.17 -p 50001  (첫번째 서버 접속)
#ssh -i ~/.ssh/id_rsa 계정@104.40.10.17 -p 50003  (두번째 서버 접속)

os_profile_linux_config {
disable_password_authentication = true
ssh_keys {
    path = "/home/myadmin/.ssh/authorized_keys"   ## pwd 실행후 경로설정 ex) /home/user01 등 
    key_data = file("~/.ssh/id_rsa.pub")  ## Public Key는 VMSS 실행 전에 미리 터미널에서 ssh-keygen 으로 생성 (엔터 3번) 
    }
}
    
    
#extension {
#    name                 = "user01-vmss-extension"
#    publisher            = "Microsoft.Azure.Extensions"
#    type                 = "CustomScript"
#    type_handler_version = "2.0"

#    settings = <<SETTINGS
#    {
#    "fileUris": ["https://user23cloudshell.blob.core.windows.net/img/web.sh"],
#    "commandToExecute": "bash web.sh"
#    }
#SETTINGS
#}

network_profile {
        name = "terraformnetworkprofile"
        primary = true
        ip_configuration {
        name = "TestIPConfiguration"
        primary = true
        subnet_id = azurerm_subnet.user01-subnet1.id
        load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.user01-bpepool.id]
        load_balancer_inbound_nat_rules_ids = [azurerm_lb_nat_pool.lbnatpool.id]
    }
        network_security_group_id = azurerm_network_security_group.user01nsg.id
}
tags = {
    environment = "staging"
    }
}


