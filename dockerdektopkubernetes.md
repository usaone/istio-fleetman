# Udemy Course: "Istio Hands-on for Kubernetes"
Url: https://dowjones.udemy.com/course/istio-hands-on-for-kubernetes/learn/lecture/16779002#overview
---------------------------------------------------------
### Prerequisites: Docker Desktop (using built-in Kubernetes)
---------------------------------------------------------
```
PS C:\> kubectl version
Client Version: v1.30.2
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
Unable to connect to the server: dial tcp [::1]:8080: connectex: No connection could be made because the target machine actively refused it.
```

REM after starting Kubernetes in Docker Desktop
```
PS C:\> kubectl version
Client Version: v1.30.2
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
Server Version: v1.30.2
```

REM Above should show the same version for Client and Server and confirms K8s is running.
REM If an issue, try "Reset Kubernetes Cluster" red button and check again.
REM Periodically you have to click the red "Reset Kubernetes Cluster" button.

```
PS C:\> kubectl get all
NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   7m6s
REM The line "service/kubernetes..." further confirms that K8s is running
```

* If you're using Docker Desktop, then you will use the IP 
* address of "localhost" or "127.0.0.1".
*
* For example, to access the webapp, use "127.0.0.1:30080".
*
* If you have any problems connecting, this may be caused by 
* a bug in Desktop that causes NodePorts to be inaccessible.
*
* Try the following workaround:
* 
* kubectl port-forward svc/fleetman-webapp 30080:80
* 
* Leave this command running and now "localhost:30080" should 
* be accessible - let me know if you're still stuck.
*

START ISTIO in the warmup-exercise folder
    ```
    cd \Users\uddip\Documents\GitHub\istio-fleetman\_course_files\x86_amd64\warmup-exercise
    kubectl apply -f .\1-istio-init.yaml
    kubectl apply -f .\2-istio-minikube.yaml
    kubectl get po -n istio-system
    ```

    Output from above:
    ```
    PS C:\Users\uddip\Documents\GitHub\istio-fleetman\_course_files\x86_amd64\warmup-exercise> kubectl get po -n istio-system
    NAME                                    READY   STATUS    RESTARTS   AGE
    grafana-58fb88b5df-6qj78                1/1     Running   0          2m2s
    istio-egressgateway-854749b576-lc7wn    1/1     Running   0          2m2s
    istio-ingressgateway-6cd7c8546b-dzlnt   1/1     Running   0          2m2s
    istiod-556ff87ccc-5cg8j                 1/1     Running   0          2m2s
    jaeger-78c77c46bc-snrxw                 1/1     Running   0          2m2s
    kiali-599d67df88-s64jt                  1/1     Running   0          2m2s
    prometheus-f5dd8fbf-bnvcb               2/2     Running   0          2m2s
    ```

1-istio-init.yaml and 2-istio-minikube.yaml files are used to start Istio.

Setup Kiali username and password to "admin" via the yaml in the warmup-exercise
    ```
    kubectl apply -f .\3-kiali-secret.yaml
    ```

    ```
    PS C:\Users\uddip\Documents\GitHub\istio-fleetman\_course_files\x86_amd64\warmup-exercise> kubectl apply -f .\3-kiali-secret.yaml
    secret/kiali created
    ```

Check the default namespace for label
    ```
    kubectl describe ns default
    ```

    Output from above:
    ```
    PS C:\Users\uddip\Documents\GitHub\istio-fleetman\_course_files\x86_amd64\warmup-exercise> kubectl describe ns default
    Name:         default
    Labels:       kubernetes.io/metadata.name=default
    Annotations:  <none>
    Status:       Active

    No resource quota.

    No LimitRange resource.
    ```

Enable istio-injection namespace label
    ```
    kubectl label namespace default istio-injection=enabled
    ```

    Output from above:
    ```
    PS C:\Users\uddip\Documents\GitHub\istio-fleetman\_course_files\x86_amd64\warmup-exercise> kubectl label namespace default istio-injection=enabled
    namespace/default labeled
    ```

Check the default namespace for label for Istio to inject sidecars automatically
    ```
    kubectl describe ns default
    ```

    Output from above:
    ```
    PS C:\Users\uddip\Documents\GitHub\istio-fleetman\_course_files\x86_amd64\warmup-exercise> kubectl describe ns default
    Name:         default
    Labels:       istio-injection=enabled
                kubernetes.io/metadata.name=default
    Annotations:  <none>
    Status:       Active

    No resource quota.

    No LimitRange resource.
    ```

    To copy the content into a yaml file
    ```
    kubectl get ns default -o yaml
    ```

Run the application stack in the warmup-exercise
    ```
    kubectl apply -f .\4-application-full-stack.yaml
    ```

    Output from above:
    ```
    PS C:\Users\uddip\Documents\GitHub\istio-fleetman\_course_files\x86_amd64\warmup-exercise> kubectl apply -f .\4-application-full-stack.yaml
    deployment.apps/position-simulator created
    deployment.apps/position-tracker created
    deployment.apps/api-gateway created
    deployment.apps/webapp created
    deployment.apps/vehicle-telemetry created
    deployment.apps/staff-service created
    deployment.apps/photo-service created
    service/fleetman-webapp created
    service/fleetman-position-tracker created
    service/fleetman-api-gateway created
    service/fleetman-vehicle-telemetry created
    service/fleetman-staff-service created
    service/fleetman-photo-service created
    serviceentry.networking.istio.io/fleetman-driver-monitoring created
    virtualservice.networking.istio.io/fleetman-driver-monitoring created
    destinationrule.networking.istio.io/fleetman-driver-monitoring created
    ```

Check pods running in default ns
    ```
    kubectl get po
    ```

    Output from above:
    ```
    PS C:\Users\uddip\Documents\GitHub\istio-fleetman\_course_files\x86_amd64\warmup-exercise> kubectl get po
    NAME                                 READY   STATUS    RESTARTS   AGE
    api-gateway-5dd78b4fb6-t9kgc         2/2     Running   0          36s
    photo-service-58dcc59fc5-kk25z       2/2     Running   0          36s
    position-simulator-d97cd88b8-qgczp   2/2     Running   0          36s
    position-tracker-68b4b5c7bb-gzcpt    2/2     Running   0          36s
    staff-service-77d64f7f8f-599z4       2/2     Running   0          36s
    vehicle-telemetry-6577ff8c9d-wtstv   2/2     Running   0          36s
    webapp-74b88c6779-szxnn              2/2     Running   0          36s
    ```

Now launch the front-end app on the browser at localhost on port 30080:
http://localhost:30080/

