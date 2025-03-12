variable "region" {
  description = "The region to deploy resources to"
  type        = string
}

variable "google_compute_network" {
  description = "The VPC network to deploy resources to"
  #  type        = string
}

variable "public_subnets" {
  description = "The CIDR range for the public subnet"
  type        = list(string)
}

variable "private_subnets" {
  description = "The CIDR range for the private subnet"
  type        = list(string)

}
