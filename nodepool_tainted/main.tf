resource "ovh_cloud_project_kube_nodepool" "pool" {
  service_name = var.project_id
  name = var.suffix == "" ? (
    "${var.purpose}-${var.clusterName}"
    ) : (
    "${var.purpose}-${var.suffix}-${var.clusterName}"
  )
  kube_id       = var.clusterId
  flavor_name   = "b2-7"
  desired_nodes = var.desired_nodes
  max_nodes     = var.max_nodes
  min_nodes     = var.min_nodes
  template {
    metadata {
      annotations = {
        k1 = "v1"
        k2 = "v2"
      }
      finalizers = []
      labels = {
        k3 = "v3"
        k4 = "v4"
      }
    }
    spec {
      unschedulable = false
      taints = [
        {
          effect = var.taints.effect
          key    = var.taints.key
          value  = var.taints.value
        }
      ]
    }
  }
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
