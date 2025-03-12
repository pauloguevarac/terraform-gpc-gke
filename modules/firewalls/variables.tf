variable "google_compute_network" {
  description = "The VPC network to deploy resources to"
  type = object({
    id = string
  })

}
