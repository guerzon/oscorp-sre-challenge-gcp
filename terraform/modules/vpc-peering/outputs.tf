##################################################################################
# OUTPUT
##################################################################################

# The VPC peer ID.

output "peer_id" {
  description = "vpc peering connection ID"
  value       = aws_vpc_peering_connection.requester.*.id
}

