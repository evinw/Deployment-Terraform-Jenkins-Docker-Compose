#!/bin/bash

echo "deploying infra"
cd terraform
terraform init
terraform apply -auto-approve
cd ..

echo "building and deploying app"
cd docker-compose
docker-compose up --build -d
cd ..

echo "Deployment of infra and app completed."