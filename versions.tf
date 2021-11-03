terraform {
  required_version = ">= 1.0.0"
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~> 3.7.0"
    }
    artifactory = {
      source  = "registry.terraform.io/jfrog/artifactory"
      version = "2.6.15"
    }
  }
  backend "artifactory" {
    username = ""
    password = ""
    url      = "https://waquarkops.jfrog.io/artifactory"
    repo     = "generic-prod-local"
    subpath  = "terraform/states"
  }
}
