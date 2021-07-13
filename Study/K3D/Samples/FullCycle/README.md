# Full Cycle 

Tips from Youtube channel of Full Cycle

```
k3d cluster create -p "8000:30000@loadbalancer" --agents 2 
kubectl config use-context k3d-k3s-default
kubectl cluster-info
kubectl get nodes
docker ps
kubectl apply -f deployment.yaml 
kubectl get pods,deployments,services
kubectl apply -f service.yaml 
kubectl get pods,deployments,services
curl http://localhost:8000
kubectl get pods,deployments,services
kubectl delete -f service.yaml 
kubectl get pods,deployments,services
kubectl apply -f service.yaml 
kubectl get pods,deployments,services
```