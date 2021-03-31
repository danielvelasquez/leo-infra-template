provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.serviceprincipal_id
  client_secret   = var.serviceprincipal_key
  tenant_id       = var.tenant_id
  
  features {}
}

module "cluster" {
  source               = "./modules/cluster/"
  serviceprincipal_id  = var.serviceprincipal_id
  serviceprincipal_key = var.serviceprincipal_key
  ssh_key              = var.ssh_key
  location             = var.location
  kubernetes_version   = var.kubernetes_version
  resource_group_name  = var.resource_group_name
  environment          = var.environment
  tenant_id            = var.tenant_id 
  server_app_secret    = var.server_app_secret
}

module "k8s" {
  source                 = "./modules/k8s/"
  host                   = module.cluster.host
  client_certificate     = base64decode(module.cluster.client_certificate)
  client_key             = base64decode(module.cluster.client_key)
  cluster_ca_certificate = base64decode(module.cluster.cluster_ca_certificate)
  resource_group_name    = var.resource_group_name
  location               = var.location
}
