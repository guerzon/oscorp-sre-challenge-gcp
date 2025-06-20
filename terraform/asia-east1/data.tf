
##################################################################################
# Data definitions
##################################################################################

data "aws_availability_zones" "available" {}
data "aws_caller_identity" "current" {}

##################################################################################
# ACCESS REMOTE STATE
##################################################################################
## To access outputs from the global section
data "terraform_remote_state" "global" {
  backend = "gcs"
  config = {
    bucket         = var.state_bucket
    key            = var.global_state_key
    region         = var.region
  }
}
