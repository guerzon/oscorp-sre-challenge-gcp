##################################################################################
# VARIABLES
##################################################################################

variable "region" {
  description = "VPC Region"
  default     = "asia-east1"
  type        = string
}

variable "environment_tag" {
  description = "This tag seems not to be used in the module. Perhaps superseded by var.tags?"
}

variable "accepter_vpc_id" {
  description = "(Required) The ID of the VPC with which you are creating the VPC Peering Connection"
  type        = string
}

variable "accepter_account_id" {
  description = "(Optional) The AWS account ID of the owner of the peer VPC. Defaults to the account ID the AWS provider is currently connected to"
  type        = string
}

variable "accepter_region_id" {
  description = "(Optional) The region of the accepter VPC of the VPC Peering Connection. auto_accept must be false, and use the aws_vpc_peering_connection_accepter to manage the accepter side"
  type        = string
}

variable "requester_vpc_id" {
  description = "(Required) The ID of the requester VPC"
  type        = string
}

variable "peering_name" {
  description = "Name of the vpc peering connection to be used in tags both on requester/accepter side"
  type        = string
}

variable "requester_vpc_private_rt_ids" {
  description = "List of route tables IDs. It points at vpc peering requester's private subnets to be associated to vpc accepter"
  type        = list(string)
}

variable "requester_vpc_public_rt_ids" {
  description = "List of route tables IDs. It points at vpc peering requester's public subnets to be associated to vpc accepter"
  type        = list(string)
}

variable "accepter_cidr" {
  description = "CIDR block of the accepter vpc"
  type        = string
}

variable "accepter_vpc_private_rt_ids" {
  description = "List of route tables IDs. It points at vpc peering accepter's private subnets to be associated to vpc requester"
  type        = list(string)
}

variable "requester_cidr" {
  description = "CIDR block of the requester vpc"
  type        = string
}

variable "requester_vpc_rt_id" {
  description = "Route table id of public route from requester to accepter. Even if it's a list, only index 0 will be used."
  type        = list(string)
}

variable "accepter_private_rt_count" {
  description = "Number of private route tables on the accepter side"
  type        = number
}

variable "tags" {
  description = "Map of tags to be added to vpc requester and accepter"
  type        = map(string)
}

variable "enabled" {
  description = "Whether the module is enabled or not: true/false"
  default     = true
}

