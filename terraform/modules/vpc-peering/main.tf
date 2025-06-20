##################################################################################
# VPC PEERING CONNECTION REQUESTER
##################################################################################
resource "aws_vpc_peering_connection" "requester" {
  vpc_id        = var.requester_vpc_id
  peer_owner_id = var.accepter_account_id
  peer_vpc_id   = var.accepter_vpc_id
  peer_region   = var.accepter_region_id
  auto_accept   = false
  provider      = aws.default

  tags = merge(
    var.tags,
    {
      "Name" = var.peering_name
    },
  )
  count = var.enabled ? 1 : 0
}

##################################################################################
# VPC PEERING CONNECTION ACCEPTER
##################################################################################
resource "aws_vpc_peering_connection_accepter" "accepter" {
  vpc_peering_connection_id = aws_vpc_peering_connection.requester[0].id
  auto_accept               = true
  tags = merge(
    var.tags,
    {
      "Name" = var.peering_name
    },
  )
  count = var.enabled ? 1 : 0
}

##################################################################################
# PUBLIC ROUTE FORM REQUESTER TO ACCEPTER
##################################################################################
resource "aws_route" "requester_vpc" {
  route_table_id            = element(var.requester_vpc_rt_id, 0)
  destination_cidr_block    = var.accepter_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.requester[0].id
  provider                  = aws.default
  count                     = var.enabled ? 1 : 0
}

##################################################################################
# PUBLIC ROUTE FORM REQUESTER PUBLIC SUBNET TO ACCEPTER
##################################################################################
resource "aws_route" "requester_public_route" {
  route_table_id            = element(var.requester_vpc_public_rt_ids, 0)
  destination_cidr_block    = var.accepter_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.requester[0].id
  provider                  = aws.default
  count                     = var.enabled ? 1 : 0
}

##################################################################################
# ROUTE TABLE FOR REQUESTER PRIVATE SUBNETS TO ACCEPTER
##################################################################################
resource "aws_route" "requester_private_route" {
  route_table_id            = element(var.requester_vpc_private_rt_ids, count.index)
  destination_cidr_block    = var.accepter_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.requester[0].id
  provider                  = aws.default
  count                     = (var.enabled ? 1 : 0) * length(var.requester_vpc_private_rt_ids)
}

##################################################################################
# ROUTE FROM ACCEPTER TO REQUESTER PRIVATE SUBNETS
##################################################################################
resource "aws_route" "accepter_private_route" {
  count                     = var.accepter_private_rt_count * (var.enabled ? 1 : 0)
  route_table_id            = element(var.accepter_vpc_private_rt_ids, count.index)
  destination_cidr_block    = var.requester_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.requester[0].id
}

