![events-thumbnail](https://github.com/user-attachments/assets/e8b6afc2-6eea-4ddb-a6c6-2969e9e33051)



## Argo Events | The Event-driven Workflow Automation Framework 🚀
Argo Events is an event-driven workflow automation framework for Kubernetes which helps you trigger K8s objects, Argo Workflows, Serverless workloads, etc. on events from a variety of sources like webhooks, S3, schedules, messaging queues, gcp pubsub, sns, sqs, etc


🎯  Key Features
```
✅ ArgoCD Provider in Terraform
✅ ArgoCD Application Deployment using Terraform
✅ ArgoCD Repository using Terraform
```

🚀 
```
terraform init
terraform validate
terraform plan -var-file="template.tfvars"
terraform apply -var-file="template.tfvars" -auto-approve
```

🧩 Ingress Example 

```
resource "kubernetes_ingress_v1" "my_app_ingress" {
  metadata {
    name      = "my-app-ingress"
    namespace = "default"
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    rule {
      host = "my-app.example.com"

      http {
        path {
          path     = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "my-app-service"  # the service Argo CD deploys
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }

  depends_on = [argocd_application.my_app]  # ensure Argo CD app is created first
}
```

