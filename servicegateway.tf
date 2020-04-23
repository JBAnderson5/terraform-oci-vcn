# Copyright 2017, 2019, Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

data "oci_core_services" "all_oci_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
  count = var.service_gateway_enabled == true ? 1 : 0
}

resource "oci_core_service_gateway" "service_gateway" {
  compartment_id = var.compartment_id
  # depends_on     = [oci_core_nat_gateway.nat_gateway]
  display_name   = "${var.label_prefix}-sg-gw"

  services {
    service_id = lookup(data.oci_core_services.all_oci_services[0].services[0], "id")
  }
  vcn_id = oci_core_vcn.vcn.id

  freeform_tags  = var.freeform_tags

  count  = var.service_gateway_enabled == true ? 1 : 0
}
