resource "kubernetes_namespace" "api" {
  metadata {
    labels = {
      app = "api"
    }

    name = var.namespace
  }
}

resource "kubernetes_deployment" "api" {
  metadata {
    name      = "api"
    namespace = kubernetes_namespace.api.metadata[0].name
    labels = {
      app = "api"
    }
  }

  spec {
    replicas = var.initial_api_replica

    selector {
      match_labels = {
        app = "api"
      }
    }

    template {
      metadata {
        labels = {
          app = "api"
        }
      }

      spec {
        container {
          image = "${var.api_image_registry}/${var.api_image_name}:${var.api_image_version}"
          name  = "api"

          resources {
            limits = {
              cpu    = var.deployment_cpu_limit
              memory = var.deployment_mem_limit
            }
            requests = {
              cpu    = var.deployment_cpu_request
              memory = var.deployment_mem_request
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 80
            }
            initial_delay_seconds = 3 # to tweak with average application container "spin up" time
            period_seconds        = 3
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "api" {
  metadata {
    name      = "api"
    namespace = kubernetes_namespace.api.metadata[0].name
  }

  spec {
    selector = {
      app = kubernetes_deployment.api.metadata.0.labels.app
    }

    session_affinity = "ClientIP"

    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_horizontal_pod_autoscaler" "api" {
  metadata {
    name      = "api"
    namespace = kubernetes_namespace.api.metadata[0].name
  }

  spec {
    max_replicas = 100
    min_replicas = 1

    scale_target_ref {
      kind = "Deployment"
      name = kubernetes_deployment.api.metadata[0].name
    }

    metric {
      type = "External"
      external {
        metric {
          name = "latency"
          selector {
            match_labels = {
              app = kubernetes_deployment.api.metadata.0.labels.app
            }
          }
        }
        target {
          type  = "Value"
          value = "100"
        }
      }
    }
  }
}