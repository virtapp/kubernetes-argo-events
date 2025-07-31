
![argo-events-architecture](https://github.com/user-attachments/assets/8597f49a-0b00-4045-b48a-32dada887ee4)


## Argo Events | The Event-driven Workflow Automation Framework 🚀
Argo Events is an event-driven workflow automation framework for Kubernetes which helps you trigger K8s objects, Argo Workflows, Serverless workloads, etc. on events from a variety of sources like webhooks, S3, schedules, messaging queues, gcp pubsub, sns, sqs, etc.


🎯  Key Features
```
✅ Supports events from 20+ event sources
✅ Ability to customize business-level constraint logic for workflow automation
✅ Manage everything from simple, linear, real-time to complex, multi-source events
✅ Supports Kubernetes Objects, Argo Workflow, AWS Lambda, Serverless, etc. as triggers
✅ CloudEvents Compliant
```

🧩  Triggers
```
Argo Workflows
Standard K8s Objects
HTTP Requests / Serverless Workloads (OpenFaaS, Kubeless, KNative etc.)
AWS Lambda
NATS Messages
Kafka Messages
Slack Notifications
Azure Event Hubs Messages
Argo Rollouts
Custom Trigger / Build Your Own Trigger
Apache OpenWhisk
Log Trigge
```

🚀 
```
terraform init
terraform validate
terraform plan -var-file="template.tfvars"
terraform apply -var-file="template.tfvars" -auto-approve
```





