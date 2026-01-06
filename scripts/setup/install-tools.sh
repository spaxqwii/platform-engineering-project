#!/bin/bash
echo "🔧 Installing Essential Tools..."

# Kubectl plugins
echo "📦 Installing kubectl plugins..."
curl -LO https://github.com/robscott/kube-capacity/releases/download/v0.7.0/kube-capacity_0.7.0_Linux_x86_64.tar.gz
tar -xzf kube-capacity_0.7.0_Linux_x86_64.tar.gz
sudo mv kube-capacity /usr/local/bin/

# K9s terminal UI
curl -sS https://webinstall.dev/k9s | bash

# Kubectl neat (clean up manifests)
curl -s https://raw.githubusercontent.com/itaysk/kubectl-neat/master/install.sh | bash

# Helm plugins
helm plugin install https://github.com/databus23/helm-diff
helm plugin install https://github.com/helm/helm-mapkubeapis

# Kubernetes tools
kubectl krew install access-matrix
kubectl krew install view-utilization
kubectl krew install ns

echo "✅ Tools installed!"
echo ""
echo "📋 Available tools:"
echo "- k9s: Terminal UI"
echo "- kube-capacity: Resource viewer"
echo "- kubectl neat: Manifest cleaner"
echo "- Helm plugins: diff, mapkubeapis"