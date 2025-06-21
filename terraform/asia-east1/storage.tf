resource "google_storage_bucket" "data" {
  name                        = "${var.environment}-data-bucket-challenge"
  location                    = var.region
  uniform_bucket_level_access = true

  labels = var.labels
}