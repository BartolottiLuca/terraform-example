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

variable "deployment_cpu_limit" {
  default = "3"
}

variable "deployment_mem_limit" {
  default = "3GB"
}

variable "deployment_cpu_request" {
  default = "1"
}

variable "deployment_mem_request" {
  default = "1GB"
}
