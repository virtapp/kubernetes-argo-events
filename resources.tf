
provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "nginx" {
  name       = "nginx"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"
  namespace  = "ingress-nginx"
  create_namespace = true
  # Optional: override default chart values
  values = [
    <<EOF
replicaCount: 2
service:
  type: LoadBalancer
EOF
  ]
  depends_on = [null_resource.k3s_status]
}

resource "helm_release" "argo_events" {
  name       = "argo-events"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-events"
  namespace  = "argo-events"
  version    = "2.4.9"  # Replace with the latest if needed
  create_namespace = true

  #values = [
  #  file("argo-events-values.yaml")  # optional, see below
  #]
  depends_on = [null_resource.k3s_status]
}
