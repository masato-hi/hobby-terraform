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
  env        = "stg"
  nginx_port = 59080
}

module "nginx" {
  source     = "../../modules/nginx"
  env        = local.env
  nginx_port = local.nginx_port
}
