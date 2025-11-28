module "rg" {
  source = "./modules/rg"
  rg_name = var.rg_name
  location = var.location
}

module "network" {
  source = "./modules/Network"
  vnet_name = var.vnet_name
  resource_group_name = module.rg.rg_name
  location = var.location
}

module "public_ip" {
  source = "./modules/publicip"
  public_ip_name = var.public_ip_name
  location = var.location
  resource_group_name = module.rg.rg_name
}

module "nic" {
  source = "./modules/nic"
  subnet_id = module.subnet.subnet_id
  location = var.location
  resource_group_name = module.rg.rg_name
  nic_name = var.nic_name
  public_ip_id = module.public_ip.public_ip_id
}

module "web_nsg" {
  source              = "./modules/nsg"
  name                = "nsg-web"
  location            = var.location
  resource_group_name = module.rg.rg_name

  security_rules = {
    http = {
      name                       = "allow-http"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    ssh = {
      name                       = "allow-ssh"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}

module "subnet" {
  source = "./modules/subnet"
  vnet_name = module.network.vnet_name
  subnet_name = var.subnet_name
  resource_group_name = module.rg.rg_name
  associate_subnet = true
  nsg_id = module.web_nsg.nsg_id
}


module "vm" {
  source = "./modules/vm"
  vm_size = var.vm_size
  admin_password = var.admin_password
  admin_username = var.admin_username
  nic_id = module.nic.nic_id
  vm_name = var.vm_name
  resource_group_name = module.rg.rg_name
  location = var.location
}


module "storage_account" {
  source = "./modules/storageaccount"
  account_name = var.account_name
  location = var.location
  resource_group_name = module.rg.rg_name
}