#!/bin/bash
kubectl apply -f $(pwd)/namespaces/webapp_namespace.kub.yaml
kubectl apply -f $(pwd)/volumes/db-data-pv.kub.yaml
kubectl apply -f $(pwd)/volumes/db-data-pvc.kub.yaml
kubectl apply -f $(pwd)/Deployments/db_deployment.kub.yaml
kubectl apply -f $(pwd)/Deployments/backend_deployment.kub.yaml
kubectl apply -f $(pwd)/Deployments/proxy_deployment.kub.yaml
kubectl apply -f $(pwd)/Services/db_clusterIP.kub.yaml
kubectl apply -f $(pwd)/Services/backend_clusterIP.kub.yaml
kubectl apply -f $(pwd)/Services/proxy_nodePort.kub.yaml