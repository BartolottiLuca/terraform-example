
resource "google_container_cluster" "gke" {
  name               = var.network_name
  location           = var.region # regional cluster, on all zones in the region
  initial_node_count = 3
  network            = google_compute_network.gke_network.name
  subnetwork         = google_compute_subnetwork.gke_subnetwork.name

  node_config {
    tags = [var.node_tag]
  }
}
