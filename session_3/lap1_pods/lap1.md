# Kubernetes Tasks

## 1. How many pods exist on the system?
We will see that there are no pods ,to check the number of pods on the system, run:

```bash
kubectl get pods
```

## 2. How many Nodes exist on the system?
we will find that there are 2 Nodes(master and worker), to check the number of nodes in the system, run:

```bash
kubectl get nodes
```
## 3. Create a new pod with the nginx image.
To create a new pod with the nginx image, run:

```bash
kubectl run nginx --image=nginx
```

## 4. Which nodes are these pods placed on?
MiniKube Node, to check which nodes the pods are placed on, run:

```bash
kubectl get pods -o wide
```

## 5. Create pod from the below yaml using kubectl apply command

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: webapp
  namespace: default
spec:
  containers:
  - image: nginx
    imagePullPolicy: Always
    name: nginx
  - image: agentx
    imagePullPolicy: Always
    name: agentx
```

Use this command to create a pod from a YAML file:

```bash
kubectl apply -f <your-file-name>.yaml
```

## 6. How many containers are part of the pod webapp?
There are 2 containers in the webapp pod: nginx and agentx.
you can check that from the description of the pod

```bash
kubectl descripbe pod webapp
```

## 7. What images are used in the new webapp pod?
The images used are nginx and agentx
you can check that from the description of the pod

```bash
kubectl descripbe pod webapp
```


## 8. What is the state of the container agentx in the pod webapp?
The state of the container agentx is Waiting.
You can check that from the description of the pod

```bash
kubectl descripbe pod webapp
```

## 9. Why do you think the container agentx in pod webapp is in error?
The agentx container is in error because the image doesn’t exist.

## 10. Delete the webapp Pod.
To delete the webapp pod, run:

```bash
kubectl delete pod webapp
```

## 11. Create a new pod with the name redis and with the image redis123.
To create a new pod named redis with the image redis123, run:

```bash
kubectl run redis --image=redis123
```

## 12. Now change the image on this pod to redis.
To update the image on the pod:

```bash
kubectl set image pod/redis redis=redis
```

After updating, ensure the pod is in a running state by checking:

```bash
kubectl get pods
```

## 13. Create a pod called my-pod of image nginx
To create a pod called my-pod with the nginx:alpine image, run:

```bash
kubectl run my-pod --image=nginx:alpine
```

## 14. Delete the pod called my-pod
To delete the my-pod, run:

```bash
kubectl delete pod my-pod
```
