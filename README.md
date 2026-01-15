# DevOps Sandbox 🚀

A comprehensive learning sandbox for DevOps practices, including containerization, CI/CD, Infrastructure as Code, and Kubernetes orchestration.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [CI/CD Pipeline](#cicd-pipeline)
- [Infrastructure](#infrastructure)
- [Kubernetes Deployment](#kubernetes-deployment)
- [Learning Path](#learning-path)

## 🎯 Overview

This sandbox provides a hands-on environment to learn and practice DevOps concepts:

- **Containerization**: Docker and Docker Compose
- **CI/CD**: GitHub Actions pipelines
- **Infrastructure as Code**: Terraform for AWS
- **Orchestration**: Kubernetes manifests
- **Testing**: Unit tests with pytest
- **Monitoring**: Health checks and logging

## ✨ Features

- Simple Flask web application with RESTful API endpoints
- Multi-stage Docker builds for optimized images
- Complete CI/CD pipeline with linting, testing, and security scanning
- Terraform modules for AWS infrastructure (VPC, ECS, ECR)
- Kubernetes manifests for container orchestration
- Docker Compose for local development
- Comprehensive documentation

## 📦 Prerequisites

- **Python 3.11+**
- **Docker** and **Docker Compose**
- **Terraform** (for infrastructure)
- **kubectl** (for Kubernetes)
- **AWS CLI** (for cloud deployment)
- **Git**

## 🚀 Quick Start

### 1. Clone and Setup

```bash
git clone <your-repo-url>
cd Devops
```

### 2. Local Development with Docker Compose

```bash
# Build and start containers
docker-compose up --build

# Access the application
curl http://localhost:5000
curl http://localhost:5000/health
```

### 3. Run Locally (without Docker)

```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Run the application
python app.py
```

### 4. Run Tests

```bash
pip install pytest pytest-cov
pytest tests/ -v
```

## 📁 Project Structure

```
.
├── app.py                 # Flask application
├── requirements.txt       # Python dependencies
├── Dockerfile            # Docker image definition
├── docker-compose.yml    # Local development setup
├── nginx.conf           # Nginx reverse proxy config
├── .dockerignore        # Docker ignore patterns
├── .gitignore          # Git ignore patterns
│
├── .github/
│   └── workflows/
│       ├── ci.yml       # Continuous Integration pipeline
│       └── cd.yml       # Continuous Deployment pipeline
│
├── terraform/
│   ├── main.tf         # Main Terraform configuration
│   ├── variables.tf    # Variable definitions
│   └── outputs.tf     # Output definitions
│
├── k8s/
│   ├── deployment.yaml # Kubernetes deployment
│   ├── service.yaml    # Kubernetes service
│   ├── configmap.yaml # Configuration map
│   └── ingress.yaml   # Ingress controller
│
└── tests/
    └── test_app.py    # Unit tests
```

## 💻 Usage

### API Endpoints

- `GET /` - Welcome message with app info
- `GET /health` - Health check endpoint
- `GET /api/info` - Application information
- `POST /api/echo` - Echo back JSON data

### Example Requests

```bash
# Get app info
curl http://localhost:5000

# Health check
curl http://localhost:5000/health

# Echo endpoint
curl -X POST http://localhost:5000/api/echo \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello DevOps!"}'
```

## 🔄 CI/CD Pipeline

### GitHub Actions Workflows

1. **CI Pipeline** (`.github/workflows/ci.yml`)
   - Code linting with flake8
   - Unit tests with pytest
   - Docker image build
   - Security scanning with Trivy

2. **CD Pipeline** (`.github/workflows/cd.yml`)
   - Automated deployment on main branch
   - AWS EKS deployment (configure secrets)

### Setup GitHub Secrets

For CI/CD to work, configure these secrets in GitHub:

- `DOCKER_USERNAME` - Docker Hub username
- `DOCKER_PASSWORD` - Docker Hub password
- `AWS_ACCESS_KEY_ID` - AWS access key
- `AWS_SECRET_ACCESS_KEY` - AWS secret key

## 🏗️ Infrastructure

### Terraform Setup

```bash
cd terraform

# Initialize Terraform
terraform init

# Plan infrastructure changes
terraform plan

# Apply infrastructure
terraform apply

# Destroy infrastructure
terraform destroy
```

### What Gets Created

- VPC with public subnet
- Internet Gateway
- Security Groups
- ECR Repository for container images
- ECS Cluster for container orchestration

### Customize Variables

Edit `terraform/variables.tf` or use `terraform.tfvars`:

```hcl
aws_region = "us-west-2"
environment = "production"
app_name = "my-app"
```

## ☸️ Kubernetes Deployment

### Prerequisites

- Kubernetes cluster (local with minikube/kind or cloud)
- kubectl configured

### Deploy to Kubernetes

```bash
# Update image in deployment.yaml
# Apply manifests
kubectl apply -f k8s/

# Check deployment status
kubectl get deployments
kubectl get pods
kubectl get services

# Access the service
kubectl port-forward service/devops-sandbox-service 8080:80
curl http://localhost:8080
```

### Local Kubernetes with Minikube

```bash
# Start minikube
minikube start

# Enable ingress
minikube addons enable ingress

# Deploy
kubectl apply -f k8s/

# Get service URL
minikube service devops-sandbox-service
```

## 📚 Learning Path

### Beginner Level

1. **Containerization Basics**
   - Understand Dockerfile
   - Build and run containers
   - Use Docker Compose

2. **Local Development**
   - Run the app locally
   - Test API endpoints
   - Write unit tests

### Intermediate Level

3. **CI/CD**
   - Understand GitHub Actions
   - Set up automated testing
   - Build and push Docker images

4. **Infrastructure as Code**
   - Learn Terraform basics
   - Provision AWS resources
   - Understand state management

### Advanced Level

5. **Kubernetes**
   - Deploy to Kubernetes
   - Understand pods, services, deployments
   - Configure ingress and configmaps

6. **Monitoring & Observability**
   - Add logging
   - Set up health checks
   - Implement metrics collection

## 🛠️ Customization

### Add New Features

1. Add endpoints to `app.py`
2. Write tests in `tests/`
3. Update Dockerfile if needed
4. Update Kubernetes manifests

### Environment Variables

Configure via:
- Docker Compose: `docker-compose.yml`
- Kubernetes: `k8s/configmap.yaml`
- Terraform: `terraform/variables.tf`

## 🔒 Security Best Practices

- Use secrets management (AWS Secrets Manager, Kubernetes Secrets)
- Scan images for vulnerabilities (Trivy)
- Use least privilege IAM roles
- Enable HTTPS/TLS in production
- Regular dependency updates

## 📝 Notes

- This is a learning sandbox - not production-ready
- Replace placeholder values (e.g., Docker registry URLs)
- Configure AWS credentials securely
- Review and customize security groups
- Add monitoring and logging for production use

## 🤝 Contributing

Feel free to fork and experiment! This is your sandbox to learn and practice DevOps.

## 📄 License

MIT License - feel free to use for learning purposes.

## 🎓 Resources

- [Docker Documentation](https://docs.docker.com/)
- [Terraform Documentation](https://www.terraform.io/docs)
- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Flask Documentation](https://flask.palletsprojects.com/)

---

**Happy Learning! 🚀**

