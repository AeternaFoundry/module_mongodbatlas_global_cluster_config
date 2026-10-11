variable "global_cluster_configs" {
  description = <<EOT
Map of global_cluster_configs, attributes below
Required:
    - cluster_name
    - project_id
Optional:
    - custom_zone_mappings (block):
        - location (optional)
        - zone (optional)
    - managed_namespaces (block):
        - collection (required)
        - custom_shard_key (required)
        - db (required)
        - is_custom_shard_key_hashed (optional)
        - is_shard_key_unique (optional)
EOT

  type = map(object({
    cluster_name = string
    project_id   = string
    custom_zone_mappings = optional(list(object({
      location = optional(string)
      zone     = optional(string)
    })))
    managed_namespaces = optional(list(object({
      collection                 = string
      custom_shard_key           = string
      db                         = string
      is_custom_shard_key_hashed = optional(bool)
      is_shard_key_unique        = optional(bool)
    })))
  }))
}

