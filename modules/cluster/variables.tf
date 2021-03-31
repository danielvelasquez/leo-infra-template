variable "serviceprincipal_id" {
}

variable "serviceprincipal_key" {
}

variable "tenant_id" {
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

variable resource_group_name {

}

variable "prefix" {
  default = "leo"
}

variable "display_name_prefix" {
  default = "leo-pharma"
}

variable "environment" {
}

variable "server_app_secret" {
  
}