# DevOps Application Deployment

This repo's got everything needed to launch a web app using DevOps methods. Terraform to set up your infrastructure, Jenkins to handle continuous integration and deployment, Docker for containerizing of the app, and Docker Compose to manage multiple containers.

## Repository Structure

/
|-- /terraform
|   |-- main.tf
|
|-- /jenkins
|   |-- Jenkinsfile
|
|-- /app
|   |-- Dockerfile
|   |-- app.js
|   |-- package.json
|
|-- /docker-compose
|   |-- docker-compose.yml
|
|-- deploy.sh
|-- README.md


### Terraform 

**Path:** `/terraform/main.tf`

This file's got Terraform setup for AWS cloud stuff. It lays out VPC, subnets, security groups, and an EC2 instance. Everything's tagged with 'Corporate' to show they're for prod.

### Jenkins 

**Path:** `/jenkins/Jenkinsfile`

covers different stages like checking the code, quality, running unit tests, building, packaging, and deploying. This pipeline automates the task of combining changes and deploying the app to an environment.

### Application Node.js

**Path:** `/app`

folder holds the source code for the app. It has essential files like a Dockerfile for containerizing the app, the primary application file app.js, and the package.json file listing Node.js dependencies.

#### Dockerfile

**Path:** `/app/Dockerfile`

The Dockerfile covers the base image, environment setup, and the command for launching the app.

### Docker Compose (Multi-container Orchestration)

**Path:** `/docker-compose/docker-compose.yml`

This Docker Compose file sets up multiple containers for the web app and its MongoDB database. It handles creating and connecting both the app and database containers.

### Deployment Script

**Path:** `deploy.sh`

The deploy.sh script automates the deployment. It kicks off by initializing and applying the Terraform configuration and proceeds to use Docker Compose for building and launching the application along with its dependencies.

## Usage Instructions

1. **Initialize and Apply Terraform Configuration:**
   Navigate to `/terraform` and execute the following commands:
   ```bash
   terraform init
   terraform apply
