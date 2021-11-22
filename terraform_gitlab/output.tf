# Groups and Projects Outputs
output "groups_info" {
  value = {
    projects_url_list = module.gitlab_groups.project_url_list
    groups_description_list  = module.gitlab_groups.project_url_list
  }
}