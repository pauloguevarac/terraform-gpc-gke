resource "google_compute_address" "nat" {
  name         = "nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  depends_on   = [var.google_project_service_api]

}

resource "google_compute_router" "router" {
  name    = "router"
  region  = var.region
  network = var.google_compute_network.id
}

resource "google_compute_router_nat" "nat" {
  name   = "nat"
  region = var.region
  router = google_compute_router.router.name

  nat_ip_allocate_option             = "MANUAL_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ips                            = [google_compute_address.nat.self_link]

  subnetwork {
    name                    = var.google_compute_subnetwork.self_link
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
