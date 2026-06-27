terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {
  context = var.docker_context
}

locals {
  env        = terraform.workspace == "default" ? "prod" : format("prod-%s", terraform.workspace)
  nginx_port = terraform.workspace == "default" ? 58080 : 58081
}

module "nginx" {
  source     = "../../modules/nginx"
  env        = local.env
  nginx_port = local.nginx_port
}
