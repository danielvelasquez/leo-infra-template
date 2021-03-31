#Authenticate terraform to kubernetes
provider "kubernetes" {
    host                   = var.host
    client_certificate     = var.client_certificate
    client_key             = var.client_key
    cluster_ca_certificate = var.cluster_ca_certificate
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_pod" "web" {
  metadata {
    name = "nginx"

    labels = {
      name = "nginx"
    }

    namespace = kubernetes_namespace.namespace.metadata.0.name
  }

  spec {
    container {
              image = "nginx:1.19"
              name = "web"

              resources {
                  limits = {
                      cpu = "0.5"
                      memory = "523Mi"
                  }
                  
                  requests = {
                      cpu = "250m"
                      memory = "50Mi"
                  }
              }
              liveness_probe {
                  http_get {
                      path = "/" 
                      #path = "/nginx_status"
                      port = 80

                      http_header {
                          name = "X-Custom-Header"
                          value = "Awesome"
                      }
                  }

                  initial_delay_seconds =3
                  period_seconds        =3
              }
          }
  }
}

resource "kubernetes_service" "web" {
  metadata {
    name      = "nginx"
    namespace = kubernetes_namespace.namespace.metadata.0.name
  }

  spec {
    selector = {
      name = kubernetes_pod.web.metadata.0.labels.name
    }

    session_affinity = "ClientIP"

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}