# Useful kubectl commands

## Get pods in the default namespace
kubectl get po

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

## Get pods in the istio-system namespace
kubectl get po -n istio-system

```
PS C:\Users\uddip\Documents\GitHub\istio-fleetman\_course_files\x86_amd64\warmup-exercise> kubectl get po -n istio-system
NAME                                    READY   STATUS    RESTARTS   AGE
grafana-58fb88b5df-6qj78                1/1     Running   0          59m
istio-egressgateway-854749b576-lc7wn    1/1     Running   0          59m
istio-ingressgateway-6cd7c8546b-dzlnt   1/1     Running   0          59m
istiod-556ff87ccc-5cg8j                 1/1     Running   0          59m
jaeger-78c77c46bc-snrxw                 1/1     Running   0          59m
kiali-599d67df88-s64jt                  1/1     Running   0          59m
prometheus-f5dd8fbf-bnvcb               2/2     Running   0          59m
```

## Get services in the istio-system namespace
kubectl get svc -n istio-system

```
PS C:\Users\uddip\Documents\GitHub\istio-fleetman\_course_files\x86_amd64\warmup-exercise> kubectl get svc -n istio-system
NAME                   TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)
          AGE
grafana                NodePort    10.96.89.32      <none>        3000:31002/TCP
          57m
istio-egressgateway    ClusterIP   10.101.113.248   <none>        80/TCP,443/TCP
          57m
istio-ingressgateway   NodePort    10.98.27.65      <none>        15021:31254/TCP,80:31380/TCP,443:31426/TCP,31400:31815/TCP,15443:32460/TCP   57m
istiod                 ClusterIP   10.99.253.152    <none>        15010/TCP,15012/TCP,443/TCP,15014/TCP
          57m
jaeger-collector       ClusterIP   10.102.249.21    <none>        14268/TCP,14250/TCP
          57m
kiali                  NodePort    10.106.73.187    <none>        20001:31000/TCP,9090:31414/TCP
          57m
prometheus             ClusterIP   10.96.37.177     <none>        9090/TCP
          57m
tracing                NodePort    10.108.216.28    <none>        80:31001/TCP
          57m
zipkin                 ClusterIP   10.100.213.188   <none>        9411/TCP
          57m
```

### Kiali url from above is: http://localhost:31000/

## Get services in the default namespace
kubectl get svc

```
PS C:\Users\uddip\Documents\GitHub\istio-fleetman\_course_files\x86_amd64\warmup-exercise> kubectl get svc
NAME                         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
fleetman-api-gateway         ClusterIP   10.109.23.212    <none>        8080/TCP       19h
fleetman-photo-service       ClusterIP   10.99.150.254    <none>        8080/TCP       19h
fleetman-position-tracker    ClusterIP   10.103.29.84     <none>        8080/TCP       19h
fleetman-staff-service       ClusterIP   10.103.203.123   <none>        8080/TCP       19h
fleetman-vehicle-telemetry   ClusterIP   10.97.30.39      <none>        8080/TCP       19h
fleetman-webapp              NodePort    10.103.224.11    <none>        80:30080/TCP   19h
kubernetes                   ClusterIP   10.96.0.1        <none>        443/TCP        21h
```

