# Configure the GitLab Provider
provider "gitlab" {
  base_url = var.gitlab_url
  token    = var.gitlab_token
}

locals {
  name = "wa-${var.build_number}-${var.env_type}"
  tags = {
    Name        = local.name
    Owner       = "DepartmentName"
    Environment = var.env_type
  }
}

# Create resouces
resource "gitlab_group" "wa-group" {
  name                              = "wa-2710"
  path                              = "wa-2710"
  description                       = "WA 2710 group ${local.name}"
  require_two_factor_authentication = false
}

# Create a project in the example group
resource "gitlab_project" "wa-project" {
  name         = "wa-2710-project"
  description  = "An example project"
  namespace_id = gitlab_group.wa-group.id
}