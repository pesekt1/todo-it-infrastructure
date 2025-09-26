#!/bin/bash

#Run: bash kubernetes.deployment.sh

# Apply all Kubernetes configurations from the directory
kubectl apply -f kubernetes/

# Function to wait for a pod to be ready
wait_for_pod() {
  local label=$1
  echo "Waiting for pod with label $label to be ready..."
  kubectl wait --for=condition=ready pod -l $label --timeout=120s
}

# Wait for the mongo pod to be ready
wait_for_pod "app=mongo"

# Port forward for mongo service
kubectl port-forward svc/mongo 27018:27017 &
MONGO_PORT_FORWARD_PID=$!
echo "Port forwarding for mongo set up on port 27018."

# Wait for the todo-app pod to be ready
wait_for_pod "app=todo-app"

# Port forward for todo-app service
kubectl port-forward svc/todo-app 3000:3000 &
TODO_APP_PORT_FORWARD_PID=$!
echo "Port forwarding for todo-app set up on port 3000."

# Wait for the todo-api pod to be ready
wait_for_pod "app=todo-api"

# Port forward for todo-api service
kubectl port-forward svc/todo-api 5000:5000 &
TODO_API_PORT_FORWARD_PID=$!
echo "Port forwarding for todo-api set up on port 5000."

# Function to clean up port-forward processes
cleanup() {
  echo "Terminating port-forward processes..."
  kill $MONGO_PORT_FORWARD_PID $TODO_APP_PORT_FORWARD_PID $TODO_API_PORT_FORWARD_PID 2>/dev/null
  exit
}

# Trap script exit (Ctrl+C) to clean up
trap cleanup SIGINT SIGTERM

# Keep script running until user terminates
echo "Port forwarding set up. Press Ctrl+C to terminate."
wait

# To terminate all the deployments:
# kubectl delete -f kubernetes/