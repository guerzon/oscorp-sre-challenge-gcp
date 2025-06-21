module "k8s" {
  source                   = "../modules/eks"
  labels                   = var.labels
  gke_cluster_name         = var.gke_cluster_name
  gke_cluster_version      = var.gke_cluster_version
  node_group_instance_type = var.node_group_instance_type
  node_locations           = var.node_locations
  gke_vpc_id               = data.terraform_remote_state.global.outputs.compute_vpc
  gke_subnet_id            = data.terraform_remote_state.global.outputs.compute_subnetwork
}