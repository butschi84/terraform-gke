
# ================================================================================
# optional modules
# ================================================================================


# nginx ingress controller
# ================================================================================
module "ingress-nginx" {
  source = "./modules/ingress-nginx/"
}

# cert manager (letsencrypt)
# ================================================================================
module "certmanager" {
  source = "./modules/cert-manager/"
}

# simple nginx container with an ingress
# (point your hostname / dns to the public ip of gke cluster 'ingress-loadbalancer-ip')
# ================================================================================
module "test_app" {
  source   = "./modules/testapp/"
  hostname = "test.test.opensight.ch"

  depends_on = [
    "module.ingress-nginx",
    "module.certmanager"
  ]
}

