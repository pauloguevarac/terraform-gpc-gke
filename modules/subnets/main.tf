resource "google_compute_subnetwork" "public" {
  count                    = length(var.public_subnets)
  name                     = "public-subnet-${count.index}"
  ip_cidr_range            = var.public_subnets[count.index]
  network                  = var.google_compute_network.id
  region                   = var.region
  private_ip_google_access = true
  stack_type               = "IPV4_ONLY"
}

resource "google_compute_subnetwork" "private" {
  count                    = length(var.private_subnets)
  name                     = "private-subnet-${count.index}"
  ip_cidr_range            = var.private_subnets[count.index]
  network                  = var.google_compute_network.id
  region                   = var.region
  private_ip_google_access = true
  stack_type               = "IPV4_ONLY"
  secondary_ip_range {
    range_name    = "k8s-pods"
    ip_cidr_range = "172.16.0.0/14"
  }

  secondary_ip_range {
    range_name    = "k8s-services"
    ip_cidr_range = "172.20.0.0/18"
  }
}
