<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| gitlab | ~> 3.7.0 |

## Providers

| Name | Version |
|------|---------|
| gitlab | ~> 3.7.0 |

## Resources

| Name | Type |
|------|------|
| [gitlab_group.wa-group](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/group) | resource |
| [gitlab_project.wa-project](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| build\_number | n/a | `string` | n/a | yes |
| env\_type | n/a | `string` | `"dev"` | no |
| group\_names | n/a | `list` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| group\_description\_list | n/a |
| project\_url\_list | n/a |
<!-- END_TF_DOCS -->