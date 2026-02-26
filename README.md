# System Monitor

A simple Linux system monitoring tool containerized with Docker and automated using GitHub Actions.

- Monitors CPU usage
- Monitors memory usage
- Monitors disk usage
- Runs inside a Docker container
- Automatically built and pushed to DockerHub using CI/CD

# How It Works

# system_monitor.sh  
  This Bash script monitors your system’s CPU and memory usage.  
  - Prints CPU usage percentage  
  - Prints memory usage percentage  
  - Displays warnings when usage exceeds thresholds  

# Dockerfile
  Builds an image containing the system monitor script so it can run anywhere Docker is available.

# CI/CD Pipeline
  GitHub Actions workflow automatically:
  1. Checks out the code  
  2. Logs in to DockerHub securely using secrets  
  3. Builds the Docker image  
  4. Pushes the image to DockerHub  
  Trigger: **any push to the `main` branch**

# DockerHub Image

- Repository: [feyiwaves/system-monitor](https://hub.docker.com/r/feyiwaves/system-monitor)  
- Tags: `latest` (automatically updated on every push)

# Running the System Monitor

Pull the Docker image:

```bash
docker pull feyiwaves/system-monitor:latest