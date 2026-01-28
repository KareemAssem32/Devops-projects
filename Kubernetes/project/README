# Kubernetes Full Stack Project (DevOps)

## 📌 Project Overview

This project demonstrates deploying a **full‑stack application** on **Kubernetes** using best DevOps practices.\
The application consists of:

- **Frontend** application
- **Backend API**
- **PostgreSQL database**

All components are deployed inside Kubernetes using different objects such as **Deployments, StatefulSets, Services, ConfigMaps, Secrets, Ingress, PVC, StorageClass, and RBAC‑ready structure**.

The project is designed to run on **Minikube** and can be easily adapted to any Kubernetes cluster.

---

## 🧱 Project Architecture

```
User
  │
  ▼
Ingress
  │
  ▼
Frontend Service ──► Frontend Pod (Deployment)
  │
  ▼
Backend Service ──► Backend Pod (Deployment)
  │
  ▼
PostgreSQL Service ──► PostgreSQL Pod (StatefulSet + PVC)
```

---

## 📂 Kubernetes Manifests

### 1️⃣ Backend

- **backend-deployment.yaml**\
  Deploys the backend API using a Kubernetes Deployment with multiple replicas.

- **backend-svc.yaml**\
  Exposes the backend internally using a ClusterIP service.

---

### 2️⃣ Frontend

- **frontend-deployment.yaml**\
  Deploys the frontend application using a Kubernetes Deployment.

- **frontend-svc.yaml**\
  Exposes the frontend internally to be used by Ingress.

---

### 3️⃣ Database (PostgreSQL)

- **statefulset.yaml**\
  Deploys PostgreSQL as a StatefulSet to ensure stable network identity and persistent storage.

- **service.yaml**\
  Headless service for PostgreSQL communication.

---

### 4️⃣ Configuration & Secrets

- **configmap.yaml**\
  Stores non‑sensitive configuration data (environment variables).

- **secret.yaml**\
  Stores sensitive information such as database credentials.

---

### 5️⃣ Storage

- **storageclass.yaml**\
  Defines a custom StorageClass (Rancher‑compatible / Minikube supported).

- **pvc.yaml**\
  PersistentVolumeClaim used by PostgreSQL for data persistence.

---

### 6️⃣ Networking

- **ingress.yaml**\
  Exposes the application externally using Ingress and routes traffic to frontend and backend services.

---

## 🚀 How to Run the Project (Minikube)

### 1️⃣ Start Minikube

```bash
minikube start
```

### 2️⃣ Enable Ingress

```bash
minikube addons enable ingress
```

### 3️⃣ Create Namespace

```bash
kubectl create namespace project
```

### 4️⃣ Apply Kubernetes Manifests

```bash
kubectl apply -n project -f storageclass.yaml
kubectl apply -n project -f pvc.yaml
kubectl apply -n project -f secret.yaml
kubectl apply -n project -f configmap.yaml
kubectl apply -n project -f statefulset.yaml
kubectl apply -n project -f service.yaml
kubectl apply -n project -f backend-deployment.yaml
kubectl apply -n project -f backend-svc.yaml
kubectl apply -n project -f frontend-deployment.yaml
kubectl apply -n project -f frontend-svc.yaml
kubectl apply -n project -f ingress.yaml
```

---

## 🔍 Verify Deployment

```bash
kubectl get all -n project
kubectl get ingress -n project
```

---

## 🌐 Access the Application

Get Minikube IP:

```bash
minikube ip
```

Then open in browser:

```
http://<MINIKUBE_IP>
```

---

## ✅ Kubernetes Concepts Used

- Deployments
- StatefulSets
- Services (ClusterIP & Headless)
- ConfigMaps
- Secrets
- Persistent Volumes & PVC
- StorageClass
- Ingress
- Namespace Isolation

---

## 🎯 Learning Outcomes

- Containerized full‑stack application
- Kubernetes production‑like setup
- Persistent database handling
- Secure configuration management
- Ingress‑based traffic routing

---

## 📌 Notes

- This project is designed for **learning and practice purposes**.
- Can be extended with:
  - HPA
  - Network Policies
  - Resource Limits
  - Liveness & Readiness Probes

---

## 👨‍💻 Author

**Kareem Assem**\
DevOps Eng

