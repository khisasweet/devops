# Install dependencies
VENV = .venv
PYTHON = python3

install:
	$(PYTHON) -m venv $(VENV)
	$(VENV)/bin/pip install --upgrade pip
	$(VENV)/bin/pip install -r requirements.txt


# Run linting
lint:
	flake8 .

# Run tests
test:
	pytest

# Build Docker image
docker-build:
	docker build -t flask-app:latest .

# Run Docker container
docker-run:
	docker run -d -p 5000:5000 flask-app:latest

# Clean up Docker images and containers
clean:
	docker rm -f $$(docker ps -aq) || true
	docker rmi -f $$(docker images -q flask-app) || true
