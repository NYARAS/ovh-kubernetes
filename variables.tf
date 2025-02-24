variable "region" {
  description = "OVH region from https://www.ovhcloud.com/en/public-cloud/regions-availability/"
  default     = "DE1"
}

variable "global_region" {
  description = "OVH global location for PostGreSQL and bucket"
  default     = "DE"
}

variable "project_id" {
  description = "OVH project ID"
  default = {
    prod = ""
  }
}

variable "openstack_tenant" {
  description = "OpenStack provider project name"
  default = {
    prod = ""
  }
}

variable "openstack_user" {
  description = "OpenStack provider user name"
  default = {
    prod = ""
  }
}

variable "vlan_id" {
  description = "VLAN ID for staging and production not to overlap. By default it is max(VLAN IDs on the project) + 1, so they would surely overlap"
  default = {
    prod = "2000"
  }
}

variable "openstack_password" {
  description = "OpenStack provider password"
  default = {
    prod = ""
  }
}

# from https://www.ovh.com/auth/api/createToken?GET=/*&POST=/*&PUT=/*&DELETE=/*
variable "ovh_application_key" {
  description = "OVH provider application key"
  default = {
    prod = ""
  }
}

# idem
variable "ovh_application_secret" {
  description = "OVH provider application secret"
  default = {
    prod = ""
  }
}

# idem
variable "ovh_consumer_key" {
  description = "OVH provider consumer key"
  default = {
    prod = ""
  }
}

variable "name_prefix" {
  type        = string
  description = "Prefix to be used on each infrastructure object Name created in OVH."
  default     = "demo"
}

# variable "max_nodes" {

# }
# variable "min_nodes" {

# }
# variable "desired_nodes" {

# }
