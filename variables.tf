variable "resource_group_name" {
  default     = ""
  description = "Azure Vnet resource group name"
  type        = string
}

variable "vnet_name" {
  default     = ""
  description = "Azure Vnet name"
  type        = string
}

variable "location" {
  default     = ""
  description = "Azure location"
  type        = string
}

variable "application_name" {
  default     = ""
  description = "Azure application name tag"
  type        = string
}

variable "environment" {
  default     = ""
  description = "Environment tag value in Azure"
  type        = string
  validation {
    condition     = contains(["DEV", "QA", "UAT", "PROD"], var.environment)
    error_message = "Environment value should be one among DEV or QA or UAT or PROD."
  }
}

variable "vnet_address_space" {
  description = "Azure VNET address space"
  type        = list(string)
  default     = [""]
  validation {
    condition     = length(var.vnet_address_space) > 0
    error_message = "The address_space variable must contain at least one CIDR block."
  }
}

variable "subnet_cidrs" {
  default     = [""]
  type        = list(string)
  description = "Azure Subnet Ip addresses"
  validation {
    condition     = length(var.subnet_cidrs) > 0
    error_message = "Atleast a single subnet CIDR is required."
  }
}


variable "temporary" {
  default     = ""
  description = "Temporary tag value in Azure"
  type        = string
  validation {
    condition     = contains(["TRUE", "FALSE"], upper(var.temporary))
    error_message = "The temporary tag value must be either 'TRUE' or 'FALSE'."
  }

}