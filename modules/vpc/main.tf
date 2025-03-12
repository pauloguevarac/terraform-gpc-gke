resource "google_compute_network" "vpc" {
  name                            = "main"
  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true

  depends_on = [var.google_project_service_api]
}

# Remove this route to make the VPC fully private.
# You need this route for the NAT gateway.
resource "google_compute_route" "default_route" {
  name             = "internet-route"
  dest_range       = "0.0.0.0/0"
  network          = google_compute_network.vpc.name
  next_hop_gateway = "default-internet-gateway"
}
