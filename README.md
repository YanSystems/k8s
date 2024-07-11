# Deploying [@YanSystems](https://github.com/YanSystems) to k8s

This repository contains all manifest files and scripts for deploying Yan systems to Kubernetes.

## Deploying locally

Make sure you have Kubernetes running in the background locally e.g., through `minikube` or Docker Desktop.

Here is a step-by-step procedure for local deployment:

1. Run a local docker registry at port 5000.

    ```
    docker run -d -p 5000:5000 --name registry registry:2
    ```

    This local registry will contain all images for the sake of development. 

2. Pull remote docker images and push them to the local registry, all by running executing one script

    ```
    chmod +x setup_images.sh
    ./setup_images.sh
    ```

2. Create `secrets.yaml` and enter your environment secrets.
    ```
    mv ./local/secrets.default.yaml ./local/secrets.yaml
    ```

3. Start all workloads and services, run

    ```
    kubectl apply -f ./remote
    ```
4. To verify that all microservices are running in the default cluster, run
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

