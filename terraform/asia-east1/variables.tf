# Base and sample variables

variable "region" {
  description = "The AWS region where all terraform operations are carried out."
  type        = string
  default     = "asia-east1"
}

# this is environment specific, check on Cloud Storage for the name
variable "state_bucket" {
  description = "The GCS bucket where the state files are stored"
  type        = string
}

variable "global_state_key" {
  description = "The terraform global state file name/object key in the GCS state bucket"
  type        = string
  default     = "global.tfstate"
}


variable "environment" {
  description = "Env of the current account (e.g. Staging, Production)"
  type        = string
}

variable "tags" {
  description = "Tags for all resources"
  type        = map(string)
}

variable "create_eks_cluster" {
  description = "Flag to enable / disable the cluster creation"
  type        = bool
  default     = false
}

variable "eks_cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "eks_cluster_version" {
  type        = string
  description = "Kubernetes cluster version"
  default     = "1.22"
}

variable "bastion_host_whitelist" {
  type        = list(string)
  description = "List of IPs allowed to access bastion host"
}
