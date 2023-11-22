# tfsec:ignore:google-gke-node-metadata-security tfsec:ignore:google-gke-use-service-account
resource "google_container_node_pool" "pool" {
  provider = google-beta

  name = var.name

  location = var.zone

  cluster = var.cluster

  initial_node_count = var.node_count

  management {
    auto_repair  = var.auto_repair
    auto_upgrade = var.auto_upgrade
  }

  autoscaling {
    min_node_count = var.node_count_min
    max_node_count = var.node_count_max
  }

  node_config {
    image_type = var.image_type

    machine_type = var.machine_type

    disk_type       = var.disk_type
    disk_size_gb    = var.disk_size_gb
    local_ssd_count = var.local_ssd_count

    metadata = {
      disable-legacy-endpoints = "true"
    }

    preemptible = var.preemptible

    dynamic "taint" {
      for_each = var.taint

      content {
        key    = taint.value.key
        value  = taint.value.value
        effect = taint.value.effect
      }
    }

    labels = var.labels

    oauth_scopes = var.oauth_scopes

    tags = [
      "${var.cluster}-cluster",
      "${var.name}-pool",
      "nodes"
    ]
  }

  lifecycle {
    ignore_changes = [
      initial_node_count,
    ]
  }
}
