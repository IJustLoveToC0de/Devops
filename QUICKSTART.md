# Quick Start Guide 🚀

Get up and running with the DevOps Sandbox in minutes!

## Prerequisites Check

```bash
# Check Python version (need 3.11+)
python --version

# Check Docker
docker --version
docker-compose --version

# Check Terraform (optional)
terraform --version

# Check kubectl (optional)
kubectl version --client
```

## Option 1: Run Locally (Fastest)

```bash
# 1. Create virtual environment
python -m venv venv

# 2. Activate virtual environment
# Windows PowerShell:
venv\Scripts\Activate.ps1
# Windows CMD:
venv\Scripts\activate.bat
# Linux/Mac:
source venv/bin/activate

# 3. Install dependencies
pip install -r requirements.txt

# 4. Run the app
python app.py

# 5. Test it (in another terminal)
curl http://localhost:5000
curl http://localhost:5000/health
```

## Option 2: Run with Docker (Recommended)

```bash
# 1. Build and run with Docker Compose
docker-compose up --build

# 2. Access the application
# Web app: http://localhost:5000
# Through nginx: http://localhost:80

# 3. Test endpoints
curl http://localhost:5000/health
curl http://localhost:5000/api/info

# 4. Stop containers
docker-compose down
```

## Option 3: Run Tests

```bash
# Install test dependencies
pip install pytest pytest-cov

# Run tests
pytest tests/ -v

# Run with coverage
pytest tests/ -v --cov=app --cov-report=html
```

## Next Steps

1. **Explore the code**: Check out `app.py` to see the Flask application
2. **Modify and test**: Add new endpoints and write tests
3. **Docker**: Experiment with the Dockerfile and docker-compose.yml
4. **CI/CD**: Push to GitHub to trigger the CI pipeline
5. **Infrastructure**: Try deploying with Terraform (requires AWS account)
6. **Kubernetes**: Deploy to a local cluster with minikube/kind

## Common Commands

```bash
# Using Makefile (if available)
make help          # Show all commands
make build         # Install dependencies
make run           # Run locally
make test          # Run tests
make docker-build  # Build Docker image
make docker-up     # Start with docker-compose
```

## Troubleshooting

### Port already in use
```bash
# Change port in docker-compose.yml or app.py
# Or stop the process using port 5000
```

### Docker issues
```bash
# Make sure Docker is running
docker ps

# Clean up
docker-compose down
docker system prune
```

### Python import errors
```bash
# Make sure virtual environment is activated
# Reinstall dependencies
pip install -r requirements.txt --force-reinstall
```

## Learning Path

1. ✅ **Start here**: Run locally or with Docker
2. 📝 **Learn**: Read the code and understand the structure
3. 🧪 **Test**: Write and run tests
4. 🐳 **Containerize**: Understand Dockerfile and docker-compose
5. 🔄 **Automate**: Set up CI/CD with GitHub Actions
6. ☁️ **Deploy**: Try Terraform and Kubernetes

Happy learning! 🎓

