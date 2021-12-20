variable "gitlab_url" {
  description = "Gilab url for deployment"
  type        = string
  default     = "https://gitlab.quarkops.com/api/v4"
}

variable "gitlab_token" {
  type = string
  default = "asdasdsaasdas"
}

variable "build_number" {
  type = string
}
variable "group_names" {
  type = list(any)
}

variable "env_type" {
  type = string
}
