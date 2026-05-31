### Before starting "Reset Kubernetes Cluster" in Docker Desktop Settings
```
kubectl version
kubectl get all
```
### Get the Istio Control Plane Started
```
kubectl apply -f .\1-istio-init.yaml
kubectl apply -f .\2-istio-minikube.yaml
```

### Check to see all pods are ready in the istio-system
```
kubectl get po -n istio-system
```

### Apply Kiali Secret and Enable istio-injection namespace label
```
kubectl apply -f .\3-kiali-secret.yaml
kubectl apply -f .\4-label-default-namespace.yaml
```

### Run the application stack in the warmup-exercise
```
kubectl apply -f .\4-application-full-stack.yaml
```

### Check pods running in default namespace. If each pod is running with 2 containers, the Istio Data Plane is ready.
```
kubectl get po
```

### Check Services running for the port numbers to use
```
kubectl get svc
```
Now launch the front-end app on the browser at localhost on port 30080:
http://localhost:30080/


### Check Istio Services running for the port number to launch Kiali, Tracing and Grafana (identified by Type=NodePort)
```
kubectl get svc -n istio-system
```

