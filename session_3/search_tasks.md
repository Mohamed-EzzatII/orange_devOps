# Search Tasks

## A - Requests VS Limits

### 1. Requests : -
This is the amount of resource that Kubernetes will guarantee for the container. It is the minimum resource allocation that Kubernetes will ensure for the container. If a container requests a certain amount of CPU or memory, Kubernetes will make sure that the container gets at least that amount. Requests are used for scheduling decisions, so if a node does not have enough available resources to meet the requests of a pod, the pod will not be scheduled on that node.

### 2. Limits: -
This is the maximum amount of resource that the container can use. Kubernetes will enforce these limits to ensure that the container does not consume more than the specified amount. If a container tries to exceed its memory limit, it may be terminated and potentially restarted. If it exceeds its CPU limit, the container’s CPU usage will be throttled.

---

## B - ReplicaSet VS Deployment 
### 1. ReplicaSet : -
Ensures a specified number of pod replicas are running but lacks advanced update features. It’s focused on maintaining pod count and requires manual updates.
### 2. Deployment : -
builds on ReplicaSet, providing features like rolling updates, rollbacks, and scaling, allowing for smoother application management and zero-downtime updates. It's the preferred choice for managing pod lifecycles.
