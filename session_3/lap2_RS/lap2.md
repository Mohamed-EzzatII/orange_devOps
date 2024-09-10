# Kubernetes Tasks

## 1. Create a ReplicaSet using the below YAML

Use the following YAML to create the ReplicaSet:

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: new-replica-set
  namespace: default
spec:
  replicas: 4
  selector:
    matchLabels:
      name: busybox-pod
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
        image: busybox777
        imagePullPolicy: Always
        name: busybox-container
```

To create the ReplicaSet from the above YAML, save it in a file (e.g., replicaset.yaml) and run:

```bash
kubectl apply -f replicaset.yaml
```

## 2. How many PODs are DESIRED in the new-replica-set?
There are 4 desired pods, as specified in the replicas field of the YAML.

## 3. What is the image used to create the pods in the new-replica-set?
The image used is busybox777.

## 4. How many PODs are READY in the new-replica-set?
To check how many pods are ready, run:

```bash
kubectl get replicaset new-replica-set
```

## 5. Why do you think the PODs are not ready?
The pods are likely not ready because the image name busybox777 may not exist or may not be available in the container registry.

## 6. Delete any one of the 4 PODs.
To delete one of the pods, first list the pods with:
```bash
kubectl get pods
```
Then delete one of the pods using:

```bash
kubectl delete pod <pod-name>
```
### How many pods are now available?
After deleting a pod, you should check how many pods are available by running:

```bash
kubectl get pods
```
Since ReplicaSet maintains the number of desired replicas, it will create a new pod to maintain 4 replicas.

## 7-Why are there still 4 PODs, even after you deleted one?
Due to the controller which create the deleted pod again

## 8-Create a ReplicaSet using the below yaml

There is an issue with the file, so try to fix it.

```yaml
apiVersion: v1
kind: ReplicaSet
metadata:
  name: replicaset-1
spec:
  replicas: 2
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: nginx
        image: nginx
```
## solution : -

```yaml
apiVersion: app/v1
kind: ReplicaSet
metadata:
  name: replicaset-1
spec:
  replicas: 2
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: nginx
        image: nginx

```

