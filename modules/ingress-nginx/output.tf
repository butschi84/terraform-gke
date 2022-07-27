
output "load_balancer_ip" {
  description = "IP address of the load balancer"
  value       = data.kubernetes_service.nginx_ingress_controller.status.0.load_balancer.0.ingress.0.ip
}
