**User-Choice-Platform-Tasks**

This repository provides a modular Terraform setup that allows users to deploy Virtual Machines, Kubernetes Clusters, and Serverless Engines on AWS, Azure, and GCP. The user can specify the desired deployment platform (VM, Kubernetes, or Serverless Engine) and cloud provider (AWS, Azure, GCP) through the variables.tf file, and Terraform will automatically provision the respective resources on the selected cloud platform.

**Table of Contents**
+ Project Structure
+ Deployment Example


##Project Structure
```plaintext
User-Choice-Platform-Tasks
├── Virtual-Machines
│   ├── AWS
│   │   ├── AWS-VM.tf
│   │   └── AWS-VM-Variables.tf
│   ├── Azure
│   │   ├── Azure-VM.tf
│   │   └── Azure-VM-Variables.tf
│   ├── GCP
│   │   ├── GCP-VM.tf
│   │   └── GCP-VM-Variables.tf
│   ├── vm-main.tf
│   └── vm-variables.tf
│
├── Kubernetes-Cluster
│   ├── AWS
│   │   ├── AWS-Cluster.tf
│   │   └── AWS-Cluster-Variables.tf
│   ├── Azure
│   │   ├── Azure-Cluster.tf
│   │   └── Azure-Cluster-Variables.tf
│   ├── GCP
│   │   ├── GCP-Cluster.tf
│   │   └── GCP-Cluster-Variables.tf
│   ├── kubernetes-main.tf
│   └── kubernetes-variables.tf
│
├── Serverless-Engine
│   ├── AWS
│   │   ├── AWS-Engine.tf
│   │   └── AWS-Engine-Variables.tf
│   ├── Azure
│   │   ├── Azure-Engine.tf
│   │   └── Azure-Engine-Variables.tf
│   ├── GCP
│   │   ├── GCP-Engine.tf
│   │   └── GCP-Engine-Variables.tf
│   ├── Engine-main.tf
│   └── Engine-variables.tf
│
├── provider.tf
├── main.tf
└── variables.tf


Deployment Example Image

![Diagram Description](Explanation-Picture.PNG)

C:\Users\PasupathiKumarS\OneDrive - C2S Technologies Inc\Desktop\DevOps\terraform_codes\Userchoice-tasks\kuberentes-cluster\AWS-Cluster