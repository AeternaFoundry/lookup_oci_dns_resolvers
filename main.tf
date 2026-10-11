data "oci_dns_resolvers" "dns_resolvers_lookup" {
  for_each = var.dns_resolvers_lookup

  compartment_id = each.value.compartment_id
  scope          = each.value.scope
  display_name   = each.value.display_name
  state          = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

