# High-Load Application with Nginx Rate Limiting

This project demonstrates a Dockerized application served behind an Nginx proxy with Rate Limiting enabled. It includes a setup for local development using Docker Compose and a bonus configuration for Kubernetes (Kind).

## 1. Prerequisites

Before running the project, ensure you have the following installed:

**Required:**
* [Docker](https://docs.docker.com/get-docker/)
* [Docker Compose](https://docs.docker.com/compose/install/) (or `docker compose` plugin)
* `make` (usually installed on Linux/macOS; for Windows use WSL or Git Bash)

**For Kubernetes (Bonus):**
* [Kind](https://kind.sigs.k8s.io/) (Kubernetes in Docker)
* [kubectl](https://kubernetes.io/docs/tasks/tools/)
* [Helm](https://helm.sh/)

---

## 2. How to Run (Docker Compose)

Follow these steps to start the application locally:

### Step 1: Configure Environment
Copy the example environment file and adjust the variables if needed.
```bash
cp .env.example .env
// Open .env and adjust ENV_NAME if desired (default: local)

### Step 2: Start the Application
Use the Makefile shortcuts to manage the lifecycle of the app:

```bash
# Build and start services in the background
make up



