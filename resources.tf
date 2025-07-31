
provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "argo_events" {
  name       = "argo-events"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-events"
  namespace  = "argo-events"
  version    = "2.7.1"  # Replace with the latest if needed
  create_namespace = true

  #values = [
  #  file("argo-events-values.yaml")  # optional, see below
  #]
  depends_on = [null_resource.install_k3s]
}
