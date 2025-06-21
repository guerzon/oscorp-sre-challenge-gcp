resource "google_compute_instance" "bastion" {
  name         = "${var.environment}-bastion"
  machine_type = "e2-micro"
  zone         = "asia-east1-c"
  tags         = ["bastion"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    subnetwork = data.terraform_remote_state.global.outputs.compute_subnetwork
    access_config {
      // Ephemeral IP
    }
  }
  labels = var.labels

}