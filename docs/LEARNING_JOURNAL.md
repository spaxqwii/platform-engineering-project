# Learning Journal - Allan

## Week 1: Foundation
### Day 1:
- [ ] Set up enhanced Minikube cluster
- [ ] Created project structure
- [ ] Installed essential tools
- [ ] Deployed first "production-like" app
- [ ] Learned: Multi-node setup, resource limits, probes

### Questions to Research:
1. What's the difference between liveness and readiness probes?
2. How do resource requests/limits affect scheduling?
3. What does "ClusterIP" vs "NodePort" mean?

### Commands I Learned Today:
```bash
minikube start --nodes=2
kubectl apply -f deployment.yaml
kubectl get pods --all-namespaces