variable "project" {
  description = "The project ID to host the cluster in"
  type        = string
  default     = "gke-testprojekt"
}

variable "name" {
  description = "name of the kubernetes cluster"
  type        = string
  default     = "primary"
}

variable "region" {
  description = "The project ID to host the cluster in"
  type        = string
  default     = "europe-west6"
}


variable "location" {
  description = "location for k8s cluster"
  type        = string
  default     = "europe-west6-a"
}

variable "nodecount" {
  description = "number of nodes"
  type        = number
  default     = 1
}

variable "nodetype" {
  description = "type of nodes"
  type        = string
  default     = "n1-standard-1"
  # default = "e2-micro"
}

variable "whitelist-ips" {
  description = "ip's allowed to access k8s controlplane"
  type        = list(string)
  default     = ["111.111.111.111/32"]
}
