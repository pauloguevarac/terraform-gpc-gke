variable "project_id" {
  description = "The project ID to deploy resources to"
  type        = string

}
variable "google_container_cluster" {
  description = "The GKE cluster to deploy resources to"
  type = object({
    name = string
  })

}
