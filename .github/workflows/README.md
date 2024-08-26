**Overview**

This workflow uses GitHub-hosted runners (ubuntu-latest) instead of self-hosted runners.
The primary reason for this choice is to avoid the complexities and potential issues associated
with running Docker and Minikube on a self-hosted Windows machine.
# 
While self-hosted runners can offer more control and potentially lower costs, they can also
introduce challenges related to environment setup and maintenance. In particular:
#
1. **Docker Installation and Configuration**: Docker on Windows can be less straightforward to configure
    compared to Linux environments. Issues such as compatibility with WSL2, Docker daemon setup, and
    network configuration can be cumbersome and time-consuming to resolve.
#
2. **Minikube on Windows**: Running Minikube on Windows can involve additional complications, such as
    managing virtualization requirements, network configurations, and performance tuning. 
    This often requires significant setup and troubleshooting efforts that can be avoided by using
    a pre-configured Linux environment in GitHub-hosted runners.
#
By utilizing GitHub-hosted runners, the workflow benefits from a consistent and well-supported
environment that is maintained by GitHub. This approach simplifies the setup, reduces the potential
for environment-specific issues, and allows me to focus on development and deployment tasks
rather than dealing with infrastructure challenges **as the time to deliver the task is limited.** 

**Handling Different Environments**

Environment Selection: The user selects the environment (qa or prd) when triggering the workflow. This selection drives the rest of the pipeline.

**Environment-Specific Variables**: The ENVIRONMENT variable, set at the start of the pipeline, is used to customize the namespace, Helm values file, and other environment-specific settings.

**Environment-Specific Helm Values**: The deployment step uses a Helm values file that corresponds to the selected environment. This allows for environment-specific configurations, such as different resource limits, replica counts, or environment variables.

**Pipeline Tasks**

**1. Triggering the Pipeline**

The pipeline is manually triggered using workflow_dispatch. When starting the workflow, the user selects the target environment (qa or prd) from a list. This selection determines which environment the deployment will target.

**2. Setting Up the Environment**

*Set Environment Variable*: The selected environment is stored in the ENVIRONMENT variable, which is used throughout the pipeline to customize the deployment process based on the selected environment.

**3. Checkout code**
The code repository is checked out using the actions/checkout@v4 action. This step ensures that the latest code is available for building and deployment.

**4. Install Docker**
Docker is installed on the GitHub runner. This includes the Docker CLI, container runtime, and plugins necessary for building and managing Docker images.

**5. Start minikube**
Minikube is started using the medyagh/setup-minikube@latest action. Minikube provides a local Kubernetes cluster on which the application will be deployed.

**6. Create Kubernetes namespace**
A Kubernetes namespace is created (or reused if it already exists) based on the selected environment. This ensures that the deployment is isolated within the appropriate environment.

**7. Build image**
The Docker image for the application is built using the Dockerfile in the repository. The image is tagged as nginx:latest.

**8. Deploy to Kubernetes**
The application is deployed to the Minikube cluster using Helm. The deployment is customized based on the selected environment by applying the appropriate Helm values file (e.g., values-qa.yaml or values-prd.yaml). Helm manages the release, and the deployment is given a name that includes the environment.

**9. Wait for Pods to be Ready**
The pipeline waits until the deployed Pods are in a ready state. This ensures that the application is fully up and running before proceeding.

**10. Get Pods**
The status of the Pods in the specified namespace is retrieved and displayed. This provides insight into the current state of the application within the cluster.

**11. Access Service via NodePort**
The pipeline retrieves the NodePort of the deployed service and attempts to access the application using the Minikube IP and the retrieved NodePort. This step verifies that the service is accessible and working with **Status Code of**: *200*.