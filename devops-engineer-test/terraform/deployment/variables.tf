variable "namespace" {
  default = "api"
}

variable "api_image_registry" {
  default = "eu.gcr.io/production-project-id"
}

variable "api_image_name" {
  default = "api"
}

variable "api_image_version" {
  default = "1.0.0"
}

variable "initial_api_replica" {
  default = 2
}