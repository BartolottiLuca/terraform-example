terraform {
  backend "gcp" {
    bucket = "project-${var.project_id}-terraform-states"
    prefix = "api"
  }
}