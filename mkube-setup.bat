minkube delete
pause
minikube start --memory=12288 --cpus=4 --driver=docker
pause
minikube addons enable istio-provisioner
pause
minikube addons enable istio
pause
kubectl get po -n istio-system
pause

