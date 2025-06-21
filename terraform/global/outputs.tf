output "compute_vpc" {
  value = module.compute_vpc.vpc
}

output "data_vpc" {
  value = module.data_vpc.vpc
}

output "compute_subnet_range" {
  value = module.compute_vpc.subnet_ip_range
}

output "data_subnet_range" {
  value = module.data_vpc.subnet_ip_range
}

output "compute_subnetwork" {
  value = module.compute_vpc.subnetwork
}