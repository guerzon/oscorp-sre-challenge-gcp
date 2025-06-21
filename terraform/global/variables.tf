### Sample variable definitions

variable "region" {
  description = "GCP geographic region"
  default     = "asia-east1"
  type        = string
}

variable "environment" {
  description = "GCP environment (test,stage,prod etc)"
  type        = string
}

variable "state_bucket" {
  description = "terraform state bucket"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}