resource "mongodbatlas_global_cluster_config" "global_cluster_configs" {
  for_each = var.global_cluster_configs

  cluster_name = each.value.cluster_name
  project_id   = each.value.project_id

  dynamic "custom_zone_mappings" {
    for_each = each.value.custom_zone_mappings != null ? each.value.custom_zone_mappings : []
    content {
      location = custom_zone_mappings.value.location
      zone     = custom_zone_mappings.value.zone
    }
  }

  dynamic "managed_namespaces" {
    for_each = each.value.managed_namespaces != null ? each.value.managed_namespaces : []
    content {
      collection                 = managed_namespaces.value.collection
      custom_shard_key           = managed_namespaces.value.custom_shard_key
      db                         = managed_namespaces.value.db
      is_custom_shard_key_hashed = managed_namespaces.value.is_custom_shard_key_hashed
      is_shard_key_unique        = managed_namespaces.value.is_shard_key_unique
    }
  }
}

