provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_vcenter}"

  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_datacenter}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vsphere_datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.vsphere_port_group}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "${var.vsphere_vm_template}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm" {
  name             = "${var.vsphere_vm_name}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus             = 2
  num_cores_per_socket = 2
  memory               = 24888
  guest_id             = "${data.vsphere_virtual_machine.template.guest_id}"
  wait_for_guest_net_timeout = 0

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label            = "${var.vsphere_vm_name}.vmdk"
    unit_number      = 0
    size             = 30
    thin_provisioned = false
  }
  disk {
    label            = "${var.vsphere_vm_name}a.vmdk"
    unit_number      = 1
    size             = 300
    thin_provisioned = false
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${var.vsphere_vm_name}"
        domain    = "${var.vsphere_domain}"
      }

      network_interface {
        ipv4_address    = "${var.vsphere_ipv4_address}"
        ipv4_netmask    = 24
        dns_server_list = "${var.vsphere_dns_servers}"
      }

      ipv4_gateway = "<gateway_ip>"
    }
  }

}
