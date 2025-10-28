# 📦 Multicloud GitOps – Helm Charts (All)

This directory contains the **Helm charts** used to deploy and manage core components of the **Portworx**.  
It serves as a unified collection of charts that bootstrap and configure infrastructure, operators, and integrations across clusters.

---

## 🧭 Overview

The `charts/all` directory groups together multiple Helm charts that define different layers of the GitOps ecosystem — for example:
- Cluster operators (e.g., Portworx, GitOps, Monitoring)
- Supporting services and plugins
- Secrets, policies, and add-ons


---

## 📁 Directory Structure

- multipath-config-mc - Check and configure /etc/multipath.conf on all worker nodes
- portworx-secrets - Update this for your FlashArray deployement
- portworx - Define which version of Portworx needs to install.


📜 License

This project is licensed under the Apache 2.0 License

## 📚 References

- [Helm Documentation](https://helm.sh/docs/)
- [Argo CD GitOps Guide](https://argo-cd.readthedocs.io/)
- [OpenShift GitOps Operator Documentation](https://docs.openshift.com/container-platform/latest/cicd/gitops/gitops-release-notes.html)
- [Portworx Operator Reference](https://docs.portworx.com/portworx-enterprise)
