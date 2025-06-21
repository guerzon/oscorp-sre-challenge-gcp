# resource "google_service_account" "default" {
#   account_id   = "${var.environment}-gke-sa"
#   display_name = "GKE Service Account for ${var.environment}"
# }

resource "google_container_cluster" "default" {
  name = var.gke_cluster_name
  # location           = var.region
  min_master_version       = var.gke_cluster_version
  network                  = var.gke_vpc_id
  initial_node_count       = 1
  remove_default_node_pool = true
  subnetwork               = var.gke_subnet_id
  deletion_protection      = false
  logging_config {
    enable_components = var.gke_enabled_log_types
  }
}

resource "google_container_node_pool" "default" {
  name           = "${var.gke_cluster_name}-node-pool"
  cluster        = google_container_cluster.default.name
  node_locations = var.node_locations
  node_count     = 1
  node_config {
    machine_type = var.node_group_instance_type
    labels       = var.labels
    disk_size_gb = "10"
  }
  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }
  network_config {
    enable_private_nodes = true
  }
}