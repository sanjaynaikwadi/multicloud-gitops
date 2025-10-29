# 🚀 Hybrid & Multi-Cloud GitOps Deployment with Portworx and FlashArray

This repository provides a **GitOps-driven pattern** for managing **hybrid and multi-cloud deployments** across both public and private clouds, using **OpenShift**, **Portworx**, and **FlashArray** for dynamic storage provisioning.

---

## 🧭 Rationale

The main goals of this pattern are to:

- ✅ Implement a **GitOps** workflow for hybrid and multi-cloud management.  
- ✅ Enable **cross-cluster governance** and **application lifecycle management**.  
- ✅ Securely manage **secrets** and **storage configurations** across environments.

---

## 🧰 Prerequisites

Before starting, ensure you have the following on your **development machine**:

- [git](https://git-scm.com/downloads)
- [podman](https://podman.io/getting-started/)

> ⚠️ **Important:**  
> Your OpenShift cluster **must have a default `StorageClass`** configured before proceeding.  
> Without this, Portworx installation **will fail**.

---

## 💾 Tested Versions

| Component | Version | Notes |
|------------|----------|-------|
| **Portworx** | 3.4.0 | Tested on on-premises OpenShift cluster with internet access |
| **FlashArray** | — | Used for cloud drives via secrets |

---

## ⚙️ Configuration Files to Update

Before running the install command, review and (if needed) update these files:

| File | Purpose |
|------|----------|
| `values-hub.yaml` | Defines configuration for the **hub cluster** |
| `values-group-one.yaml` | Defines configuration for **managed clusters** or **cluster groups** |

> 📝 Both files are preconfigured with Portworx installation paths.  
> If you add new Helm charts or applications, update these files accordingly.

---

## 📦 Charts to Review / Update

All Portworx-related charts are under the `charts/all` directory.

### 1. `multipath-config-mc`
- Adds/updates the multipath configuration on worker nodes.
- Required for **FlashArray** integration.
- ⚠️ This chart will **drain and reboot** worker nodes.

### 2. `portworx-secrets`
- Defines **FlashArray endpoints** and credentials for provisioning cloud drives.
- Ensure all values are correct before deployment.

### 3. `portworx`
- Main Helm chart for Portworx installation.
- Update its `values.yaml` file to define:
  - Portworx version
  - Cloud provider type
  - Disk size, storage class, and related parameters

---

## 🔐 Logging into OpenShift

### GUI Access
1. Open the OpenShift Web Console.
2. Navigate to **OperatorHub**.
3. Install the **Validated Pattern Operator**.

### CLI Access
Login as an administrator using the OpenShift CLI:

```bash
oc login https://api.<your-cluster-domain>:6443 -u <admin-user> -p <password>


🧬 Installation Steps

1. Clone the Git repository:

```bash
git clone <repo-url>
cd <repo-directory>


2. Run the installation command:

```bash
./pattern.sh make install


3. Wait approximately 30 minutes for deployment to complete.

4. Verify installation:

Check that all operators are installed successfully.

Confirm Portworx is up and running in the cluster.
