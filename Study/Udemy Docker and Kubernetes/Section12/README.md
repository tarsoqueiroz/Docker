# Section 12

## minikube start

minikube is local Kubernetes, focusing on making it easy to learn and develop for Kubernetes.

All you need is Docker (or similarly compatible) container or a Virtual Machine environment, and Kubernetes is a single command away: `minikube start`

* https://minikube.sigs.k8s.io/docs/start/

## Install Tools: `kubectl`, `kind`, `minikube` and `kubeadm`

* https://kubernetes.io/docs/tasks/tools/

## First deployment

```
docker build -t tarsoqueiroz/udemy-dockubmax:s12.01 .

docker push tarsoqueiroz/udemy-dockubmax:s12.01

kubectl create deployment first-app --image=tarsoqueiroz/udemy-dockubmax:s12.01
```

## Expose deployment

```
kubectl expose deployment first-app --type=LoadBalancer --port=8080

kubectl get services

minikube service first-app

kubectl scale deployment/first-app --replicas=3 

kubectl scale deployment/first-app --replicas=1
```

* Update 
```
kubectl set image deployment/first-app
```

## Deployment configuration file

* Diferença entre imperativo e declarativo

***Imperativo*** são os comandos específicos de objetos via `kubectl`. Já no ***Declarativo*** um arquivo ```.YAML``` irá conter a definição de implementação (algo como um lote de comandos `kubectl`)

```
kubectl apply -f=deployment.yaml

kubectl apply -f=service.yaml
```

