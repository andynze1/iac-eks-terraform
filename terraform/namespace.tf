resource "time_sleep" "wait_for_kubernetes" {

  depends_on = [
    module.eks
  ]

  create_duration = "20s"
}

resource "kubernetes_namespace" "prometheus" {
  depends_on = [time_sleep.wait_for_kubernetes]
  metadata {

    name = "prometheus"
  }
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

# Resource: k8s dev namespace creation
resource "kubernetes_namespace_v1" "k8s_dev" {
  metadata {
    name = "dev"
  }
}


# resource "helm_release" "grafana" {
#   name             = "grafana"
#   repository       = "https://grafana.github.io/helm-charts"
#   chart            = "grafana"
#   namespace        = var.namespace_monitoring # kubernetes_namespace.monitor_namespace.metadata[0].name
#   version          = var.grafana_version
#   create_namespace = false
#   values = [
#     file("${path.module}/yaml-helm/grafana.yaml"),
#     # yamlencode(var.settings_grafana)
#   ]

#   set {
#     name  = "service.type"
#     value = "LoadBalancer"
#   }

#   set {
#     name  = "adminPassword"
#     value = var.grafana_admin_password
#   }

#   depends_on = [kubernetes_namespace.monitor_namespace]
# }


