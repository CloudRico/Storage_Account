
module "conventions" {
  source        = "github.com/CloudRico/Uplift-modules.git?ref=v1"
  enviroment    = var.enviroment
  workload      = var.workload
  resource_type = "storageaccount"
  application   = var.application
  instance      = "${count.index}"
}


resource "azurerm_storage_account" "storage_account1" {
  count                      = 2
  name                       = var.name != "" ? var.name :module.conventions.name
  resource_group_name        = var.resource_group_name != "" ? var.resource_group_name : module.azurerm_resource_group[0].name
  location                   = module.conventions.allowed_location_type
  account_tier               = local.storage_account_count[count.index].account_tier
  account_replication_type   = local.account_replication_type

  #tags                       = var.tags
}