resource "azurerm_managed_disk" "encryption_disabled" {
  name                 = "acctestmd"
  location             = "West US 2"
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"

  encryption_settings = {
      enabled = false
  }

  tags = {
    environment = "staging"
  }
}

resource "azurerm_managed_disk" "encryption_missing" {
  name                 = "acctestmd"
  location             = "West US 2"
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"
  

  tags = {
    environment = "staging"
  }
}