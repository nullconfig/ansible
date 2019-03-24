# elasticsearch cluster
# master nodes
module "masternode01" {
    source               = "../modules/es_masternode_template"
    vsphere_vm_name      = "masternode01"
    vsphere_ipv4_address = "<ip_address>"
    vsphere_datastore    = "<datastore>"
}
module "masternode02" {
    source               = "../modules/es_masternode_template"
    vsphere_vm_name      = "masternode02"
    vsphere_ipv4_address = "<ip_address>"
    vsphere_datastore    = "<datastore>"
}
module "masternode03" {
    source               = "../modules/es_masternode_template"
    vsphere_vm_name      = "masternode03"
    vsphere_ipv4_address = "<ip_address>"
    vsphere_datastore    = "<datastore>"
}

# client nodes
module "clientnode01" {
    source               = "../modules/es_clientnode_template"
    vsphere_vm_name      = "clientnode01"
    vsphere_ipv4_address = "<ip_address>"
    vsphere_datastore    = "<datastore>"
}
module "clientnode02" {
    source               = "../modules/es_clientnode_template"
    vsphere_vm_name      = "clientnode02"
    vsphere_ipv4_address = "<ip_address>"
    vsphere_datastore    = "<datastore>"
}

# data nodes
module "datanode01" {
    source               = "../modules/es_datanode_template"
    vsphere_vm_name      = "datanode01"
    vsphere_ipv4_address = "<ip_address>"
    vsphere_datastore    = "<datastore>"
}
module "datanode02" {
    source               = "../modules/es_datanode_template"
    vsphere_vm_name      = "datanode02"
    vsphere_ipv4_address = "<ip_address>"
    vsphere_datastore    = "<datastore>"
}
module "datanode03" {
    source               = "../modules/es_datanode_template"
    vsphere_vm_name      = "datanode03"
    vsphere_ipv4_address = "<ip_address>"
    vsphere_datastore    = "<datastore>"
}
