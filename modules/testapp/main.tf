resource "helm_release" "test-chart" {
  name      = "test-chart"
  chart     = "./modules/testapp/helm"
  namespace = "default"

  set {
    name  = "hostname"
    value = var.hostname
  }

  timeout = 60
}

variable "hostname" {
  type = string
}
