module "compute_vpc" {
  source      = "../modules/vpc"
  vpc_name    = "compute"
  region      = "asia-east1"
  subnet_cidr = "10.10.0.0/16"
}

module "data_vpc" {
  source      = "../modules/vpc"
  vpc_name    = "data"
  region      = "asia-east1"
  subnet_cidr = "10.30.0.0/16"
}