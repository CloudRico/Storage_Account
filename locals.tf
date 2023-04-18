locals {
  account_replication_type = local.account_replication_type_map[var.enviroment]
  account_replication_type_map = {
    dev = "LRS"
    tst = "LRS"
    qa  = "LRS"
    stg = "GRS"
    prd = "GRS"
    sec = "LRS"
  }
   storage_account_count = [
    {
        name         = "stg${var.env}${var.workload}log"
        account_tier = "Standard"
    },{
        name         = "stg${var.env}${var.workload}diag"
        account_tier = "Standard"
    },
  ]
}