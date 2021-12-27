# Basic infra

Setup env vars for provider or backendWindows

```
Set-Item -Path Env:GITLAB_TOKEN -Value ("")
$env:ARTIFACTORY_USERNAME  = 'alxspzv@gmail.com'
$env:ARTIFACTORY_PASSWORD  = '2!6MXkez8Phf9UZ'

```

Generate docs:

```
terraform-docs -c .\.terraform-docs.yml .
```

Code example:

```
terraform plan -var="build_number=1.0.11" -var-file="./envs/2710.tfvars" -out wa.tfplan
terraform plan -var="build_number=1.0.11" -var-file="./envs/2710.tfvars" -out wa.tfplan --destroy
```

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name        | Version  |
| ----------- | -------- |
| terraform   | >= 1.0.0 |
| artifactory | 2.6.15   |
| gitlab      | ~> 3.7.0 |

## Modules

| Name           | Source                  | Version |
| -------------- | ----------------------- | ------- |
| gitlab\_groups | ./modules/gitlab_groups | n/a     |

## Inputs

| Name          | Description              | Type          | Default                                  | Required |
| ------------- | ------------------------ | ------------- | ---------------------------------------- | :------: |
| build\_number | n/a                      | `string`    | n/a                                      |   yes   |
| env\_type     | n/a                      | `string`    | n/a                                      |   yes   |
| gitlab\_url   | Gilab url for deployment | `string`    | `"https://gitlab.quarkops.com/api/v4"` |    no    |
| group\_names  | n/a                      | `list(any)` | n/a                                      |   yes   |

## Outputs

| Name         | Description                 |
| ------------ | --------------------------- |
| groups\_info | Groups and Projects Outputs |

<!-- END_TF_DOCS -->
