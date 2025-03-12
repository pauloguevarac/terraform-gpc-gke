provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {
  required_version = ">= 1.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

resource "google_project_service" "api" {
  for_each = toset(var.apis)
  service  = each.key

  disable_on_destroy = false
}

module "vpc" {
  source                     = "./modules/vpc"
  google_project_service_api = google_project_service.api
}

module "subnets" {
  source                 = "./modules/subnets"
  public_subnets         = var.public_subnets
  private_subnets        = var.private_subnets
  region                 = var.region
  google_compute_network = module.vpc.vpc
}

module "nat" {
  source                     = "./modules/nat"
  region                     = var.region
  google_project_service_api = google_project_service.api
  google_compute_network     = module.vpc.vpc
  google_compute_subnetwork  = module.subnets.private_subnetwork_name[0]
}

module "firewalls" {
  source                 = "./modules/firewalls"
  google_compute_network = module.vpc.vpc
}
module "gke" {
  source                    = "./modules/gke"
  project_id                = var.project_id
  region                    = var.region
  google_compute_network    = module.vpc.vpc
  google_compute_subnetwork = module.subnets.private_subnetwork_name[0]
  cluster_name              = var.cluster_name
}

module "gke-nodes" {
  source                   = "./modules/gke-nodes"
  project_id               = var.project_id
  google_container_cluster = module.gke.google_container_cluster

}
