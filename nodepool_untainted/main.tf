resource "ovh_cloud_project_kube_nodepool" "node_pool_untainted" {
  service_name = var.project_id
  kube_id      = var.clusterId
  flavor_name  = "b2-15"

  name = var.suffix == "" ? (
    "${var.purpose}-${var.clusterName}"
    ) : (
    "${var.purpose}-${var.suffix}-${var.clusterName}"
  )

  ## TODO: configure using https://docs.ovh.com/us/en/kubernetes/configuring-cluster-autoscaler/, not available in terraform
  # autoscale = true
  desired_nodes = var.desired_nodes
  max_nodes     = var.max_nodes
  min_nodes     = var.min_nodes

  timeouts {
    create = "1h" # default 20m ; OVH can be real slow on this one, and will consider a duplicate on next run
  }
}
