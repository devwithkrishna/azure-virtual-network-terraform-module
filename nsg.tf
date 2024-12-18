# Inbound rules
resource "azurerm_network_security_rule" "port80" {
  name                        = "AllowHttpOn80"
  description                 = "port 80 open for HTTP traffic"
  priority                    = 150
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "port22" {
  name                        = "AllowSSHOn22"
  priority                    = 160
  description                 = "Ssh on port 22"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
  depends_on                  = [azurerm_network_security_rule.port80]
}

resource "azurerm_network_security_rule" "port8080" {
  name                        = "AllowAnyCustom8080Inbound"
  priority                    = 170
  description                 = "port 8080 opened for jenkins deployment as a docker container"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "8080"
  source_address_prefix       = "*"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
  depends_on = [azurerm_network_security_rule.port22,
    azurerm_network_security_rule.port80
  ]
}

resource "azurerm_network_security_rule" "port4243" {
  name                        = "AllowAnyCustom4243Inbound"
  priority                    = 180
  description                 = "TCP connection jenkins + docker set"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "4243"
  source_address_prefix       = "*"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
  depends_on = [azurerm_network_security_rule.port22,
    azurerm_network_security_rule.port80, azurerm_network_security_rule.port8080
  ]
}