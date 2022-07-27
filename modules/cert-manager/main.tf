resource "helm_release" "cert-manager" {
  name       = "cert-manager"
  namespace  = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "1.7.1"

  create_namespace = true
  wait             = true

  set {
    name  = "installCRDs"
    value = "true"
  }

}

