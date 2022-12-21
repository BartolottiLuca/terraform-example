## assume following firewall rules:
##  - deny all egress     priority 100
##  - deny all ingress    priority 100
##  - allow ingress on LB on port 80/443  priority 1000
##  - allow ingress from LB to gke nodepool priority 1000
##  - allow egress from gke nodepool to external DB priority 1000



resource "google_compute_network" "gke_network" {
  name                    = var.network_name
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "gke_subnetwork" {
  name                     = var.network_name
  ip_cidr_range            = var.gke_cidr_range
  network                  = google_compute_network.gke-network.self_link
  region                   = var.region
  private_ip_google_access = true
}