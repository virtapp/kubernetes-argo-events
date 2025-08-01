
![argo-events-architecture](https://github.com/user-attachments/assets/8597f49a-0b00-4045-b48a-32dada887ee4)


## Argo Events | Kubernetes ☸️
Argo Events is an event-driven workflow automation framework for Kubernetes which helps you trigger K8s objects, Argo Workflows, Serverless workloads, etc. on events from a variety of sources like webhooks, S3, schedules, messaging queues, gcp pubsub, sns, sqs, etc.


🧱 Core Components
```
✅ EventSource ( Defines an external system to listen to e.g. GitHub Webhook, S3, Kafka, Cron, etc.)
✅ Sensor ( Defines what to do when an event is received e.g. trigger a Workflow or Job )
✅ EventBus ( Provides pub/sub message delivery internally between EventSources and Sensors e.g. NATS )

```

🔌 Supported Event Sources
```
GitHub / GitLab / Bitbucket Webhooks
S3 (MinIO, AWS)
Kafka / NATS / MQTT / AMQP
Webhooks (HTTP)
Calendar/Cron (scheduled events)
GCP Pub/Sub, AWS SNS/SQS
Kubernetes CRDs (like Velero backup events)
```

🚀 
```
terraform init
terraform validate
terraform plan -var-file="template.tfvars"
terraform apply -var-file="template.tfvars" -auto-approve
```





