**Overview**

This repository provides a deployment pipeline configuration for deploying applications to a Kubernetes cluster using GitHub Actions. The pipeline supports deployment to different environments (e.g., qa, prd) and utilizes Minikube for local Kubernetes clusters. This document will guide you through setting up, configuring, and running the pipeline.

**Table of Contents**

*Prerequisites*
1. Repository Structure
2. Kubernetes Configuration
3. GitHub Actions Workflow
4. How to Deploy

**Prerequisites**

Before using the pipeline, ensure you have the following:

*Kubernetes Cluster*:

A Kubernetes cluster running locally (Minikube) or in a cloud environment.

*GitHub Account*:

Access to a GitHub repository where the deployment pipeline will be configured.

**Tools**:

*kubectl*: Kubernetes command-line tool.
*helm*: Kubernetes package manager.
*docker*: Container platform for building images.
*minikube*: Tool to run Kubernetes clusters locally (if using Minikube).

**Repository Structure**

webapp/

├── .github/

│   ├── workflows/

│       ├── k8s-deployment.yaml

├── templates/

│   ├── configmap.yaml

│   ├── deployment.yaml

│   └── NOTES.txt

│   └── service.yaml

├── .helmignore

├── Chart.yaml

├── Dockerfile

├── index.html

├── README.md

├── values-prd.yaml

├── values-qa.yaml

└── values.yaml

**Kubernetes Manifests**

*configmap.yaml*: Configuration data used by the application.
*deployment.yaml*: Deployment configuration, specifying the application's pods and replicas.
*service.yaml*: Service configuration for exposing the application.

**Helm Charts**

The Helm charts are used to deploy the application with environment-specific configurations. The values.yaml file contains default values, while values-qa.yaml and values-prd.yaml override these values for QA and production environments, respectively.

**GitHub Actions Workflow**

The GitHub Actions workflow is defined in .github/workflows/k8s-deployment.yml and automates the deployment process. You can find more details about the Pipeline in the README.md file located in .github/workflows/README.md 