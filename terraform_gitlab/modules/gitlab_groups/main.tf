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
  for_each = toset( var.group_names )
  name                              = "wa-${each.key}"
  path                              = "wa-${each.key}"
  description                       = "WA ${each.key} group ${local.name}"
  require_two_factor_authentication = false
}

# Create a project in the example group
resource "gitlab_project" "wa-project" {
  for_each = gitlab_group.wa-group
  name         = "${each.value.name}-project"
  description  = "Project for ${each.value.name} group"
  namespace_id = each.value.id
}