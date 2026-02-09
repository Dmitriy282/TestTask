# High-Load Application with Nginx Rate Limiting

This project demonstrates a Dockerized application served behind an Nginx proxy with Rate Limiting enabled. It includes a setup for local development using Docker Compose and a bonus configuration for Kubernetes (Kind).

## 1. Prerequisites

Before running the project, ensure you have the following installed:

**Required:**
* [Docker](https://docs.docker.com/get-docker/) v29.2.0
* [Docker Compose](https://docs.docker.com/compose/install/) (or `docker compose` plugin) v5.0.2
* `make` (usually installed on Linux/macOS; for Windows use WSL or Git Bash)

**For Kubernetes (Bonus):**
* [Kind](https://kind.sigs.k8s.io/) (Kubernetes in Docker)
* [kubectl](https://kubernetes.io/docs/tasks/tools/) v1.34.1
* [Helm](https://helm.sh/)

---

## 2. How to Run (Docker Compose)

Follow these steps to start the application locally:

### Step 1: Configure Environment
Copy the example environment file and adjust the variables if needed.

```bash
cp .env.example .env
# Open .env and adjust ENV_NAME if desired (default: local)
```

### Step 2: Start the Application
Use the Makefile shortcuts to manage the lifecycle of the app:

```bash
# Build and start services in the background
make up
```
```bash
# Follow container logs.
make logs 
```
```bash
# Stop and remove containers.
make down 
```
```bash
# Run a simple health check connectivity test.
make test 
```
## 3. Expected Outputs
Health Check
Verify the service is running and accessible:

```bash
curl -s http://localhost:8080/healthz
```
```bash 
# Expected JSON Output:
JSON
{"status":"ok","service":"app","env":"local"}
```

## 4. Bonus K8s

When you run a pipeline in GitLab (manually or via commit), GitLab Runner creates a separate Pod in Kubernetes for each step (build, test, deploy), but it collects code from GitHub.

<img width="828" height="74" alt="image" src="https://github.com/user-attachments/assets/822c4946-01eb-4006-96f1-32656f4cb8c5" />

Stage 1
<img width="727" height="552" alt="image" src="https://github.com/user-attachments/assets/77e5cd18-ab9f-48e2-bba4-682807038478" />
Stage 2
<img width="743" height="550" alt="image" src="https://github.com/user-attachments/assets/cbdfc9a7-f187-4642-a107-3fb086b4ae28" />
Stage 3
<img width="760" height="423" alt="image" src="https://github.com/user-attachments/assets/679fd1fc-c2f4-405d-97e1-d8166823db73" />














