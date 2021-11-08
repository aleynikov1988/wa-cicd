terraform {
  backend "artifactory" {
    url      = "https://waquarkops.jfrog.io/artifactory"
    repo     = "generic-prod-local"
    subpath  = "terraform/states"
  }
}

# Configure the GitLab Provider
provider "gitlab" {
  base_url = var.gitlab_url
}

module "gitlab_groups" {
  source       = "./modules/gitlab_groups"
  group_names  = var.group_names
  build_number = var.build_number
  env_type     = var.env_type
}