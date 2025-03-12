variable "google_project_service_api" {
  description = "The project services to enable"
  type = map(object({
    service            = string
    disable_on_destroy = bool
  }))

}
