variable "gke_cluster_name" {
  description = "The name of the gke cluster."
  type        = string
}

variable "gke_cluster_version" {
  type        = string
  description = "Kubernetes cluster version"
  default     = "1.22"
}

variable "node_group_instance_type" {
  type        = string
  description = "Instance type for the GKE node group"
  default     = "e2-medium"
}

# variable "gke_role_arn" {
#   description = "ARN of the gke role."
#   type        = string
# }

variable "gke_enabled_log_types" {
  description = "The enabled log types of the gke cluster."
  type        = list(string)
  default     = ["SYSTEM_COMPONENTS", "APISERVER", "CONTROLLER_MANAGER", "SCHEDULER", "WORKLOADS"]
}

# variable "gke_network_config" {
#   description = "Service IPv4 range."
#   type        = string
#   default     = "172.20.0.0/16"
# }

variable "gke_vpc_id" {
  description = "gke VPC id"
  type        = string
}

variable "gke_subnet_id" {
  description = "gke Subnet id"
  type        = string
}

variable "node_locations" {
  type    = list(string)
  default = ["asia-east1-a", "asia-east1-b", "asia-east1-c"]
}

# variable "gke_endpoint_private_access" {
#   description = "Make the private endpoints in gke available."
#   type        = bool
#   default     = true
# }

# variable "gke_endpoint_public_access" {
#   description = "Make the public endpoints in gke available."
#   type        = bool
#   default     = false
# }

# variable "gke_public_access_cidrs" {
#   description = "Indicates which CIDR blocks can access the Amazon gke public API server endpoint when enabled."
#   type        = list(string)
#   default     = ["0.0.0.0/0"]
# }

# variable "gke_security_group_ids" {
#   description = "gke Security Groups"
#   type        = list(string)
# }

# variable "gke_worker_vpc_cidr" {
#   description = "CIDR of the gke workers"
#   type        = list(string)
# }

variable "labels" {
  description = "Tags for all resources"
  type        = map(string)
}
