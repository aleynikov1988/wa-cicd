output "project_url_list" {
  value = values(gitlab_project.wa-project)[*].web_url
}
output "group_description_list" {
  value = values(gitlab_group.wa-group)[*].description
}