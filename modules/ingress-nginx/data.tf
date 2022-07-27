data "kubernetes_service" "nginx_ingress_controller" {
  depends_on = [helm_release.nginx_ingress]

  metadata {
    name      = "${helm_release.nginx_ingress.metadata[0].name}-${helm_release.nginx_ingress.namespace}-controller"
    namespace = helm_release.nginx_ingress.metadata[0].namespace
  }
}
