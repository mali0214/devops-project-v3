# DevOps Project - Flask App
DevOps Project
This repository demonstrates the implementation of a complete DevOps pipeline for a microservices application deployed on AWS using Terraform, Kubernetes, and CI/CD. The project includes:

Infrastructure as Code (IaC) using Terraform

Containerization with Docker

CI/CD Pipelines using GitHub Actions

Logging and Monitoring integration

Flask app as a microservice

Project Setup
Prerequisites
Before you can run the project, make sure you have the following tools installed:

Docker

Terraform

GitHub account

AWS account (if you're deploying to AWS)

Python (for Flask app)

Project Structure
This project is structured as follows:
├── terraform/
│   ├── ec2/
│   ├── security_group/
│   ├── vpc/
│   └── main.tf
├── flask-app/
│   ├── Dockerfile
│   ├── requirements.txt
│   └── app.py
├── .github/
│   └── workflows/
│       └── ci-cd.yml
├── tests/
│   └── test_app.py
├── README.md
└── .gitignore
Flask App
The Flask app is a simple microservice with the following endpoints:

GET /: Displays a welcome message.

GET /another-route: Displays another page.

POST /some-post-endpoint: Receives JSON data and returns a success message.

GET /health: Health check endpoint.

Setting up the Application
Docker Build & Run:

Build the Docker image and run the container:

bash
Copy
Edit
docker build -t flask-app .
docker run -p 5000:5000 flask-app
Verify: Visit http://localhost:5000/ to see the Flask app running.

Terraform Setup
Initialize Terraform:

In the terraform/ directory, run:

bash
Copy
Edit
terraform init
terraform apply
Deploy the infrastructure on AWS.

CI/CD Pipeline
The project uses GitHub Actions to automate the following steps:

Test the Flask app.

Build and push the Docker image to Docker Hub.

Deploy the application to AWS.

The workflow is defined in the .github/workflows/ci-cd.yml file.

Running Tests
You can run the tests using pytest:

bash
Copy
Edit
pytest tests/