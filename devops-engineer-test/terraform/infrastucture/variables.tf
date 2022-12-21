variable "project_id" {}
variable "region" {}


variable "network_name" {
  default = "gke-network"
}

variable "gke_cidr_range" {
  default = "10.125.0.0/20"
}

variable "node_tag" {
  default = "gke-node"
}
