REM minikube is not needed if Docker Desktop Kubernetes works
REM but if docker is needed, then just install the Docker Server which is
REM available on Linux. However, for Windows and Mac, you'd rather use
REM Docker Desktop with Kubernetes.
minkube delete
pause
minikube start --memory=12288 --cpus=4 --driver=docker
REM minikube runs in a docker container and hence, the Kubernetes within Docker
REM Desktop is better.
pause
minikube addons enable istio-provisioner
pause
minikube addons enable istio
pause
kubectl get po -n istio-system
pause

