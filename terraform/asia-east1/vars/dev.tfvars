###################################################
# environment specific value assignment to variables
###################################################

### Sample variables

environment = "dev"

labels = {
  "owner"        = "sre-team"
  "environment"  = "development"
  "organization" = "oscorp-gmbh"
}

gke_cluster_name         = "dev-cluster"
gke_cluster_version      = "1.32"
node_group_instance_type = "e2-standard-2"
node_locations           = ["asia-east1-a"]

# bastion_host_whitelist = [
#  "10.10.0.0/16"
#]
project_id       = "gcp-review-playground"
state_bucket     = "gcp-review-playground-terraform"
global_state_key = "global.tfstate"
