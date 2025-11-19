# Jenkins 101 — Team SkyOps

![Jenkins](https://img.shields.io/badge/Jenkins-Automation-red?logo=jenkins&logoColor=white)
![Build](https://img.shields.io/badge/Build-Passing-brightgreen)
![Platform](https://img.shields.io/badge/Platform-AWS%20EC2-orange)
![Level](https://img.shields.io/badge/Level-Beginner-blue)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

---

## Overview

Welcome to **Jenkins 101**, created by **Team SkyOps**.  
This guide helps beginners rapidly understand **Jenkins installation, setup, and CI/CD basics** using an AWS EC2 instance.

If you're new to DevOps, this is your starting point to master one of the most widely used automation tools on the planet.

---

## What You Will Learn

- What Jenkins is and how it works  
- How to install Jenkins on Amazon Linux  
- How to install Java (required for Jenkins)  
- How to access Jenkins in your browser  
- How to install plugins  
- How to write your first Jenkins pipeline  
- How to run builds and troubleshoot queue issues  

---

## Jenkins Architecture (Simple)

```

Developer → GitHub → Jenkins → Build/Deploy → AWS/Server

```

---

## Prerequisites

Before starting, you must have:

- An **AWS EC2 Instance** (Amazon Linux 2 Recommended)
- Security Group with inbound rule:
```

Port 8080 → 0.0.0.0/0

````
- Internet connectivity
- SSH access to your EC2 instance

---

# Jenkins Installation Guide (Amazon Linux 2)

Follow these commands step-by-step:



## Update Your System
```bash
sudo yum update -y
````

---

## Install Java (Required for Jenkins)

```bash
sudo yum install java-amazon -y
```

Verify Java:

```bash
java -version
```

---

## 3 Add Jenkins Repository

```bash
sudo tee /etc/yum.repos.d/jenkins.repo<<EOF
[jenkins]
name=Jenkins-stable
baseurl=https://pkg.jenkins.io/redhat-stable/
gpgcheck=1
gpgkey=https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
EOF
```

---

## 4 Install Jenkins

```bash
sudo yum install jenkins -y
```

---

## 5 Start and Enable Jenkins

```bash
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
```

You should see:
**active (running)**

---

## 6 Access Jenkins in Browser

Open:

```
http://<EC2-Public-IP>:8080
```

---

## 7 Get Initial Admin Password

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Copy → Paste → Continue setup.

---

# Installing Plugins

Inside Jenkins:

```
Dashboard → Manage Jenkins → Plugins
```

Install:

* Git
* GitHub
* Pipeline
* Blue Ocean (optional)
* Credentials Binding

---

# First Jenkins Pipeline

Create a pipeline job → Add this **Jenkinsfile**:

```groovy
pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo "Welcome to Jenkins 101 by Team SkyOps!"
            }
        }
    }
}
```

Run → You’ll see logs in console output.

---

# Troubleshooting (Common Issues)

### Pipeline stuck in queue

Cause: Not enough executors
Fix:

```
Manage Jenkins → Nodes → Built-In Node → Number of Executors = 2
```

---

### Jenkins offline

Fix:

```
Dashboard → Build Executor Status → Mark as online
```

---

### Cannot access Jenkins

Fix: Open security group port `8080`

---

### Disk full

Fix:

* Clean `/tmp` and `/var/lib/jenkins/workspace`
* Or expand EC2 EBS volume

---

# Team SkyOps — Vision

We build tools, pipelines, and cloud infrastructure with:

* Simplicity
* Automation
* Reliability
* Zero BS

---

# Author

**Team SkyOps**
Cloud | DevOps | Automation Training

---

# Enjoy Jenkins 101

If you want a **Jenkins + Terraform Pipeline**, **GitHub Webhooks Setup**, or **Multi-Environment CI/CD**, let us know — we’ll add it to SkyOps 102/201!

