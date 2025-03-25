data "ovh_cloud_project_capabilities_containerregistry_filter" "regcap" {
  service_name = var.project_id
  plan_name    = var.plan
  region       = var.region
}

resource "ovh_cloud_project_containerregistry" "nsw" {
  service_name = data.ovh_cloud_project_capabilities_containerregistry_filter.regcap.service_name
  plan_id      = data.ovh_cloud_project_capabilities_containerregistry_filter.regcap.id
  region       = data.ovh_cloud_project_capabilities_containerregistry_filter.regcap.region
  name         = "${var.name_prefix}dockerregistry"
}

variable "region" {
  description = "OVH region from https://www.ovhcloud.com/en/public-cloud/regions-availability/"
  default     = "DE"
}

variable "project_id" {
  description = "OVH project ID"
  default     = "829e0bdb21e84c13ae3bac96f88ec9e8"
}

variable "name_prefix" {
  type        = string
  description = "Prefix to be used on each infrastructure object Name created in OVH."
  default     = "nsw"
}

variable "plan" {
  default = "SMALL"
}
