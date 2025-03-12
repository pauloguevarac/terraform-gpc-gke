variable "region" {
  description = "The region to deploy resources to"
  type        = string
}
variable "google_project_service_api" {
  description = "The project services to enable"
  type = map(object({
    service            = string
    disable_on_destroy = bool
  }))

}
variable "google_compute_network" {
  description = "The VPC network to deploy resources to"
  type = object({
    id = string
  })

}
variable "google_compute_subnetwork" {
  description = "The subnetwork to deploy resources to"
  type = object({
    self_link = string
  })

}
