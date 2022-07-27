resource "helm_release" "clusterissuer" {
  depends_on = [
    helm_release.cert-manager
  ]
  name      = "cluster-issuer"
  chart     = "./modules/cert-manager/helm"
  namespace = "cert-manager"
}
