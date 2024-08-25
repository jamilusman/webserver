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
for environment-specific issues, and allows the team to focus on development and deployment tasks
rather than dealing with infrastructure challenges.