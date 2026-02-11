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

### Option 1: Using Helm (Recommended) ⭐

#### 1️⃣ Start Minikube
```bash
minikube start
```

#### 2️⃣ Create Namespace (optional, Helm can create it)
```bash
kubectl create namespace project
```

#### 3️⃣ Install using Helm
```bash
helm install learning-platform helm-chart/ -n project --create-namespace
```

#### 4️⃣ Verify Installation
```bash
helm list -n project
kubectl get all -n project
```

#### 5️⃣ Upgrade (if needed)
```bash
helm upgrade learning-platform helm-chart/ -n project
```

#### 6️⃣ Uninstall
```bash
helm uninstall learning-platform -n project
```

---

### Option 2: Using kubectl (Manual)

#### 1️⃣ Start Minikube

```bash
minikube start
```

#### 2️⃣ Enable Ingress

```bash
minikube addons enable ingress
```

#### 3️⃣ Create Namespace

```bash
kubectl create namespace project
```

#### 4️⃣ Apply Kubernetes Manifests

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

### Using Helm

```bash
helm status learning-platform -n project
helm list -n project
```

### Using kubectl

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

If you want to use the hostnames defined in `ingress.yaml` (digilians.local and api.digilians.local), add them to your `/etc/hosts` mapped to the Minikube IP. Example:

```bash
echo "$(minikube ip) digilians.local api.digilians.local" | sudo tee -a /etc/hosts
```

If your images are private, create an image pull secret and reference it in the deployments before applying manifests.

---

## 📦 Helm Chart

The project includes a **production-ready Helm Chart** for easy deployment and management.

### Helm Chart Structure

```
helm-chart/
├── Chart.yaml                      # Chart metadata
├── values.yaml                     # Default values
└── templates/
    ├── namespace.yaml
    ├── configmap.yaml
    ├── secret.yaml
    ├── nginx-configmap.yaml
    ├── frontend-deployment.yaml
    ├── frontend-service.yaml
    ├── backend-deployment.yaml
    ├── backend-service.yaml
    ├── postgres-statefulset.yaml
    ├── postgres-service.yaml
    └── postgres-headless-service.yaml
```

### Customizing Helm Values

Edit `helm-chart/values.yaml` to customize:

```yaml
# Replicas
backend.replicaCount: 2
frontend.replicaCount: 2
postgres.replicaCount: 1

# Images
backend.image.tag: backend
frontend.image.tag: frontend

# Resource limits
backend.resources.limits.memory: 512Mi
frontend.resources.limits.memory: 256Mi

# Database credentials
secret.DB_USER: admin
secret.DB_PASSWORD: admin123

# Port configuration
frontend.service.nodePort: 30681
```

### Useful Helm Commands

```bash
# Lint chart for errors
helm lint helm-chart/

# Dry-run (preview changes)
helm install learning-platform helm-chart/ -n project --dry-run

# View rendered templates
helm template learning-platform helm-chart/ -n project

# Check values being used
helm values learning-platform -n project

# Get release history
helm history learning-platform -n project

# Rollback to previous version
helm rollback learning-platform 1 -n project
```

---

## ✅ Kubernetes Concepts Used

- Deployments with RollingUpdate strategy
- StatefulSets with PersistentVolumes
- Services (ClusterIP, Headless, NodePort)
- ConfigMaps for configuration management
- Secrets for sensitive data
- Init Containers for dependency management
- Persistent Volumes & PersistentVolumeClaims
- StorageClass for dynamic provisioning
- Ingress for external access
- Namespace Isolation
- Liveness & Readiness Probes
- Resource Requests & Limits
- Helm Charts for package management

---

## 🐛 Troubleshooting

### Backend Pod Crashing (CrashLoopBackOff)

**Problem:** Backend pods crash because they try to connect to PostgreSQL before it's ready.

**Solution:** The chart includes an `initContainer` that waits for PostgreSQL to be ready:

```yaml
initContainers:
  - name: wait-for-db
    image: busybox:1.35
    command: ['sh', '-c', 'until nc -z db 5432; do echo waiting for postgres...; sleep 2; done;']
```

### Frontend Cannot Reach Backend

**Problem:** `host not found in upstream "backend"`

**Solution:** Updated `nginx.conf` to use the proper service name:

```nginx
location /api {
    proxy_pass http://backend-svc:8000;
}
```

The chart uses a `ConfigMap` for nginx configuration:

```yaml
volumeMounts:
  - name: nginx-config
    mountPath: /etc/nginx/conf.d/
volumes:
  - name: nginx-config
    configMap:
      name: nginx-config
```

### PostgreSQL Pod Stuck in Pending

**Problem:** `PersistentVolumeClaim bound to non-existent persistentvolume`

**Solution:** Delete the old PVC and let Kubernetes create a new one:

```bash
kubectl delete pvc postgres-storage-postgres-0 -n project
kubectl delete pod postgres-0 -n project
```

The StatefulSet will automatically recreate the pod with a new PVC.

### Check Pod Logs

```bash
# Check specific pod logs
kubectl logs -n project <pod-name>

# Watch logs in real-time
kubectl logs -n project <pod-name> -f

# Check all containers in a pod
kubectl logs -n project <pod-name> --all-containers
```

---

## 🎯 Learning Outcomes

- ✅ Containerized full-stack application deployment
- ✅ Kubernetes production-like infrastructure setup
- ✅ Persistent data management with StatefulSets
- ✅ Secure configuration using ConfigMaps & Secrets
- ✅ Service-to-service communication
- ✅ Init containers for dependency management
- ✅ Helm charts for package management & templating
- ✅ Rolling updates and deployment strategies
- ✅ Pod health checks (liveness & readiness probes)
- ✅ Resource management and optimization

---

## 📌 Notes

- This project is designed for **learning and practice purposes** with a focus on **production-ready patterns**.
- The Helm chart is **fully parameterized** and can be easily customized for different environments.
- All services communicate via **service discovery** (DNS-based).

### Future Enhancements

- [ ] Horizontal Pod Autoscaling (HPA)
- [ ] Network Policies for traffic control
- [ ] RBAC (Role-Based Access Control)
- [ ] Monitoring with Prometheus & Grafana
- [ ] Logging with ELK Stack or Loki
- [ ] GitOps workflow with ArgoCD
- [ ] Multi-environment setup (dev, staging, prod)

---

## 📚 Resources

- [Kubernetes Official Docs](https://kubernetes.io/docs/)
- [Helm Official Docs](https://helm.sh/docs/)
- [Minikube Getting Started](https://minikube.sigs.k8s.io/)
- [Docker Documentation](https://docs.docker.com/)

---

## 👨‍💻 Author

**Kareem Assem**\
DevOps Engineer | Kubernetes Specialist

📧 For questions or improvements, feel free to contribute!

---

## 📝 Version History

| Version | Date | Changes |
|---------|------|---------|
| 2.0 | Feb 11, 2026 | Added Helm Chart, fixed init containers, improved troubleshooting |
| 1.0 | Jan 26, 2026 | Initial project setup with kubectl manifests |

