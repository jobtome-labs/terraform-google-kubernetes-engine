# tfsec:ignore:google-gke-enforce-pod-security-policy
resource "google_container_cluster" "cluster" {
  provider = google-beta

  name        = var.name
  description = var.description

  location       = var.zone
  node_locations = var.additional_zones

  network    = var.network
  subnetwork = var.subnetwork

  min_master_version = var.min_master_version

  enable_shielded_nodes = true

  remove_default_node_pool = true

  initial_node_count = 1

  dynamic "database_encryption" {
    for_each = [for s in var.database_encryption : {
      state    = s.state
      key_name = s.key_name
      }
    ]

    content {
      state    = database_encryption.value.state
      key_name = database_encryption.value.key_name
    }
  }

  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  dynamic "cluster_autoscaling" {
    for_each = var.cluster_autoscaling

    content {
      enabled = cluster_autoscaling.value.enabled

      dynamic "resource_limits" {
        for_each = lookup(cluster_autoscaling.value, "resource_limits", [])

        content {
          maximum       = lookup(resource_limits.value, "maximum", null)
          minimum       = lookup(resource_limits.value, "minimum", null)
          resource_type = resource_limits.value.resource_type
        }
      }
    }
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pods_range_name
    services_secondary_range_name = var.services_range_name
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  master_authorized_networks_config {
    dynamic "cidr_blocks" {
      for_each = var.master_authorized_networks_cidr

      content {
        cidr_block   = cidr_blocks.value.cidr_block
        display_name = lookup(cidr_blocks.value, "display_name", null)
      }
    }
  }

  workload_identity_config {
    workload_pool = var.workload_pool
  }

  dynamic "gateway_api_config" {
    for_each = var.enable_gateway_api ? [1] : []

    content {
      channel = "CHANNEL_STANDARD"
    }
  }

  enable_legacy_abac = false

  network_policy {
    enabled  = true
    provider = "CALICO"
  }

  dynamic "authenticator_groups_config" {
    for_each = var.security_group

    content {
      security_group = authenticator_groups_config.value
    }
  }

  private_cluster_config {
    enable_private_endpoint = var.enable_private_master
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

  maintenance_policy {
    recurring_window {
      start_time = "2019-01-01T09:00:00Z"
      end_time   = "2019-01-01T17:00:00Z"
      recurrence = "FREQ=WEEKLY;BYDAY=MO,TU,WE,TH"
    }
  }

  vertical_pod_autoscaling {
    enabled = true
  }

  addons_config {
    http_load_balancing {
      disabled = false
    }
    network_policy_config {
      disabled = false
    }
    istio_config {
      disabled = false == var.istio
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
    cloudrun_config {
      disabled = false == var.cloudrun
    }
  }

  resource_usage_export_config {
    enable_network_egress_metering = var.enable_network_egress_metering

    bigquery_destination {
      dataset_id = var.bigquery_destination_dataset_id
    }
  }

  resource_labels = var.labels

  lifecycle {
    ignore_changes = [
      maintenance_policy
    ]
  }
}
