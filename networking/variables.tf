variable "region" {
  description = "OVH region from https://www.ovhcloud.com/en/public-cloud/regions-availability/"
  default     = "DE1"
}

variable "vlan_id" {
  description = "VLAN ID for staging and production not to overlap. By default it is max(VLAN IDs on the project) + 1, so they would surely overlap"
  default     = "2000"
}

variable "name_prefix" {
  type        = string
  description = "Prefix to be used on each infrastructure object Name created in OVH."
  default     = "demo"
}
