# Compute module - variables.tf
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "vm_count" {
  description = "Number of virtual machines to create"
  type        = number
  default     = 1
}

variable "subnet_id" {
  description = "ID of the subnet to associate with the network interfaces"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for the virtual machine. Leave blank to auto-generate a random password."
  type        = string
  default     = ""
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "image_publisher" {
  description = "Publisher of the image used for the virtual machine"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "Offer of the image used for the virtual machine"
  type        = string
  default     = "UbuntuServer"
}

variable "image_sku" {
  description = "SKU of the image used for the virtual machine"
  type        = string
  default     = "18.04-LTS"
}

variable "image_version" {
  description = "Version of the image used for the virtual machine"
  type        = string
  default     = "latest"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
