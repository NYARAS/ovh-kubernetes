data "openstack_networking_network_v2" "ext_net" {
  name   = "Ext-Net"
  region = var.region
}

resource "openstack_networking_network_v2" "private_network" {
  name           = "${var.name_prefix}-private-network"
  region         = var.region
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet" {
  network_id      = openstack_networking_network_v2.private_network.id
  region          = var.region
  name            = "${var.name_prefix}-subnet"
  cidr            = "192.168.12.0/24"
  enable_dhcp     = true
  no_gateway      = false
  dns_nameservers = ["1.1.1.1", "1.0.0.1"]

  # value_specs = {
  #   "provider:network_type"    = "vrack"
  #   "provider:segmentation_id" = var.vlan_id
  # }

  allocation_pool {
    start = "192.168.12.100"
    end   = "192.168.12.254"
  }
}

resource "openstack_networking_router_v2" "router" {
  region              = var.region
  name                = "${var.name_prefix}-router"
  admin_state_up      = true
  external_network_id = data.openstack_networking_network_v2.ext_net.id
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = openstack_networking_router_v2.router.id
  region    = var.region
  subnet_id = openstack_networking_subnet_v2.subnet.id
}

output "private_network" {
  value = openstack_networking_network_v2.private_network.id
}
