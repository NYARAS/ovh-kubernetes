terraform {

  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "~> 1.5.0"
    }
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 2.1.0"
    }
  }
  required_version = "~> 1.5.3"
}
