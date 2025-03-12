resource "google_compute_firewall" "allow_iap_ssh" {
  name    = "allow-ssh"
  network = var.google_compute_network.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["187.188.253.86/32"]
}
