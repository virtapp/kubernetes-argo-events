
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
