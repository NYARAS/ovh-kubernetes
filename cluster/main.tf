resource "ovh_cloud_project_kube" "cluster" {
  service_name = var.project_id
  name         = "${var.name_prefix}-cluster"
  region       = var.region

  private_network_id = var.private_network

  private_network_configuration {
    default_vrack_gateway              = "192.168.12.1"
    private_network_routing_as_default = true
  }
}

resource "local_sensitive_file" "kubeconfig" {
  content         = ovh_cloud_project_kube.cluster.kubeconfig
  filename        = "${var.name_prefix}.kubeconfig"
  file_permission = "0644"

  depends_on = [ovh_cloud_project_kube.cluster]
}

output "clusterName" {
  value = ovh_cloud_project_kube.cluster.name
}
output "clusterId" {
  value = ovh_cloud_project_kube.cluster.id
}

output "local_sensitive_file" {
  value = local_sensitive_file.kubeconfig.content
}
