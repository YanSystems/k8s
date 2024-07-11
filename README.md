# Deploying [@YanSystems](https://github.com/YanSystems) to k8s

This repository contains all manifest files and scripts for deploying Yan systems to Kubernetes.

## Deploying locally

Make sure you have Kubernetes running in the background locally e.g., through `minikube` or Docker Desktop.

To start all workloads and services, run

```
kubectl apply -f ./local
```

This should pull all docker images and run each microservice in the default cluster. You can verify this by running

```
kubectl get all
```

When you're done, be sure to clean up the cluster by running
```
kubectl delete all --all -n default
```

## Deploying to AWS EKS

Migration to AWS EKS is still a work in progress - I will likely use `eksctl` or Terraform.

## License

This repository is [MIT licensed.](https://github.com/YanSystems/deploy/blob/main/LICENSE)

