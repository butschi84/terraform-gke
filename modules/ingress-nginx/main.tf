

resource "kubernetes_namespace" "ingress-nginx" {
  metadata {
    name = "ingress-nginx"
  }
}

resource "helm_release" "nginx_ingress" {
  name          = "nginx-ingress"
  repository    = "https://kubernetes.github.io/ingress-nginx"
  chart         = "ingress-nginx"
  force_update  = true
  namespace     = "ingress-nginx"
  recreate_pods = true
  reuse_values  = true

  depends_on = [
    kubernetes_namespace.ingress-nginx
  ]

  values = [<<EOF
    controller:
      admissionWebhooks:
        enabled: false
      autoscaling:
        enabled: true
        minReplicas: 1
        maxReplicas: 2
        targetCPUUtilizationPercentage: 75
        targetMemoryUtilizationPercentage: 75
      config:
        use-forwarded-headers: "true"
      publishService:
        enabled: "true"
      resources:
        limits:
          cpu: 200m
          memory: 128Mi
        requests:
          cpu: 100m
          memory: 64Mi
      service:
        # loadBalancerIP: ""
        annotations:
          service.beta.kubernetes.io/external-traffic: OnlyLocal
        externalTrafficPolicy: "Local"
    defaultBackend:
      service:
        annotations:
          kubernetes.io/ingress.class: "nginx"
          nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
          nginx.ingress.kubernetes.io/from-to-www-redirect: "true"
          nginx.ingress.kubernetes.io/ssl-redirect: "true"
    EOF
  ]
}
