resource "google_compute_firewall" "allow_ssh_external" {
  name    = "${var.environment}-allow-ssh-external"
  network = data.terraform_remote_state.global.outputs.compute_vpc

  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags = ["bastion"]
}

resource "google_compute_firewall" "allow_internal" {
  name    = "${var.environment}-allow-internal"
  network = data.terraform_remote_state.global.outputs.compute_vpc

  source_tags = ["bastion"]
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}