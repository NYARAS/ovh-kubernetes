variable "region" {
  description = "OVH region from https://www.ovhcloud.com/en/public-cloud/regions-availability/"
  default     = "DE1"
}

variable "project_id" {
  description = "OVH project ID"
  default     = ""
}

variable "name_prefix" {
  type        = string
  description = "Prefix to be used on each infrastructure object Name created in OVH."
  default     = ""
}

variable "private_network" {

}
