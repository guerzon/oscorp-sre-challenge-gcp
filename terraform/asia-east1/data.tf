
##################################################################################
# Data definitions
##################################################################################

# data "aws_availability_zones" "available" {}
data "google_client_openid_userinfo" "current" {}

##################################################################################
# ACCESS REMOTE STATE
##################################################################################
## To access outputs from the global section
data "terraform_remote_state" "global" {
  backend = "gcs"
  config = {
    bucket = var.state_bucket
    prefix = var.global_state_key
  }
}
