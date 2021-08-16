# Copyright (c) 2019, 2020 Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

output "vcn_id" {
  description = "id of vcn that is created"
  value       = data.oci_core_vcn.vcn.id
}

output "drg_id" {
  description = "id of drg if it is created"
  value       = join(",", oci_core_drg.drg[*].id)
}

output "nat_gateway_id" {
  description = "id of nat gateway if it is created"
  value       = data.oci_core_nat_gateways.nat_gateway.nat_gateways[0].id
}

output "internet_gateway_id" {
  description = "id of internet gateway if it is created"
  value       = data.oci_core_internet_gateways.internet_gateway.gateways[0].id
}

output "service_gateway_id" {
  description = "id of service gateway if it is created"
  value       = data.oci_core_service_gateways.service_gateway.service_gateways[0].id
}

output "ig_route_id" {
  description = "id of internet gateway route table"
  value       = data.oci_core_route_tables.ig.route_tables[0].id#TODO:check if finding datasource, then fix datasource
}

output "nat_route_id" {
  description = "id of VCN NAT gateway route table"
  value       = data.oci_core_route_tables.nat.route_tables[0].id
}


# New complete outputs for each resources with provider parity. Auto-updating.
# Usefull for module composition.

output "drg_all_attributes" {
  description = "all attributes of created drg"
  value       = { for k, v in oci_core_drg.drg : k => v }
}

output "drg_attachment_all_attributes" {
  description = "all attributes related to drg attachment"
  value       = { for k, v in oci_core_drg_attachment.drg : k => v }
}


output "internet_gateway_all_attributes" {
  description = "all attributes of created internet gateway"
  value       = { for k, v in data.oci_core_internet_gateways.internet_gateway.gateways[0] : k => v }
}

output "ig_route_all_attributes" {
  description = "all attributes of created ig route table"
  value       = { for k, v in data.oci_core_route_tables.ig.route_tables[0] : k => v }
}


output "lpg_all_attributes" {
  description = "all attributes of created lpg"
  value       = { for k, v in oci_core_local_peering_gateway.lpg : k => v }
}

output "nat_gateway_all_attributes" {
  description = "all attributes of created nat gateway"
  value       = { for k, v in data.oci_core_nat_gateways.nat_gateway.nat_gateways[0] : k => v }
}

output "nat_route_all_attributes" {
  description = "all attributes of created nat gateway route table"
  value       = { for k, v in data.oci_core_route_tables.nat.route_tables[0] : k => v }
}

output "service_gateway_all_attributes" {
  description = "all attributes of created service gateway"
  value       = { for k, v in data.oci_core_service_gateways.service_gateway.service_gateways[0] : k => v }
}

output "vcn_all_attributes" {
  description = "all attributes of created vcn"
  value       = { for k, v in data.oci_core_vcn.vcn : k => v }
}
