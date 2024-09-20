#!/bin/bash
kubectl delete -f $(pwd)/Deployments/db_deployment.kub.yaml
kubectl delete -f $(pwd)/Deployments/backend_deployment.kub.yaml
kubectl delete -f $(pwd)/Deployments/proxy_deployment.kub.yaml
kubectl delete -f $(pwd)/volumes/db-data-pvc.kub.yaml
kubectl delete -f $(pwd)/volumes/db-data-pv.kub.yaml
kubectl delete -f $(pwd)/Services/db_clusterIP.kub.yaml
kubectl delete -f $(pwd)/Services/backend_clusterIP.kub.yaml
kubectl delete -f $(pwd)/Services/proxy_nodePort.kub.yaml
kubectl delete -f $(pwd)/namespaces/webapp_namespace.kub.yaml