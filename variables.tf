variable "serviceprincipal_id" {
}

variable "serviceprincipal_key" {
}

variable "tenant_id" {
}

variable "subscription_id" {
}
variable "location" {
 type = string
  default = "westeurope"
}

variable "kubernetes_version" {
  default = "1.19.6"
}

variable "ssh_key" {
}

variable "namespace" {
  default = "leo-pharma"
}

variable "prefix" {
  default = "leo"
}

variable "environment" {
}

variable "resource_group_name" {

}

variable "server_app_secret" {
  
}