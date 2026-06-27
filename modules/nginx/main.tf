terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  name  = "nginx-${var.env}"
  image = docker_image.nginx.image_id

  ports {
    external = var.nginx_port
    internal = 80
  }
}
