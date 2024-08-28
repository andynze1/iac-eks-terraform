resource "helm_release" "grafana" {
  name             = "grafana"
  repository       = "https://grafana.github.io/helm-charts"
  chart            = "grafana"
  namespace        = var.namespace_monitoring # kubernetes_namespace.monitor_namespace.metadata[0].name
  version          = var.grafana_version
  create_namespace = false
  values = [
    file("${path.module}/kubernetes-yaml-files/grafana.yaml"),
    # yamlencode(var.settings_grafana)
  ]

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "adminPassword"
    value = var.grafana_admin_password
  }

  depends_on = [kubernetes_namespace.monitoring]
}
  ################################
  #   set {
  #     name  = "persistence.enabled"
  #     value = "true"
  #   }

  #   set {
  #     name  = "persistence.storageClassName"
  #     value = "prometheus"  # Ensure this matches your actual StorageClass
  #   }

  #   set {
  #     name  = "persistence.size"
  #     value = "10Gi"
  #   }

  ################################