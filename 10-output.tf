output "ingress-loadbalancer-ip" {
  description = "load balancer ip"
  value       = module.ingress-nginx.load_balancer_ip
}

output "kubernetes-public-endpoint" {
  value = "https://${google_container_cluster.primary.endpoint}"
}
