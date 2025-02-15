#!/bin/bash

# Start Minikube
echo "Starting Minikube..."
minikube start

# Enable Minikube's Docker daemon
echo "Enabling Minikube's Docker daemon..."
eval $(minikube docker-env)

# Build Docker images
echo "Building Docker images..."
docker build -t frontend-app:1.0 ./frontend
docker build -t backend-app:1.0 ./backend

# Tag and push images to IBM Cloud Container Registry (optional)
# Uncomment and replace placeholders if using IBM Cloud
# echo "Tagging and pushing Docker images to IBM Cloud Container Registry..."
# docker tag frontend-app:1.0 <region>.icr.io/<namespace>/frontend-app:1.0
# docker tag backend-app:1.0 <region>.icr.io/<namespace>/backend-app:1.0
# docker push <region>.icr.io/<namespace>/frontend-app:1.0
# docker push <region>.icr.io/<namespace>/backend-app:1.0

# Deploy to Kubernetes
echo "Deploying applications to Kubernetes..."
kubectl apply -f k8s/

# Verify deployments
echo "Verifying deployments..."
kubectl get pods
kubectl get svc

# Access the application
echo "Access the application using the following commands:"
echo "Frontend: minikube service frontend-service --url"
echo "Backend: minikube service backend-service --url"