### DevOps Spring Boot Application Deployment on Kubernetes

This project demonstrates the deployment of a simple Spring Boot application using Docker and Kubernetes on a local Minikube cluster.
The application exposes a REST API, containerized using Docker, and the image is deployed to Kubernetes using YAML configuration files.

### GitHub URL: https://github.com/abdulbasit24/DockerK8s_Assignment.git

## How to Deploy

### 1. Clone the Repository
```bash
git clone https://github.com/abdulbasit24/DockerK8s_Assignment.git
cd devopsassignment
```

### 2. Build the Spring Boot Application
Use Maven to package the application into a JAR file.
```bash
mvn clean package
```

### 3. Create and Push Docker Image

- Build the Docker image using the `Dockerfile`.
```bash
docker build -t abdulbasit7/devopsassignment:latest .
```

- Log in to Docker Hub and push the image:
```bash
docker login
docker push abdulbasit7/devopsassignment:latest
```

### 4. Deploy on Minikube

- Start Minikube:
```bash
minikube start
```

- Apply the Kubernetes deployment and service YAML files:
```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

### 5. Access the Application

To access the application, run:
```bash
minikube service devops-service
```

## Kubernetes YAML Files

### Deployment YAML (`deployment.yaml`)
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: devops-deployment  # deployment name
spec:
  replicas: 2  #replicas
  selector:
    matchLabels:
      app: devops-app  # app label name
  template:
    metadata:
      labels:
        app: devops-app  # Should match the label defined in the selector
    spec:
      containers:
      - name: devops-container  # container name
        image: abdulbasit7/devopsassignment:latest  # Image from Docker Hub
        ports:
        - containerPort: 8081  # Port number should match the port exposed in the Dockerfile image
```

### Service YAML (`service.yaml`)
```yaml
apiVersion: v1
kind: Service
metadata:
  name: devops-service  #Service name
spec:
  selector:
    app: devops-app  # Must match the label in the deployment.yaml
  ports:
    - protocol: TCP
      port: 8081  # External port to expose the service, can be changed
      targetPort: 8081  # Should match the containerPort in deployment.yaml
  type: NodePort  # NodePort type exposes the service on a port on all nodes
```

## Dockerfile

The Dockerfile used to create a Docker image for the Spring Boot application.

```Dockerfile
FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY target/DevOpss-0.0.1-SNAPSHOT.jar /app/devops.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "devops.jar"]
```

## Cleanup

To stop and delete the Minikube cluster:
```bash
minikube stop
minikube delete
```
