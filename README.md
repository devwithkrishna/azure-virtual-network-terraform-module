# AZURE VIRTUAL NETWORK TERRAFORM MODULE

Azure Virtual Network (VNet) is a foundational service in Microsoft Azure that enables secure communication between Azure resources, on-premises networks, and the internet. It provides isolation, segmentation, and control over network traffic, allowing you to define subnets, routing rules, and network security policies.

A Terraform module for Azure VNet simplifies the provisioning and management of VNets by encapsulating reusable configurations. It allows you to define parameters like resource group, location, CIDR blocks, and subnets, enabling consistent and efficient deployment of network infrastructure across environments.
<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement_azurerm) | <= 4.0 |
| <a name="requirement_random"></a> [random](#requirement_random) | >= 3.1 |
## Usage
Basic usage of this module is as follows:
  ```hcl
    module "example" {
      	 source  = "<module-path>"
      
	 # Optional variables
      	 application_name  = "devwithkrishna"
      	 environment  = "DEV"
      	 location  = "southindia"
      	 resource_group_name  = "test1"
      	 subnet_cidrs  = [
  "10.247.0.0/25"
]
      	 temporary  = "TRUE"
      	 vnet_address_space  = [
  "10.247.0.0/25"
]
      	 vnet_name  = "test1"
    }
  ```

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.port22](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.port4243](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.port80](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.port8080](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.subnet2nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_application_name"></a> [application_name](#input_application_name) | Azure application name tag | `string` | no |
| <a name="input_environment"></a> [environment](#input_environment) | Environment tag value in Azure | `string` | no |
| <a name="input_location"></a> [location](#input_location) | Azure location | `string` | no |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | Azure Vnet resource group name | `string` | no |
| <a name="input_subnet_cidrs"></a> [subnet_cidrs](#input_subnet_cidrs) | Azure Subnet Ip addresses | `list(string)` | no |
| <a name="input_temporary"></a> [temporary](#input_temporary) | Temporary tag value in Azure | `string` | no |
| <a name="input_vnet_address_space"></a> [vnet_address_space](#input_vnet_address_space) | Azure VNET address space | `list(string)` | no |
| <a name="input_vnet_name"></a> [vnet_name](#input_vnet_name) | Azure Vnet name | `string` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_current_subscription_display_name"></a> [current_subscription_display_name](#output_current_subscription_display_name) | Subscription name |
| <a name="output_current_subscription_id"></a> [current_subscription_id](#output_current_subscription_id) | Subscription id |
| <a name="output_vnet_address_range"></a> [vnet_address_range](#output_vnet_address_range) | Azure Vnet address range |
| <a name="output_vnet_environment"></a> [vnet_environment](#output_vnet_environment) | Azure Vnet environment tag value |
| <a name="output_vnet_location"></a> [vnet_location](#output_vnet_location) | Azure Location |
| <a name="output_vnet_name"></a> [vnet_name](#output_vnet_name) | Azure Virtual network name |
| <a name="output_vnet_resource_group_name"></a> [vnet_resource_group_name](#output_vnet_resource_group_name) | Azure resource group name |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->