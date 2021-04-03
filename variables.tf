variable "backend_client_id" {
}

variable "backend_client_secret" {
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

variable "backend_ssh_key" {
}

variable "prefix" {
  default = "leo"
}

variable "environment" {
}

variable "resource_group_name" {

}

#variable "storage_account_name" {

#}

variable "project_id" {
  
}

variable "db_name" {

}

#variable "sa_resource_group_name" {

#}

#variable "namespace" {
#  default = "leo-pharma"
#}