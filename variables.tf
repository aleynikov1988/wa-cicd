variable "gitlab_url" {
  description = "Gilab url for deployment"
  type        = string
  default     = "https://gitlab.quarkops.com/api/v4"
}

variable "gitlab_token" {
  description = "Gilab token"
  type        = string
}

variable "build_number" {
  type        = string
}

variable "env_type" {
  type        = string
  default     = "dev"
}
