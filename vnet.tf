resource "azurerm_resource_group" "rg" {
  name     = upper(var.resource_group_name)
  location = var.location
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.resource_group_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)
  }
}

# Create NSG
resource "azurerm_network_security_group" "nsg" {
  name                = upper("${var.vnet_name}-nsg")
  location            = var.location
  resource_group_name = upper(var.resource_group_name)
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.resource_group_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)

  }
}

# Create a Vnet
resource "azurerm_virtual_network" "vnet" {
  name                = upper(var.vnet_name)
  resource_group_name = upper(var.resource_group_name)
  location            = var.location
  address_space       = var.vnet_address_space
  tags = {
    Environment     = upper(var.environment)
    Orchestrator    = "Terraform"
    DisplayName     = upper(var.resource_group_name)
    ApplicationName = lower(var.application_name)
    Temporary       = upper(var.temporary)

  }
}

# Create subnets dynamically based on the provided CIDR blocks
resource "azurerm_subnet" "subnet" {
  count                = length(var.subnet_cidrs)                        # Create as many subnets as in the CIDR list
  name                 = upper("${var.vnet_name}-subnet-${count.index}") # Dynamic subnet name: subnet-0, subnet-1, etc.
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [element(var.subnet_cidrs, count.index)] # Assign each CIDR from the list
}

# Associate subnets to NSG
resource "azurerm_subnet_network_security_group_association" "subnet2nsg" {
  count                     = length(var.subnet_cidrs)
  subnet_id                 = azurerm_subnet.subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}