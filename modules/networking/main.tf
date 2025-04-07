# Networking module - main.tf

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.environment}-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.address_space]
  tags                = var.tags
}

# Create subnets
resource "azurerm_subnet" "subnet" {
  count                = length(var.subnet_names)
  name                 = "${var.subnet_names[count.index]}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_prefixes[count.index]]
}

# Create a network security group
resource "azurerm_network_security_group" "nsg" {
  name                = "${var.environment}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

# Define security rules based on environment
locals {
  nsg_rules = {
    dev = [
      {
        name                       = "SSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "HTTP"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ],
    staging = [
      {
        name                       = "SSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "HTTP"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ],
    prod = [
      {
        name                       = "SSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.0.0.0/8"
        destination_address_prefix = "*"
      },
      {
        name                       = "HTTP"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}

# Create security rules for NSG
resource "azurerm_network_security_rule" "rules" {
  count                       = length(local.nsg_rules[var.environment])
  name                        = local.nsg_rules[var.environment][count.index].name
  priority                    = local.nsg_rules[var.environment][count.index].priority
  direction                   = local.nsg_rules[var.environment][count.index].direction
  access                      = local.nsg_rules[var.environment][count.index].access
  protocol                    = local.nsg_rules[var.environment][count.index].protocol
  source_port_range           = local.nsg_rules[var.environment][count.index].source_port_range
  destination_port_range      = local.nsg_rules[var.environment][count.index].destination_port_range
  source_address_prefix       = local.nsg_rules[var.environment][count.index].source_address_prefix
  destination_address_prefix  = local.nsg_rules[var.environment][count.index].destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

# Associate NSG with subnets
resource "azurerm_subnet_network_security_group_association" "subnet_nsg" {
  count                     = length(var.subnet_names)
  subnet_id                 = azurerm_subnet.subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}