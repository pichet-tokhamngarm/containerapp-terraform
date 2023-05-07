module "loganalytics" {
  source                       = "./modules/log-analytics"
  log_analytics_workspace_name = "${var.app_name}la"
  location                     = var.location
  log_analytics_workspace_sku  = "PerGB2018"
  environment                  = var.environment
  resource_group_name          = "${var.app_name}-rg"
}

module "acr" {
  source              = "./modules/acr"
  name                = "${var.app_name}acr"
  location            = var.location
  environment         = var.environment
  resource_group_name = "${var.app_name}-rg"
}

module "appinsights" {
  source              = "./modules/appinsights"
  name                = "${var.app_name}insights"
  location            = var.location
  environment         = var.environment
  application_type    = "web"
  resource_group_name = "${var.app_name}-rg"
}
