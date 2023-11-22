variable "name" {
  type        = string
  description = "The name of the Node Pool"
}

variable "zone" {
  type        = string
  description = "In which zone to create the Node Pool"
}

variable "node_count" {
  type        = number
  description = "The number of nodes to create in this Node Pool"

  default = 3
}

variable "node_count_max" {
  type        = number
  description = "The max number of nodes to create in autoscaling mode"

  default = 10
}

variable "node_count_min" {
  type        = number
  description = "The min number of nodes to create in autoscaling mode"

  default = 1
}

variable "cluster" {
  type        = string
  description = "Name of the cluster to which to add this Node Pool"
}

variable "oauth_scopes" {
  type        = list(string)
  description = "Oauth scope on Google AMI"

  default = [
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
    "https://www.googleapis.com/auth/servicecontrol",
    "https://www.googleapis.com/auth/service.management.readonly",
    "https://www.googleapis.com/auth/trace.append",
  ]
}

variable "machine_type" {
  type        = string
  description = "The type of machine to use for nodes in the pool"

  default = "n1-standard-1"
}

variable "disk_type" {
  type        = string
  description = "The type of disk to use for nodes in the pool"

  default = "pd-ssd"
}

variable "disk_size_gb" {
  type        = string
  description = "Disk of which size to attach to the nodes in the pool"

  default = "50"
}

variable "local_ssd_count" {
  type        = string
  description = "The amount of local SSD disks that will be attached to each cluster node"

  default = "0"
}

variable "image_type" {
  type        = string
  description = "The image type to use for nodes."

  default = "COS"
}

variable "preemptible" {
  type        = bool
  description = "Use preemptible nodes"

  default = false
}

variable "auto_upgrade" {
  type        = bool
  description = "Activate auto upgrade on nodes"

  default = true
}

variable "auto_repair" {
  type        = bool
  description = "Activate auto repair on nodes"

  default = true
}

variable "labels" {
  type        = map(string)
  description = "The Kubernetes labels to be applied to each node"

  default = {}
}

variable "taint" {
  type        = list(any)
  description = "Add a taint to a node"

  default = []
}

variable "node_metadata" {
  type        = string
  description = "Node Metadata"
}
