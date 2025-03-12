variable "project_id" {
  description = "The project ID to deploy resources to"
  type        = string
}
variable "region" {
  description = "The region to deploy resources to"
  type        = string
}

variable "apis" {
  description = "The list of APIs to enable"
  type        = list(string)

}

variable "public_subnets" {
  description = "List of public subnet CIDR ranges"
  type        = list(string)
  default     = ["10.0.0.0/19"]
}

variable "private_subnets" {
  description = "List of private subnet CIDR ranges"
  type        = list(string)
  default     = ["10.0.32.0/19"]
}
variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string

}
