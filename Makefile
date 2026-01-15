.PHONY: help build run test clean docker-build docker-run docker-stop terraform-init terraform-plan terraform-apply terraform-destroy k8s-deploy k8s-delete

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

# Python commands
build: ## Install Python dependencies
	pip install -r requirements.txt

run: ## Run the application locally
	python app.py

test: ## Run tests
	pytest tests/ -v

clean: ## Clean Python cache
	find . -type d -name __pycache__ -exec rm -r {} +
	find . -type f -name "*.pyc" -delete

# Docker commands
docker-build: ## Build Docker image
	docker build -t devops-sandbox:latest .

docker-run: ## Run Docker container
	docker run -p 5000:5000 --env-file .env devops-sandbox:latest

docker-stop: ## Stop all containers
	docker-compose down

docker-up: ## Start with docker-compose
	docker-compose up --build

# Terraform commands
terraform-init: ## Initialize Terraform
	cd terraform && terraform init

terraform-plan: ## Plan Terraform changes
	cd terraform && terraform plan

terraform-apply: ## Apply Terraform changes
	cd terraform && terraform apply

terraform-destroy: ## Destroy Terraform infrastructure
	cd terraform && terraform destroy

# Kubernetes commands
k8s-deploy: ## Deploy to Kubernetes
	kubectl apply -f k8s/

k8s-delete: ## Delete Kubernetes resources
	kubectl delete -f k8s/

k8s-status: ## Check Kubernetes status
	kubectl get all -l app=devops-sandbox

# All-in-one
setup: build ## Initial setup
	@echo "Setup complete!"

