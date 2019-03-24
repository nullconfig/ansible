## vsphere parameters
variable "vsphere_user" {
  description = "vsphere linux service user"
  default     = "<sphere_user>"
}
variable "vsphere_vcenter" {
  description = "fqdn of vsphere environment"
  default     = "<vsphere_fqdn>"
}
variable "vsphere_password" {
  description = "vsphere linuxservice password"
  default     = "<vsphere_user_password>"
}
variable "vsphere_datacenter" {
  description = "In which datacenter the VM will be deployed"
  default     = "<vsphere_datacenter>"
}
variable "vsphere_pool" {
  description = "vms must be deployed to a provisioning pool"
  default     = "<resource_pool>"
}
variable "vsphere_cluster" {
  default     = "<cluster_name>"
}
variable "vsphere_datastore" {
  description = "datasource with the most space available"
  default     = "<datastore>"
}
variable "vsphere_vm_template" {
  description = "ovf template for the machine"
  default     = "Templates/<name_of_template>"
}

## VM Variables
variable "vsphere_vm_name" {
  description = "vsphere name should match machines hostname"
}
variable "vsphere_port_group" {
  description = "port group of environment"
  default     = "<port_group>"
}
variable "vsphere_ipv4_address" {}
variable "vsphere_ipv4_netmask" {
  default     = 24
}
variable "vsphere_ipv4_gateway" {
  default     = "<gateway_ip>"
}
variable "vsphere_domain" {
  default     = "<domain_name>"
}
variable "vsphere_vcpu_number" {
  default     = 1
}
variable "vsphere_memory_size" {
  default     = 4096
}
variable "vsphere_dns_servers" {
   default    = ["<list_of_servers>"]
}