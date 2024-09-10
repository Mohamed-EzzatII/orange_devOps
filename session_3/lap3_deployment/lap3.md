# Lap3 Deployment

## 1. Create a deployment called my-first-deployment of image nginx:alpine in the default namespace and check to make sure the deployment is healthy.

we can create a deployment using the following command

```bash
 kubectl create deployment my-first-deployment --image=nginx:alpine
```

you can view all the deployments using the following command 

```bash
kubectl get deployment
```

## 2. Scale my-first-deployment up to run 3 replicas and check to make sure all 3 replicas are ready.

we can scale the deployment using that command 
```bash
kubectl scale deployment my-first-deployment --replicas=3
```
to view all the kube object use the following commands

```bash
kubectl get all
```


## 3. Scale my-first-deployment down to run 2 replicas.

we can scale the deployment using that command 
```bash
kubectl scale deployment my-first-deployment --replicas=3
```

## 4. Change the image my-first-deployment runs from nginx:alpine to httpd:alpine .

```bash
kubectl set image deployment/my-first-deployment nginx=httpd:alpine
```

## 5. Delete the deployment my-first-deployment
```bash
kubectl delete deployment my-first-deployment
```

## 6. Create deployment from the below yaml
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend-deployment
  namespace: default
spec:
  replicas: 4
  selector:
    matchLabels:
      name: busybox-pod
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      labels:
        name: busybox-pod
    spec:
      containers:
      - command:
        - sh
        - -c
        - echo Hello Kubernetes! && sleep 3600
        image: busybox888
        imagePullPolicy: Always
        name: busybox-container
```
To create the deployment, apply the YAML file:

```bash
kubectl apply -f <filename>.yaml 
```

## 7. How many ReplicaSets exist on the system now?

There are 4, you can check using the following command
```bash
kubectl get replicasets
```

## 8. How many PODs exist on the system now?

There are 4 (by replucaSets) + 2(by minikube) = 6
You can check using the following command
```bash
kubectl get pods
```

## 9. Out of all the existing PODs, how many are ready?
only 2

## 10. What is the image used to create the pods in the new deployment?
busybox888

## 11. Why do you think the deployment is not ready?
because the image name is wrong