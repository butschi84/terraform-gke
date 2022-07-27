# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project = var.project
  region  = var.region
}

terraform {
  required_providers {
    google = ">= 4.0"
  }
}

provider "helm" {
  kubernetes {
    token                  = data.google_client_config.current.access_token
    host                   = "https://${google_container_cluster.primary.endpoint}"
    cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
  }
}

provider "kubernetes" {
  host                   = "https://${google_container_cluster.primary.endpoint}"
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
  token                  = data.google_client_config.current.access_token
}
