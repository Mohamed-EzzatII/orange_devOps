# lap4 namespaces

## 1- What is a namespace in Kubernetes, and why is it used?
It is a way to divide the cluster resources logically between users.
It is used to manage the resources access and organize the resources

## 2 - How do you create a new namespace in Kubernetes using the kubectl command?
```bash
kubectl create namespace hamada
```

## 3 - How can you list all namespaces in a Kubernetes cluster?
```bash
kubectl get namespace
```
## 4 - What is the default namespace in Kubernetes? What happens if you do not specify a namespace when deploying a resource?
A namespace which is created by default and all the object with unspecified namespace will be assigned to it

## 5 - How do you delete a namespace in Kubernetes? What happens to the resources within it?
```bash
kubectl delete namespace hamada          
```
According to the other resources, they are also deleted

## 6 - How can you switch between namespaces while using the kubectl command?

Using --namespace flag, Example : -
```bash
$ kubectl run hamada-pod --namespace hamada --image=ubuntu
pod/hamada-pod created
$ kubectl run default-pod --image=ubuntu
pod/default-pod created
$ kubectl get pods
NAME                                  READY   STATUS             RESTARTS      AGE
default-pod                           0/1     CrashLoopBackOff   1 (3s ago)    14s
frontend-deployment-649fb4c7c-2dlxj   0/1     ImagePullBackOff   0             21m
frontend-deployment-649fb4c7c-nk86b   0/1     ImagePullBackOff   0             21m
frontend-deployment-649fb4c7c-qb887   0/1     ImagePullBackOff   0             21m
frontend-deployment-649fb4c7c-rljms   0/1     ImagePullBackOff   0             21m
pod                                   1/1     Running            1 (13h ago)   14h
redis                                 1/1     Running            1 (13h ago)   13h
$ kubectl get pods --namespace=hamada
NAME         READY   STATUS             RESTARTS      AGE
hamada-pod   0/1     CrashLoopBackOff   1 (16s ago)   36s
```

## 7 - How do you create a Kubernetes deployment in a specific namespace?
```bash
$ kubectl create deployment hamada-deployment --image=nginx --namespace=hamada
deployment.apps/hamada-deployment created
$ kubectl get all
NAME                                      READY   STATUS             RESTARTS      AGE
pod/default-pod                           0/1     CrashLoopBackOff   5 (16s ago)   3m36s
pod/frontend-deployment-649fb4c7c-2dlxj   0/1     ImagePullBackOff   0             24m
pod/frontend-deployment-649fb4c7c-nk86b   0/1     ImagePullBackOff   0             24m
pod/frontend-deployment-649fb4c7c-qb887   0/1     ImagePullBackOff   0             24m
pod/frontend-deployment-649fb4c7c-rljms   0/1     ImagePullBackOff   0             24m
pod/pod                                   1/1     Running            1 (13h ago)   14h
pod/redis                                 1/1     Running            1 (13h ago)   13h

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   18h

NAME                                  READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/frontend-deployment   0/4     4            0           24m

NAME                                            DESIRED   CURRENT   READY   AGE
replicaset.apps/frontend-deployment-649fb4c7c   4         4         0       24m
$ kubectl get all --namespace=hamada
NAME                                    READY   STATUS             RESTARTS      AGE
pod/hamada-deployment-5c5c66c8f-b7796   1/1     Running            0             17s
pod/hamada-pod                          0/1     CrashLoopBackOff   5 (35s ago)   3m58s

NAME                                READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/hamada-deployment   1/1     1            1           17s

NAME                                          DESIRED   CURRENT   READY   AGE
replicaset.apps/hamada-deployment-5c5c66c8f   1         1         1       17s
```



## 8 - Can two different namespaces have resources with the same name? Explain your answer.
Yes, for example n1 and n2 could both have hamada pod

## 9 - How can you check the resource quotas and limits for a specific namespace?

```bash
$ kubectl get resourcequota --namespace=hamada          
No resources found in hamada namespace.
```

## 10 - How do you configure a kubectl context to always use a specific namespace by default?
```bash
$ kubectl config set-context --current --namespace=hamada          
Context "minikube" modified.
```

## 11 - Create a YAML file to define a new namespace called dev-environment. Deploy it using kubectl.
```yaml
apiVersion: v1
kind: Namespace
metadata:
 name: dev-environment
```

```bash
kubectl apply -f lap4_namespaces/yaml_file.yaml
```
## 12 - Write a command to deploy a pod named test-pod running the nginx image into a namespace called testing.

```bash
$ kubectl create namespace testing
namespace/testing created
$ kubectl run test-pod --image=nginx --namespace=dev-enviroment
Error from server (NotFound): namespaces "dev-enviroment" not found
$ kubectl run test-pod --image=nginx --namespace=testing
pod/test-pod created
```
## 13 - List all the pods running in a namespace called production.

```bash
$ kubectl get pods --namespace=production
No resources found in production namespace.
```