variable "name" {
  type        = string
  description = "The name of the cluster, unique within the project and zone"
}

variable "description" {
  type        = string
  description = "Cluster description"

  default = "K8s cluster"
}

variable "min_master_version" {
  type        = string
  description = "Minimum kubernetes master version"

  default = "1.15.11-gke.3"
}

variable "master_ipv4_cidr_block" {
  type        = string
  description = "Master IPv4 cidr block"

  default = "172.16.0.0/28"
}

variable "enable_private_master" {
  type        = bool
  description = "Enable private master endpoint"

  default = true
}

variable "zone" {
  type        = string
  description = "The zone the master and nodes specified in initial_node_count should be created in"
}

variable "additional_zones" {
  type        = list(string)
  description = "The node pools will be replicated automatically to the additional zones"

  default = []
}

variable "network" {
  type        = string
  description = "The name or self_link of the Google Compute Engine network to which the cluster is connected"
}

variable "subnetwork" {
  type        = string
  description = "The name or self_link of the Google Compute Engine subnetwork to which the cluster is connected"
}

variable "istio" {
  type        = bool
  description = "Enable Istio"

  default = false
}

variable "cloudrun" {
  type        = bool
  description = "Enable Cloud Run"

  default = false
}

variable "pods_range_name" {
  type        = string
  description = "Network range for pods"
}

variable "services_range_name" {
  type        = string
  description = "Network range for services"
}

variable "cluster_autoscaling" {
  type        = list(any)
  description = "Cluster autoscaling config"

  default = [
    {
      enabled = true
      resource_limits = [
        {
          resource_type = "cpu"
          minimum       = 2
          maximum       = 200
        },
        {
          resource_type = "memory"
          minimum       = 8
          maximum       = 400
        }
      ]
    }
  ]
}

variable "database_encryption" {
  type        = list(any)
  description = "ETCD encryption by GKE"

  default = [
    {
      state    = "DECRYPTED"
      key_name = ""
    }
  ]
}

variable "master_authorized_networks_cidr" {
  type        = list(any)
  description = "Master authorized cidr blocks"

  default = [
    {
      cidr_block   = "10.0.0.0/8"
      display_name = "internal"
    }
  ]
}

variable "enable_network_egress_metering" {
  type        = bool
  description = "Setting for deciding the monitoring of resources"

  default = false
}

variable "bigquery_destination_dataset_id" {
  type        = string
  description = "Destination for the monitoring of resources"

  default = "gke_cluster_resource_consumption_usage"
}

variable "labels" {
  type        = map(string)
  description = "The Kubernetes labels to be applied to cluster resources"

  default = {}
}

variable "security_group" {
  type        = list(string)
  description = "Security Group"

  default = []
}

variable "workload_pool" {
  type        = string
  description = "Workload Identity Pool"
}

variable "enable_gateway_api" {
  type        = bool
  description = "(Optional) Enable Gateway API for this Cluster. Defaults to false."

  default = false
}
