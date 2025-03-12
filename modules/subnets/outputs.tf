

output "public_subnetwork_name" {
  value = google_compute_subnetwork.public[*]
}

output "private_subnetwork_name" {
  value = google_compute_subnetwork.private[*]
}
