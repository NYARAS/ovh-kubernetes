variable "region" {
  description = "OVH region from https://www.ovhcloud.com/en/public-cloud/regions-availability/"
  default     = "DE1"
}

variable "project_id" {
  description = "OVH project ID"
  default     = "829e0bdb21e84c13ae3bac96f88ec9e8"
}

variable "name_prefix" {
  type        = string
  description = "Prefix to be used on each infrastructure object Name created in OVH."
  default     = ""
}

variable "private_network" {

}

variable "purpose" {

}

variable "suffix" {
  type    = string
  default = ""
}

variable "clusterName" {

}

variable "max_nodes" {

}
variable "min_nodes" {

}
variable "desired_nodes" {

}

variable "clusterId" {

}

variable "taints" {
  description = "Network configuration for the instance. Only one between private_network and psc_config can be used."
  type = object({
    effect = string
    key    = string
    value  = string

  })

  default = {
    effect = "value"
    key    = "value"
    value  = "value"
  }
}
