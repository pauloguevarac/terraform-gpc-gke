variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string

}
variable "project_id" {
  description = "The project ID to deploy resources to"
  type        = string

}
variable "region" {
  description = "The region to deploy resources to"
  type        = string

}
variable "google_compute_network" {
  description = "The VPC network to deploy resources to"
  type = object({
    id = string
  })

}
variable "google_compute_subnetwork" {
  description = "The VPC subnetwork to deploy resources to"
  type = object({
    self_link = string
  })

}
