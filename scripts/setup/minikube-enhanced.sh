#!/bin/bash
echo "🚀 Setting up Enhanced Minikube Cluster..."

# Stop any existing cluster
minikube stop 2>/dev/null || true

# Start with more resources
minikube start \
  --cpus=4 \
  --memory=8192 \
  --disk-size=20g \
  --driver=docker \
  --nodes=2 \
  --kubernetes-version=v1.26.0

echo "✅ Minikube started with 2 nodes"

# Enable essential addons
minikube addons enable ingress
minikube addons enable ingress-dns
minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable storage-provisioner
minikube addons enable default-storageclass

echo "📦 Installing prerequisites..."
# Install Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Create namespaces
kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -
kubectl create namespace monitoring --dry-run=client -o yaml | kubectl apply -f -
kubectl create namespace istio-system --dry-run=client -o yaml | kubectl apply -f -
kubectl create namespace apps --dry-run=client -o yaml | kubectl apply -f -

echo "🎉 Enhanced Minikube setup complete!"
echo ""
echo "📊 Cluster Info:"
minikube status
echo ""
echo "🔗 Dashboard URL:"
minikube dashboard --url
